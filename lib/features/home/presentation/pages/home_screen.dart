import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/widgets/bottom_nav_bar.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/services/notification_service.dart';
import 'package:wellmom_app/features/auth/presentation/providers/auth_providers.dart';
import 'package:wellmom_app/features/chat/presentation/pages/konsul_chat_screen.dart';
import 'package:wellmom_app/features/home/presentation/providers/home_providers.dart';
import 'package:wellmom_app/features/home/data/models/ibu_hamil_perawat_model.dart';
import 'package:wellmom_app/features/home/data/models/puskesmas_detail_model.dart';
import 'package:wellmom_app/features/home/presentation/viewmodels/home_view_model.dart';

/// Helper to construct full image URL from relative path
String _getImageUrl(String? relativePath) {
  if (relativePath == null || relativePath.isEmpty) return '';
  if (relativePath.startsWith('http://') || relativePath.startsWith('https://')) {
    return relativePath;
  }
  const baseUrl = 'http://103.191.92.29:8000';
  return '$baseUrl$relativePath';
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(homeViewModelProvider.notifier).fetchHome();
      // Sinkronisasi FCM token ke backend saat HomeScreen dimuat
      _syncFcmTokenToBackend();
    });
  }

  /// Handle notification permission request
  Future<void> _handleNotificationPermission(BuildContext context) async {
    try {
      final notificationService = NotificationService();
      final currentStatus = await notificationService.getNotificationPermissionStatus();
      
      debugPrint('[HomeScreen] Current notification permission status: $currentStatus');
      
      if (currentStatus == AuthorizationStatus.authorized ||
          currentStatus == AuthorizationStatus.provisional) {
        // Permission sudah diberikan - show test notification
        if (context.mounted) {
          // Show test notification to verify it works
          await notificationService.showTestNotification();
          
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Izin notifikasi sudah diberikan. Notifikasi test telah dikirim.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
        return;
      }

      // Request permission
      if (context.mounted) {
        final granted = await showDialog<bool>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: const Text('Izin Notifikasi'),
            content: const Text(
              'WellMom memerlukan izin notifikasi untuk mengirimkan informasi penting tentang kesehatan kehamilan Anda, seperti perubahan status risiko dan pesan dari perawat.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: const Text('Nanti'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(dialogContext).pop(true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Izinkan'),
              ),
            ],
          ),
        );

        if (granted == true && context.mounted) {
          final result = await notificationService.requestNotificationPermission();
          
          if (context.mounted) {
            if (result) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Izin notifikasi berhasil diberikan'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            } else {
              // Permission ditolak, arahkan ke settings
              showDialog(
                context: context,
                builder: (settingsContext) => AlertDialog(
                  title: const Text('Izin Diperlukan'),
                  content: const Text(
                    'Untuk menerima notifikasi, silakan aktifkan izin notifikasi di Pengaturan perangkat Anda.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(settingsContext).pop(),
                      child: const Text('Batal'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.of(settingsContext).pop();
                        // Buka settings untuk Android
                        final androidUri = Uri.parse('app-settings:');
                        if (await canLaunchUrl(androidUri)) {
                          await launchUrl(androidUri);
                        } else {
                          // Fallback untuk iOS atau jika tidak bisa buka settings
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Silakan buka Pengaturan > Aplikasi > WellMom > Notifikasi'),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Buka Pengaturan'),
                    ),
                  ],
                ),
              );
            }
          }
        }
      }
    } catch (e) {
      debugPrint('[HomeScreen] Error handling notification permission: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Terjadi kesalahan: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  /// Sinkronisasi FCM token ke backend
  Future<void> _syncFcmTokenToBackend() async {
    try {
      final fcmToken = await NotificationService().getCurrentFcmToken();
      if (fcmToken != null && fcmToken.isNotEmpty) {
        final authRepository = ref.read(authRepositoryProvider);
        final result = await authRepository.updateFcmToken(fcmToken);
        result.fold(
          (failure) {
            debugPrint('[HomeScreen] Failed to update FCM token: ${failure.message}');
            // Don't show error to user, just log it
          },
          (_) {
            print("DEBUG: FCM Token sent to backend: $fcmToken");
            debugPrint('[HomeScreen] FCM token updated successfully');
          },
        );
      } else {
        debugPrint('[HomeScreen] FCM token is null or empty, skipping update');
      }
    } catch (e) {
      debugPrint('[HomeScreen] Error updating FCM token: $e');
      // Don't show error to user, just log it
    }
  }

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        // Already on home
        break;
      case 1:
        Navigator.of(context).pushReplacementNamed(AppRouter.history);
        break;
      case 2:
        Navigator.of(context).pushReplacementNamed(AppRouter.monitor);
        break;
      case 3:
        Navigator.of(context).pushReplacementNamed(AppRouter.konsul);
        break;
      case 4:
        Navigator.of(context).pushReplacementNamed(AppRouter.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);
    print('HomeScreen: build() - isLoading: ${state.isLoading}, error: ${state.error}');
    print('HomeScreen: build() - ibuHamil: ${state.ibuHamil?.namaLengkap ?? "null"}');
    print('HomeScreen: build() - puskesmas: ${state.puskesmas?.name ?? "null"}');
    
    // Show error if any
    if (state.error != null) {
      print('HomeScreen: ERROR in state: ${state.error}');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${state.error}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      });
    }
    
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: state.isLoading && state.ibuHamil == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  await ref.read(homeViewModelProvider.notifier).refreshHome();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Section
                      _buildHeader(state),
                      const SizedBox(height: 16),
                      // Countdown Card (using ibuHamilMeProvider for fresh data)
                      _buildCountdownCard(),
                      const SizedBox(height: 16),
                      // Low Risk Card
                      _buildRiskCard(state),
                      const SizedBox(height: 24),
                      // Metrik Kesehatan
                      _buildMetrikKesehatan(state),
                      const SizedBox(height: 24),
                      // Puskesmas Anda
                      _buildPuskesmasSection(state),
                      const SizedBox(height: 24),
                      // Catatan Perawat
                      _buildCatatanPerawat(state),
                      const SizedBox(height: 100), // Bottom padding for nav bar
                    ],
                  ),
                ),
              ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }

  Widget _buildHeader(HomeState state) {
    final ibu = state.ibuHamil;
    final name = ibu?.namaLengkap ?? 'Ibu Hamil';
    final week = ibu?.usiaKehamilan;
    final trimester = _getTrimester(week);
    final subtitle = (week != null)
        ? 'MINGGU KE-$week (TRIMESTER $trimester)'
        : 'Lengkapi data kehamilan';
    final photo = ibu?.profilePhotoUrl;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
            ),
            child: photo != null && photo.isNotEmpty
                ? ClipOval(
                    child: Image.network(
                      _getImageUrl(photo),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade300,
                          child: const Icon(
                            Icons.person,
                            color: Colors.grey,
                            size: 30,
                          ),
                        );
                      },
                    ),
                  )
                : Container(
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
          ),
          const SizedBox(width: 12),
          // Name and week info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, $name!',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ],
            ),
          ),
          // Chat Icon (ke konsul chat dengan perawat)
          IconButton(
            onPressed: () async {
              // Gunakan state dulu; jika perawat belum ada, ambil dari provider (fetch terbaru)
              var perawatData = state.ibuHamilPerawat;
              if (perawatData == null) {
                try {
                  perawatData = await ref.read(ibuHamilPerawatProvider.future);
                } catch (_) {
                  perawatData = null;
                }
              }
              final perawat = perawatData?.perawat;
              if (perawatData?.hasPerawat == true && perawat != null) {
                if (context.mounted) {
                  Navigator.of(context).pushNamed(
                    AppRouter.konsulChat,
                    arguments: KonsulChatArgs(
                      perawatId: perawat.id,
                      perawatName: perawat.namaLengkap,
                      perawatPhotoUrl: perawat.profilePhotoUrl,
                    ),
                  );
                }
              } else {
                if (context.mounted) {
                  Navigator.of(context).pushNamed(AppRouter.konsul);
                }
              }
            },
            icon: const Icon(Icons.chat_bubble_outline_rounded, color: AppColors.textDark, size: 22),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(8),
            ),
          ),
          const SizedBox(width: 8),
          // Notification Icon
          GestureDetector(
            onTap: () => _handleNotificationPermission(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  const Center(
                    child: Icon(
                      Icons.notifications_outlined,
                      color: AppColors.textDark,
                      size: 22,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownCard() {
    final ibuAsync = ref.watch(ibuHamilMeProvider);
    
    return ibuAsync.when(
      loading: () => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFFFF0F5),
              const Color(0xFFFFE4EC),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.pink.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (_, __) => const SizedBox.shrink(),
      data: (ibu) {
        final due = ibu?.estimatedDueDate;
        final week = ibu?.usiaKehamilan;
        final remainingDays = (due != null)
            ? due.difference(DateTime.now()).inDays
            : null;
        final remainingWeeks = (remainingDays != null)
            ? (remainingDays / 7).ceil().clamp(0, 40)
            : null;
        final progress = (week != null) ? (week / 40).clamp(0.0, 1.0) : 0.0;

        final title = 'Countdown Persalinan';
        final valueText = remainingWeeks != null
            ? '$remainingWeeks Minggu lagi'
            : 'HPL belum tersedia';
        
        return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFFFF0F5),
            const Color(0xFFFFE4EC),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFE91E63),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            valueText,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 20),
          // Progress Bar
          Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFFFF6B9D),
                        const Color(0xFFFE8FA4),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '0 MINGGU',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFFF6B9D),
                ),
              ),
              Text(
                '40 MINGGU',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFFF6B9D),
                ),
              ),
            ],
          ),
        ],
      ),
        );
      },
    );
  }

  Widget _buildRiskCard(HomeState state) {
    final risk = state.ibuHamil?.riskLevel;
    Color bg;
    Color iconBg;
    Color iconColor;
    IconData icon;
    String title;
    String desc;

    // Normalize risk level (handle both Indonesian and English)
    final riskLower = risk?.toLowerCase() ?? '';
    
    if (riskLower == 'rendah' || riskLower == 'low') {
      bg = const Color(0xFFE8F5F3);
      iconBg = const Color(0xFFD1F2EB);
      iconColor = const Color(0xFF27AE60);
      icon = Icons.verified_user;
      title = 'Risiko Rendah';
      desc = 'Kondisi baik. Tetap jaga pola makan, istirahat, dan kontrol rutin.';
    } else if (riskLower == 'sedang' || riskLower == 'normal' || riskLower == 'medium') {
      bg = const Color(0xFFFFF4E5);
      iconBg = const Color(0xFFFFE0B2);
      iconColor = const Color(0xFFF57C00);
      icon = Icons.warning_amber;
      title = 'Risiko Sedang';
      desc = 'Perlu perhatian. Ikuti arahan perawat dan pantau kondisi secara berkala.';
    } else if (riskLower == 'tinggi' || riskLower == 'high') {
      bg = const Color(0xFFFFEBEE);
      iconBg = const Color(0xFFFFCDD2);
      iconColor = const Color(0xFFC62828);
      icon = Icons.dangerous;
      title = 'Risiko Tinggi';
      desc = 'Segera konsultasi dengan tenaga medis. Prioritaskan kunjungan ke fasilitas kesehatan.';
    } else {
      bg = const Color(0xFFE3F2FD);
      iconBg = const Color(0xFFBBDEFB);
      iconColor = const Color(0xFF1976D2);
      icon = Icons.info_outline;
      title = 'Menunggu Pemeriksaan';
      desc = 'Risiko belum ditentukan. Silakan jadwalkan pemeriksaan dengan perawat.';
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetrikKesehatan(HomeState state) {
    final healthRecord = state.latestHealthRecord;
    final hasNoData = healthRecord == null;
    
    // Format last update time from created_at (waktu record disimpan) agar sesuai data backend
    String lastUpdateText = 'Belum ada data';
    String lastUpdateDetail = '';
    if (healthRecord?.createdAt != null) {
      final recordTime = healthRecord!.createdAt.toLocal();
      final now = DateTime.now();
      final difference = now.difference(recordTime);
      
      final dateFormat = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');
      final timeFormat = DateFormat('HH:mm', 'id_ID');
      final formattedDate = dateFormat.format(recordTime);
      final formattedTime = timeFormat.format(recordTime);
      
      if (difference.inDays == 0) {
        lastUpdateText = 'Pengecekan terakhir: Hari ini';
        lastUpdateDetail = 'pada pukul $formattedTime';
      } else if (difference.inDays == 1) {
        lastUpdateText = 'Pengecekan terakhir: Kemarin';
        lastUpdateDetail = 'pada pukul $formattedTime';
      } else if (difference.inDays < 7) {
        lastUpdateText = 'Pengecekan terakhir: ${difference.inDays} hari lalu';
        lastUpdateDetail = '$formattedDate, $formattedTime';
      } else {
        lastUpdateText = 'Pengecekan terakhir';
        lastUpdateDetail = '$formattedDate, $formattedTime';
      }
    }
    
    // Get values from health record
    final systolic = healthRecord?.bloodPressureSystolic;
    final diastolic = healthRecord?.bloodPressureDiastolic;
    final bloodPressureText = (systolic != null && diastolic != null)
        ? '$systolic/$diastolic'
        : '-';
    
    final weight = healthRecord?.weight;
    final weightText = weight != null
      ? weight.toStringAsFixed(1)
      : '-';
    
    final bodyTemp = healthRecord?.bodyTemperature;
    final bodyTempText = bodyTemp != null
        ? bodyTemp.toStringAsFixed(1)
        : '-';
    
    final heartRate = healthRecord?.heartRate;
    final heartRateText = heartRate != null
        ? heartRate.toString()
        : '-';
    
    // Determine if values are normal (simplified logic)
    final isBpNormal = systolic != null && diastolic != null &&
        systolic >= 90 && systolic <= 140 &&
        diastolic >= 60 && diastolic <= 90;
    final isWeightNormal = weight != null;
    final isTempNormal = bodyTemp != null && bodyTemp >= 36.0 && bodyTemp <= 37.5;
    final isHrNormal = heartRate != null && heartRate >= 60 && heartRate <= 100;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Metrik Kesehatan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              if (!hasNoData)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      lastUpdateText,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (lastUpdateDetail.isNotEmpty)
                      Text(
                        lastUpdateDetail,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade500,
                        ),
                      ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 16),
          if (hasNoData)
            _buildNoDataCard()
          else ...[
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    icon: Icons.favorite,
                    iconColor: const Color(0xFFFF6B6B),
                    iconBgColor: const Color(0xFFFFE8E8),
                    label: 'TEKANAN DARAH',
                    value: bloodPressureText,
                    unit: 'mmHg',
                    isNormal: isBpNormal,
                    hasData: systolic != null && diastolic != null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildMetricCard(
                    icon: Icons.monitor_weight,
                    iconColor: const Color(0xFFFFB74D),
                    iconBgColor: const Color(0xFFFFF4E6),
                    label: 'BERAT BADAN',
                    value: weightText,
                    unit: 'kg',
                    isNormal: isWeightNormal,
                    hasData: weight != null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    icon: Icons.thermostat,
                    iconColor: const Color(0xFF42A5F5),
                    iconBgColor: const Color(0xFFE3F2FD),
                    label: 'SUHU TUBUH',
                    value: bodyTempText,
                    unit: '°C',
                    isNormal: isTempNormal,
                    hasData: bodyTemp != null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildMetricCard(
                    icon: Icons.monitor_heart,
                    iconColor: const Color(0xFFAB47BC),
                    iconBgColor: const Color(0xFFF3E5F5),
                    label: 'DETAK JANTUNG',
                    value: heartRateText,
                    unit: 'bpm',
                    isNormal: isHrNormal,
                    hasData: heartRate != null,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildNoDataCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.health_and_safety_outlined,
              color: AppColors.primaryBlue,
              size: 32,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Belum ada data health record',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Silakan lakukan pemeriksaan kesehatan terlebih dahulu untuk melihat metrik kesehatan Anda.',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRouter.monitor);
              },
              icon: const Icon(Icons.add_circle_outline, size: 18),
              label: const Text(
                'Tambah Data Kesehatan',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String label,
    required String value,
    required String unit,
    required bool isNormal,
    bool hasData = true,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 20,
                ),
              ),
              if (hasData)
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: isNormal
                        ? const Color(0xFFE8F5F3)
                        : const Color(0xFFFFEBEE),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isNormal ? Icons.check : Icons.warning,
                    color: isNormal
                        ? const Color(0xFF27AE60)
                        : const Color(0xFFC62828),
                    size: 16,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  unit,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPuskesmasSection(HomeState state) {
    final p = state.puskesmas;
    final hasData = p != null;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Puskesmas Anda',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F2FD),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: (hasData && p.buildingPhotoUrl != null && p.buildingPhotoUrl!.isNotEmpty)
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                _getImageUrl(p.buildingPhotoUrl),
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.local_hospital,
                                    color: AppColors.primaryBlue,
                                    size: 28,
                                  );
                                },
                              ),
                            )
                          : const Icon(
                              Icons.local_hospital,
                              color: AppColors.primaryBlue,
                              size: 28,
                            ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hasData ? p.name : 'Memuat puskesmas...',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 14,
                                color: Colors.grey.shade500,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  hasData ? (p.address ?? 'Alamat belum tersedia') : 'Memuat alamat...',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (hasData && p.phone != null) ...[
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: 14,
                                  color: Colors.grey.shade500,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  p.phone!,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: hasData ? () => _openMaps(p) : null,
                        icon: const Icon(Icons.location_on, size: 18),
                        label: const Text(
                          'Lokasi',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primaryBlue,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: const BorderSide(
                            color: AppColors.primaryBlue,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCatatanPerawat(HomeState state) {
    final notesData = state.latestPerawatNotes;
    final perawatData = state.ibuHamilPerawat;
    
    final hasPerawat = perawatData?.hasPerawat == true && perawatData?.perawat != null;
    final hasNotes = notesData?.hasNotes == true &&
        (notesData?.notes?.trim().isNotEmpty ?? false);

    // If no perawat and no notes - show CTA to find perawat
    if (!hasPerawat && !hasNotes) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Catatan Perawat',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person_add_outlined,
                      color: AppColors.primaryBlue,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Belum Ada Perawat Pendamping',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Dapatkan seorang perawat profesional untuk mendampingi perjalanan kehamilan Anda.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle_outline, size: 18),
                      label: const Text(
                        'Cari Perawat Sekarang',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // If no perawat but has notes - show notes without perawat info
    if (!hasPerawat && hasNotes) {
      final labelText = _getNoteLabel(notesData!.checkupDate);
      final notesText = notesData.notes!;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Catatan Perawat',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      labelText,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryBlue,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '"$notesText"',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade800,
                        height: 1.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.person_add_outlined, size: 18),
                      label: const Text(
                        'Temukan Perawat Pendamping',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primaryBlue,
                        side: const BorderSide(
                          color: AppColors.primaryBlue,
                          width: 1.5,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // If has perawat (and may or may not have notes)
    final perawat = perawatData!.perawat!;
    final puskesmasName = (perawatData.puskesmas?['name'] as String?)
        ?.toUpperCase() ?? 'Puskesmas';
    final labelText = hasNotes ? _getNoteLabel(notesData?.checkupDate) : 'TIDAK ADA CATATAN TERBARU';
    final notesText = hasNotes
        ? notesData!.notes!
        : 'Belum ada catatan dari perawat. ${perawat.namaLengkap} akan menambahkan catatan setelah pemeriksaan berikutnya.';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Catatan Perawat',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Perawat Avatar
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),
                      child: perawat.profilePhotoUrl != null && 
                              perawat.profilePhotoUrl!.isNotEmpty
                          ? ClipOval(
                              child: Image.network(
                                _getImageUrl(perawat.profilePhotoUrl),
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey.shade300,
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                      size: 30,
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(
                              color: Colors.grey.shade300,
                              child: const Icon(
                                Icons.person,
                                color: Colors.grey,
                                size: 30,
                              ),
                            ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            perawat.namaLengkap,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            puskesmasName,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade500,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F2FD),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        labelText,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryBlue,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '"$notesText"',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade800,
                      height: 1.6,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: hasNotes ? () => _contactPerawat(perawat) : null,
                    icon: const Icon(Icons.chat_bubble_outline, size: 18),
                    label: Text(
                      'Hubungi ${perawat.namaLengkap.split(' ').first}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getNoteLabel(DateTime? checkupDate) {
    if (checkupDate == null) return 'CATATAN TERBARU';
    
    final recordDate = checkupDate;
    final today = DateTime.now();
    final isToday = recordDate.year == today.year &&
        recordDate.month == today.month &&
        recordDate.day == today.day;
    
    if (isToday) {
      return 'CATATAN HARI INI';
    } else {
      final formatted = DateFormat('dd MMM yyyy', 'id_ID').format(recordDate);
      return 'CATATAN ${formatted.toUpperCase()}';
    }
  }

  void _contactPerawat(PerawatModel perawat) {
    // TODO: Implement contact functionality (WhatsApp, call, etc.)
    print('Contacting perawat: ${perawat.namaLengkap}, Phone: ${perawat.nomorHp}');
  }

  int _getTrimester(int? week) {
    if (week == null) return 1;
    if (week <= 13) return 1;
    if (week <= 27) return 2;
    return 3;
  }

  Future<void> _openMaps(PuskesmasDetailModel p) async {
    if (p.latitude == null || p.longitude == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Koordinat puskesmas belum tersedia')),
      );
      return;
    }
    final uri = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${p.latitude},${p.longitude}');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal membuka Google Maps')),
      );
    }
  }
}
