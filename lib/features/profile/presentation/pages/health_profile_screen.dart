import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/utils/date_formatter.dart';
import 'package:wellmom_app/core/widgets/custom_button.dart';
import 'package:wellmom_app/core/widgets/custom_text_field.dart';
import 'package:wellmom_app/core/widgets/error_snackbar.dart';
import 'package:wellmom_app/features/home/presentation/providers/home_providers.dart';
import 'package:wellmom_app/features/profile/presentation/providers/profile_providers.dart';

class HealthProfileScreen extends ConsumerStatefulWidget {
  const HealthProfileScreen({super.key});

  @override
  ConsumerState<HealthProfileScreen> createState() => _HealthProfileScreenState();
}

class _HealthProfileScreenState extends ConsumerState<HealthProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usiaKehamilanController = TextEditingController();
  final _kehamilanKeController = TextEditingController();
  final _jumlahAnakController = TextEditingController();
  final _jumlahKeguguranController = TextEditingController();
  final _jarakKehamilanController = TextEditingController();
  final _hphtController = TextEditingController();
  final _hplController = TextEditingController();
  final _komplikasiController = TextEditingController();
  final _perdarahanController = TextEditingController();

  @override
  void dispose() {
    _usiaKehamilanController.dispose();
    _kehamilanKeController.dispose();
    _jumlahAnakController.dispose();
    _jumlahKeguguranController.dispose();
    _jarakKehamilanController.dispose();
    _hphtController.dispose();
    _hplController.dispose();
    _komplikasiController.dispose();
    _perdarahanController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadHealthProfile();
    });
  }

  void _loadHealthProfile() {
    // Use Future.microtask to delay provider modification until after build
    Future.microtask(() {
      if (!mounted) return;
      final ibuAsync = ref.read(ibuHamilMeProvider);
      ibuAsync.whenData((ibuHamil) {
        if (ibuHamil != null && mounted) {
          ref.read(healthProfileViewModelProvider.notifier).loadFromIbuHamil(ibuHamil);
          // Delay sync to ensure state is updated
          Future.microtask(() {
            if (mounted) {
              _syncControllersWithState();
            }
          });
        }
      });
    });
  }

  void _syncControllersWithState() {
    final state = ref.read(healthProfileViewModelProvider);
    
    if (state.usiaKehamilan != null) {
      _usiaKehamilanController.text = state.usiaKehamilan.toString();
    }
    if (state.kehamilanKe != null) {
      _kehamilanKeController.text = state.kehamilanKe.toString();
    }
    if (state.jumlahAnak != null) {
      _jumlahAnakController.text = state.jumlahAnak.toString();
    }
    if (state.jumlahKeguguran != null) {
      _jumlahKeguguranController.text = state.jumlahKeguguran.toString();
    }
    _jarakKehamilanController.text = state.jarakKehamilanTerakhir ?? '';
    _hphtController.text = state.hpht != null ? DateFormatter.formatDate(state.hpht!) : '';
    _hplController.text = state.hpl != null ? DateFormatter.formatDate(state.hpl!) : '';
    _komplikasiController.text = state.komplikasiKehamilanSebelumnya ?? '';
    _perdarahanController.text = state.pernahPerdarahanSaatHamil ?? '';
  }

  Future<void> _selectDate(
    BuildContext context,
    Function(DateTime?) onDateSelected,
    TextEditingController controller,
  ) async {
    final state = ref.read(healthProfileViewModelProvider);
    final initialDate = controller == _hphtController
        ? (state.hpht ?? DateTime.now().subtract(const Duration(days: 90)))
        : (state.hpl ?? DateTime.now().add(const Duration(days: 190)));
    
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: controller == _hphtController ? DateTime(2020) : DateTime.now(),
      lastDate: controller == _hphtController ? DateTime.now() : DateTime.now().add(const Duration(days: 365)),
      helpText: controller == _hphtController ? 'Pilih HPHT' : 'Pilih HPL',
      cancelText: 'Batal',
      confirmText: 'Pilih',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryBlue,
              onPrimary: Colors.white,
              onSurface: AppColors.textDark,
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null) {
      onDateSelected(picked);
      controller.text = DateFormatter.formatDate(picked);
    }
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final viewModel = ref.read(healthProfileViewModelProvider.notifier);
    final success = await viewModel.saveHealthProfile();

    if (!mounted) return;

    if (success) {
      // Invalidate profile data to refresh
      ref.invalidate(ibuHamilMeProvider);
      ErrorSnackbar.showSuccess(context, 'Health Profile berhasil diperbarui');
      Navigator.of(context).pop(true);
    } else {
      final state = ref.read(healthProfileViewModelProvider);
      if (state.error != null) {
        ErrorSnackbar.show(context, state.error!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(healthProfileViewModelProvider);
    final ibuAsync = ref.watch(ibuHamilMeProvider);

    // Sync controllers when state changes (only if data is loaded)
    if (state.usiaKehamilan != null && !state.isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        
        if (_usiaKehamilanController.text != state.usiaKehamilan.toString()) {
          _usiaKehamilanController.text = state.usiaKehamilan.toString();
        }
        if (state.kehamilanKe != null &&
            _kehamilanKeController.text != state.kehamilanKe.toString()) {
          _kehamilanKeController.text = state.kehamilanKe.toString();
        }
        if (state.jumlahAnak != null &&
            _jumlahAnakController.text != state.jumlahAnak.toString()) {
          _jumlahAnakController.text = state.jumlahAnak.toString();
        }
        if (state.jumlahKeguguran != null &&
            _jumlahKeguguranController.text != state.jumlahKeguguran.toString()) {
          _jumlahKeguguranController.text = state.jumlahKeguguran.toString();
        }
        if (state.jarakKehamilanTerakhir != null &&
            _jarakKehamilanController.text != state.jarakKehamilanTerakhir) {
          _jarakKehamilanController.text = state.jarakKehamilanTerakhir!;
        }
        final hphtText = state.hpht != null ? DateFormatter.formatDate(state.hpht!) : '';
        if (hphtText.isNotEmpty && _hphtController.text != hphtText) {
          _hphtController.text = hphtText;
        }
        final hplText = state.hpl != null ? DateFormatter.formatDate(state.hpl!) : '';
        if (hplText.isNotEmpty && _hplController.text != hplText) {
          _hplController.text = hplText;
        }
        if (state.komplikasiKehamilanSebelumnya != null &&
            _komplikasiController.text != state.komplikasiKehamilanSebelumnya) {
          _komplikasiController.text = state.komplikasiKehamilanSebelumnya!;
        }
        if (state.pernahPerdarahanSaatHamil != null &&
            _perdarahanController.text != state.pernahPerdarahanSaatHamil) {
          _perdarahanController.text = state.pernahPerdarahanSaatHamil!;
        }
      });
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Health Profile',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ibuAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              const Text('Gagal memuat data'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(ibuHamilMeProvider);
                },
                child: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
        data: (ibuHamil) {
          // Load data immediately if not already loaded
          if (ibuHamil != null) {
            Future.microtask(() {
              if (mounted) {
                ref.read(healthProfileViewModelProvider.notifier).loadFromIbuHamil(ibuHamil);
                // Delay sync to ensure state is updated
                Future.microtask(() {
                  if (mounted) {
                    _syncControllersWithState();
                  }
                });
              }
            });
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section A: Kehamilan
                  _buildSectionHeader(
                    icon: Icons.person_outline,
                    title: 'A. Kehamilan',
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200, width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Usia Kehamilan (Minggu)
                        CustomTextField(
                          label: 'Usia Kehamilan (Minggu)',
                          hintText: 'Contoh: 12',
                          controller: _usiaKehamilanController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            final intValue = int.tryParse(value);
                            ref.read(healthProfileViewModelProvider.notifier)
                                .updateUsiaKehamilan(intValue);
                          },
                        ),
                        const SizedBox(height: 16),
                        
                        // Kehamilan Ke
                        CustomTextField(
                          label: 'Kehamilan Ke',
                          hintText: '1',
                          controller: _kehamilanKeController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            final intValue = int.tryParse(value);
                            ref.read(healthProfileViewModelProvider.notifier)
                                .updateKehamilanKe(intValue);
                          },
                        ),
                        const SizedBox(height: 16),
                        
                        // Anak Hidup
                        CustomTextField(
                          label: 'Anak Hidup',
                          hintText: '0',
                          controller: _jumlahAnakController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            final intValue = int.tryParse(value);
                            ref.read(healthProfileViewModelProvider.notifier)
                                .updateJumlahAnak(intValue);
                          },
                        ),
                        const SizedBox(height: 16),
                        
                        // Riwayat Keguguran
                        Text(
                          'Riwayat Keguguran',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.textDark,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: _buildRadioOption(
                                value: false,
                                groupValue: !state.hasRiwayatKeguguran,
                                label: 'Tidak',
                                onChanged: (_) {
                                  ref.read(healthProfileViewModelProvider.notifier)
                                      .updateHasRiwayatKeguguran(false);
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildRadioOption(
                                value: true,
                                groupValue: state.hasRiwayatKeguguran,
                                label: 'Ya',
                                onChanged: (_) {
                                  ref.read(healthProfileViewModelProvider.notifier)
                                      .updateHasRiwayatKeguguran(true);
                                },
                              ),
                            ),
                          ],
                        ),
                        if (state.hasRiwayatKeguguran) ...[
                          const SizedBox(height: 12),
                          Text(
                            'Berapa kali?',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textDark,
                                ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextField(
                            hintText: '1',
                            controller: _jumlahKeguguranController,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              final intValue = int.tryParse(value);
                              ref.read(healthProfileViewModelProvider.notifier)
                                  .updateJumlahKeguguran(intValue);
                            },
                          ),
                        ],
                        const SizedBox(height: 16),
                        
                        // Jarak Kehamilan Terakhir
                        CustomTextField(
                          label: 'Jarak Kehamilan Terakhir',
                          hintText: 'Contoh: 2 Tahun',
                          controller: _jarakKehamilanController,
                          onChanged: (value) {
                            ref.read(healthProfileViewModelProvider.notifier)
                                .updateJarakKehamilanTerakhir(value);
                          },
                        ),
                        const SizedBox(height: 16),
                        
                        // HPHT
                        CustomTextField(
                          label: 'HPHT',
                          hintText: 'mm/dd/yyyy',
                          controller: _hphtController,
                          readOnly: true,
                          onTap: () => _selectDate(
                            context,
                            (date) {
                              ref.read(healthProfileViewModelProvider.notifier).updateHpht(date);
                            },
                            _hphtController,
                          ),
                          suffixIcon: const Icon(Icons.calendar_today, size: 20),
                        ),
                        const SizedBox(height: 16),
                        
                        // HPL (Perkiraan)
                        CustomTextField(
                          label: 'HPL (Perkiraan)',
                          hintText: 'mm/dd/yyyy',
                          controller: _hplController,
                          readOnly: true,
                          onTap: () => _selectDate(
                            context,
                            (date) {
                              ref.read(healthProfileViewModelProvider.notifier).updateHpl(date);
                            },
                            _hplController,
                          ),
                          suffixIcon: const Icon(Icons.calendar_today, size: 20),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Section B: Riwayat Kesehatan Ibu
                  _buildSectionHeader(
                    icon: Icons.favorite,
                    title: 'B. Riwayat Kesehatan Ibu',
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200, width: 1),
                    ),
                    child: Column(
                      children: [
                        _buildHealthConditionRow(
                          label: 'Darah tinggi (hipertensi)',
                          value: state.darahTinggi,
                          onChanged: () {
                            ref.read(healthProfileViewModelProvider.notifier).toggleDarahTinggi();
                          },
                        ),
                        _buildDivider(),
                        _buildHealthConditionRow(
                          label: 'Diabetes',
                          value: state.diabetes,
                          onChanged: () {
                            ref.read(healthProfileViewModelProvider.notifier).toggleDiabetes();
                          },
                        ),
                        _buildDivider(),
                        _buildHealthConditionRow(
                          label: 'Anemia',
                          value: state.anemia,
                          onChanged: () {
                            ref.read(healthProfileViewModelProvider.notifier).toggleAnemia();
                          },
                        ),
                        _buildDivider(),
                        _buildHealthConditionRow(
                          label: 'Penyakit jantung',
                          value: state.penyakitJantung,
                          onChanged: () {
                            ref.read(healthProfileViewModelProvider.notifier).togglePenyakitJantung();
                          },
                        ),
                        _buildDivider(),
                        _buildHealthConditionRow(
                          label: 'Asma',
                          value: state.asma,
                          onChanged: () {
                            ref.read(healthProfileViewModelProvider.notifier).toggleAsma();
                          },
                        ),
                        _buildDivider(),
                        _buildHealthConditionRow(
                          label: 'Penyakit ginjal',
                          value: state.penyakitGinjal,
                          onChanged: () {
                            ref.read(healthProfileViewModelProvider.notifier).togglePenyakitGinjal();
                          },
                        ),
                        _buildDivider(),
                        _buildHealthConditionRow(
                          label: 'TBC / Malaria (daerah tertentu)',
                          value: state.tbcMalaria,
                          onChanged: () {
                            ref.read(healthProfileViewModelProvider.notifier).toggleTbcMalaria();
                          },
                          isLast: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Section C: Riwayat Masa Lalu
                  _buildSectionHeader(
                    icon: Icons.history,
                    title: 'C. Riwayat Masa Lalu',
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200, width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Komplikasi kehamilan sebelumnya
                        CustomTextField(
                          label: 'Komplikasi kehamilan sebelumnya',
                          hintText: 'Tuliskan jika ada...',
                          controller: _komplikasiController,
                          maxLines: 3,
                          onChanged: (value) {
                            ref.read(healthProfileViewModelProvider.notifier)
                                .updateKomplikasiKehamilanSebelumnya(value);
                          },
                        ),
                        const SizedBox(height: 16),
                        
                        // Persalinan caesar
                        Text(
                          'Persalinan caesar',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.textDark,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: _buildRadioOption(
                                value: false,
                                groupValue: !state.pernahCaesar,
                                label: 'Tidak',
                                onChanged: (_) {
                                  ref.read(healthProfileViewModelProvider.notifier)
                                      .updatePernahCaesar(false);
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildRadioOption(
                                value: true,
                                groupValue: state.pernahCaesar,
                                label: 'Ya',
                                onChanged: (_) {
                                  ref.read(healthProfileViewModelProvider.notifier)
                                      .updatePernahCaesar(true);
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        
                        // Perdarahan saat hamil sebelumnya
                        CustomTextField(
                          label: 'Perdarahan saat hamil sebelumnya',
                          hintText: 'Contoh: Tidak ada / Ya, saat trimester 1',
                          controller: _perdarahanController,
                          maxLines: 2,
                          onChanged: (value) {
                            ref.read(healthProfileViewModelProvider.notifier)
                                .updatePernahPerdarahanSaatHamil(value);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Save Button
                  CustomButton(
                    text: 'Simpan Perubahan',
                    isLoading: state.isSaving,
                    onPressed: state.isSaving ? null : _handleSave,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader({
    required IconData icon,
    required String title,
  }) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.primaryBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 20,
            color: AppColors.primaryBlue,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }

  Widget _buildRadioOption({
    required bool value,
    required bool groupValue,
    required String label,
    required Function(bool) onChanged,
  }) {
    final isSelected = value == groupValue;
    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryBlue.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primaryBlue : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primaryBlue : Colors.grey.shade400,
                  width: 2,
                ),
                color: isSelected ? AppColors.primaryBlue : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 12, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? AppColors.primaryBlue : AppColors.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthConditionRow({
    required String label,
    required bool value,
    required VoidCallback onChanged,
    bool isLast = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textDark,
              ),
            ),
          ),
          const SizedBox(width: 16),
          _buildRadioOption(
            value: true,
            groupValue: value,
            label: 'Ya',
            onChanged: (_) => onChanged(),
          ),
          const SizedBox(width: 12),
          _buildRadioOption(
            value: false,
            groupValue: !value,
            label: 'Tidak',
            onChanged: (_) => onChanged(),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Divider(
        height: 1,
        thickness: 1,
        color: Colors.grey.shade200,
      ),
    );
  }
}
