import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/utils/date_formatter.dart';
import 'package:wellmom_app/core/widgets/custom_button.dart';
import 'package:wellmom_app/core/widgets/custom_text_field.dart';
import 'package:wellmom_app/features/auth/presentation/providers/auth_providers.dart';

class MedicalDataScreen extends ConsumerStatefulWidget {
  const MedicalDataScreen({super.key});

  @override
  ConsumerState<MedicalDataScreen> createState() => _MedicalDataScreenState();
}

class _MedicalDataScreenState extends ConsumerState<MedicalDataScreen>
    with SingleTickerProviderStateMixin {
  final _hphtController = TextEditingController();
  final _hplController = TextEditingController();
  final _usiaKehamilanController = TextEditingController();
  final _kehamilanKeController = TextEditingController();
  final _jumlahAnakController = TextEditingController();
  final _jumlahKeguguranController = TextEditingController();
  final _jarakKehamilanController = TextEditingController();
  final _komplikasiController = TextEditingController();

  @override
  void dispose() {
    _hphtController.dispose();
    _hplController.dispose();
    _usiaKehamilanController.dispose();
    _kehamilanKeController.dispose();
    _jumlahAnakController.dispose();
    _jumlahKeguguranController.dispose();
    _jarakKehamilanController.dispose();
    _komplikasiController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Sync controllers with ViewModel state when state changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _syncControllersWithState();
    });
  }

  void _syncControllersWithState() {
    final state = ref.read(medicalDataViewModelProvider);
    
    // Sync HPHT
    if (state.hpht != null && _hphtController.text.isEmpty) {
      _hphtController.text = DateFormatter.formatDate(state.hpht!);
    }
    
    // Auto-fill HPL if HPHT is set
    if (state.hpl != null) {
      _hplController.text = DateFormatter.formatDate(state.hpl!);
    }
    
    // Auto-fill usia kehamilan if HPHT is set
    if (state.usiaKehamilan != null) {
      _usiaKehamilanController.text = state.usiaKehamilan.toString();
    }
    
    // Sync jumlah keguguran
    if (state.jumlahKeguguran != null && _jumlahKeguguranController.text.isEmpty) {
      _jumlahKeguguranController.text = state.jumlahKeguguran.toString();
    }
  }

  Future<void> _selectDate(
    BuildContext context,
    Function(DateTime?) onDateSelected,
    TextEditingController controller,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryBlue,
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

  Widget _buildToggleButton({
    required String label,
    required bool? value,
    required Function(bool?) onChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(false),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: value == false
                    ? AppColors.primaryBlue
                    : Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                border: Border.all(
                  color: value == false
                      ? AppColors.primaryBlue
                      : Colors.grey.shade300,
                ),
              ),
              child: Center(
                child: Text(
                  'Tidak',
                  style: TextStyle(
                    color: value == false ? Colors.white : Colors.grey.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(true),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: value == true
                    ? AppColors.primaryBlue
                    : Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                border: Border.all(
                  color: value == true
                      ? AppColors.primaryBlue
                      : Colors.grey.shade300,
                ),
              ),
              child: Center(
                child: Text(
                  'Ya',
                  style: TextStyle(
                    color: value == true ? Colors.white : Colors.grey.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHealthToggleButton({
    required String label,
    required bool value,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (value) onTap(); // Only toggle if currently true
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: !value
                        ? AppColors.primaryBlue
                        : Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    border: Border.all(
                      color: !value
                          ? AppColors.primaryBlue
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Tidak',
                      style: TextStyle(
                        color: !value ? Colors.white : Colors.grey.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (!value) onTap(); // Only toggle if currently false
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: value
                        ? AppColors.primaryBlue
                        : Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    border: Border.all(
                      color: value
                          ? AppColors.primaryBlue
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Ya',
                      style: TextStyle(
                        color: value ? Colors.white : Colors.grey.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCollapsibleCard({
    required String title,
    required String letter,
    required bool isExpanded,
    required VoidCallback onToggle,
    required Widget child,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onToggle,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    '$letter. $title',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  const Spacer(),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: isExpanded ? 1.0 : 0.0,
                child: isExpanded
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: child,
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(medicalDataViewModelProvider);
    
    // Auto-update HPL and usia kehamilan controllers when state changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      
      // Update HPL controller if state has HPL and it's different
      if (state.hpl != null) {
        final hplText = DateFormatter.formatDate(state.hpl!);
        if (_hplController.text != hplText) {
          _hplController.text = hplText;
        }
      }
      
      // Update usia kehamilan controller if state has usia kehamilan and it's different
      if (state.usiaKehamilan != null) {
        final usiaText = state.usiaKehamilan.toString();
        if (_usiaKehamilanController.text != usiaText) {
          _usiaKehamilanController.text = usiaText;
        }
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Medical Data',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress indicator
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Card A: Kehamilan
            _buildCollapsibleCard(
              title: 'Kehamilan',
              letter: 'A',
              isExpanded: state.isCardAExpanded,
              onToggle: () {
                ref.read(medicalDataViewModelProvider.notifier).toggleCardA();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    label: 'HPHT (Hari Pertama Haid Terakhir)',
                    hintText: 'mm/dd/yyyy',
                    controller: _hphtController,
                    readOnly: true,
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: AppColors.primaryBlue,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (picked != null) {
                        // Update HPHT which will auto-calculate HPL and usia kehamilan
                        ref
                            .read(medicalDataViewModelProvider.notifier)
                            .updateHpht(picked);
                        _hphtController.text = DateFormatter.formatDate(picked);
                        
                        // Auto-fill HPL and usia kehamilan
                        final state = ref.read(medicalDataViewModelProvider);
                        if (state.hpl != null) {
                          _hplController.text = DateFormatter.formatDate(state.hpl!);
                        }
                        if (state.usiaKehamilan != null) {
                          _usiaKehamilanController.text = state.usiaKehamilan.toString();
                        }
                      }
                    },
                    suffixIcon: const Icon(Icons.calendar_today, size: 20),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'HPL (Hari Perkiraan Lahir)',
                    hintText: 'mm/dd/yyyy',
                    controller: _hplController,
                    readOnly: true,
                    onTap: () => _selectDate(
                      context,
                      (date) => ref
                          .read(medicalDataViewModelProvider.notifier)
                          .updateHpl(date),
                      _hplController,
                    ),
                    suffixIcon: const Icon(Icons.calendar_today, size: 20),
                  ),
                  // Note: HPL akan otomatis terisi saat HPHT diisi
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Usia kehamilan (minggu)',
                    hintText: 'Otomatis terisi dari HPHT',
                    controller: _usiaKehamilanController,
                    keyboardType: TextInputType.number,
                    readOnly: true,
                    onChanged: (value) {
                      final intValue = int.tryParse(value);
                      ref
                          .read(medicalDataViewModelProvider.notifier)
                          .updateUsiaKehamilan(intValue);
                    },
                  ),
                  // Note: Usia kehamilan akan otomatis terisi saat HPHT diisi
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Kehamilan ke-berapa',
                    hintText: 'e.g. 2',
                    controller: _kehamilanKeController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final intValue = int.tryParse(value);
                      ref
                          .read(medicalDataViewModelProvider.notifier)
                          .updateKehamilanKe(intValue);
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Jumlah anak hidup',
                    hintText: 'e.g. 1',
                    controller: _jumlahAnakController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final intValue = int.tryParse(value);
                      ref
                          .read(medicalDataViewModelProvider.notifier)
                          .updateJumlahAnak(intValue);
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Jumlah keguguran',
                    hintText: 'e.g. 0',
                    controller: _jumlahKeguguranController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final intValue = int.tryParse(value);
                      ref
                          .read(medicalDataViewModelProvider.notifier)
                          .updateJumlahKeguguran(intValue);
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Jarak kehamilan terakhir',
                    hintText: 'e.g. 2 tahun',
                    controller: _jarakKehamilanController,
                    onChanged: (value) {
                      ref
                          .read(medicalDataViewModelProvider.notifier)
                          .updateJarakKehamilanTerakhir(value);
                    },
                  ),
                ],
              ),
            ),
            // Card B: Riwayat Kesehatan Ibu
            _buildCollapsibleCard(
              title: 'Riwayat Kesehatan Ibu',
              letter: 'B',
              isExpanded: state.isCardBExpanded,
              onToggle: () {
                ref.read(medicalDataViewModelProvider.notifier).toggleCardB();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHealthToggleButton(
                    label: 'Darah tinggi (hipertensi)',
                    value: state.darahTinggi,
                    onTap: () {
                      ref
                          .read(medicalDataViewModelProvider.notifier)
                          .toggleDarahTinggi();
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildHealthToggleButton(
                    label: 'Diabetes',
                    value: state.diabetes,
                    onTap: () {
                      ref
                          .read(medicalDataViewModelProvider.notifier)
                          .toggleDiabetes();
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildHealthToggleButton(
                    label: 'Anemia',
                    value: state.anemia,
                    onTap: () {
                      ref
                          .read(medicalDataViewModelProvider.notifier)
                          .toggleAnemia();
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildHealthToggleButton(
                    label: 'Penyakit jantung',
                    value: state.penyakitJantung,
                    onTap: () {
                      ref
                          .read(medicalDataViewModelProvider.notifier)
                          .togglePenyakitJantung();
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildHealthToggleButton(
                    label: 'Asma',
                    value: state.asma,
                    onTap: () {
                      ref
                          .read(medicalDataViewModelProvider.notifier)
                          .toggleAsma();
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildHealthToggleButton(
                    label: 'Penyakit ginjal',
                    value: state.penyakitGinjal,
                    onTap: () {
                      ref
                          .read(medicalDataViewModelProvider.notifier)
                          .togglePenyakitGinjal();
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildHealthToggleButton(
                    label: 'TBC / Malaria',
                    value: state.tbcMalaria,
                    onTap: () {
                      ref
                          .read(medicalDataViewModelProvider.notifier)
                          .toggleTbcMalaria();
                    },
                  ),
                ],
              ),
            ),
            // Card C: Riwayat Masa Lalu
            _buildCollapsibleCard(
              title: 'Riwayat Masa Lalu',
              letter: 'C',
              isExpanded: state.isCardCExpanded,
              onToggle: () {
                ref.read(medicalDataViewModelProvider.notifier).toggleCardC();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    label: 'Komplikasi kehamilan sebelumnya',
                    hintText: 'Jelaskan (jika ada)',
                    controller: _komplikasiController,
                    maxLines: 3,
                    onChanged: (value) {
                      ref
                          .read(medicalDataViewModelProvider.notifier)
                          .updateKomplikasiKehamilanSebelumnya(value);
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Persalinan caesar',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildToggleButton(
                    label: 'Persalinan caesar',
                    value: state.pernahCaesar,
                    onChanged: (value) {
                      ref
                          .read(medicalDataViewModelProvider.notifier)
                          .updatePernahCaesar(value);
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Perdarahan saat hamil sebelumnya',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildToggleButton(
                    label: 'Perdarahan saat hamil sebelumnya',
                    value: state.pernahPerdarahanSaatHamil,
                    onChanged: (value) {
                      ref
                          .read(medicalDataViewModelProvider.notifier)
                          .updatePernahPerdarahanSaatHamil(value);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Data Sharing Consent Checkbox
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: state.dataSharingConsent,
                  onChanged: (value) {
                    ref
                        .read(medicalDataViewModelProvider.notifier)
                        .updateDataSharingConsent(value ?? false);
                  },
                  activeColor: AppColors.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(medicalDataViewModelProvider.notifier)
                          .updateDataSharingConsent(!state.dataSharingConsent);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Saya menyetujui data kesehatan kehamilan saya dibagikan kepada tenaga kesehatan dan fasilitas layanan kesehatan terkait untuk keperluan pemantauan dan pelayanan kehamilan.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 13,
                              color: AppColors.textDark,
                              height: 1.4,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // WhatsApp Consent Checkbox
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: state.whatsappConsent,
                  onChanged: (value) {
                    ref
                        .read(medicalDataViewModelProvider.notifier)
                        .updateWhatsappConsent(value ?? false);
                  },
                  activeColor: AppColors.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(medicalDataViewModelProvider.notifier)
                          .updateWhatsappConsent(!state.whatsappConsent);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Saya bersedia menerima notifikasi dan informasi kesehatan kehamilan melalui WhatsApp dari aplikasi WellMom. Saya dapat mencabut persetujuan ini kapan saja.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 13,
                              color: AppColors.textDark,
                              height: 1.4,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Next button
            CustomButton(
              text: 'Next',
              onPressed: state.whatsappConsent
                  ? () {
                      Navigator.of(context).pushNamed(AppRouter.selectPuskesmas);
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
