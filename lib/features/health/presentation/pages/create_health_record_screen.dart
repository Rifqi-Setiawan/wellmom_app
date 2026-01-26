import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/widgets/custom_button.dart';
import 'package:wellmom_app/core/widgets/custom_text_field.dart';
import 'package:wellmom_app/core/widgets/error_snackbar.dart';
import 'package:wellmom_app/features/health/data/models/create_health_record_request_model.dart';
import 'package:wellmom_app/features/health/presentation/providers/health_providers.dart';
import 'package:wellmom_app/features/home/presentation/providers/home_providers.dart';

class CreateHealthRecordScreen extends ConsumerStatefulWidget {
  const CreateHealthRecordScreen({super.key});

  @override
  ConsumerState<CreateHealthRecordScreen> createState() =>
      _CreateHealthRecordScreenState();
}

class _CreateHealthRecordScreenState
    extends ConsumerState<CreateHealthRecordScreen> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;

  // Step 1: Required fields
  final _systolicController = TextEditingController();
  final _diastolicController = TextEditingController();
  final _heartRateController = TextEditingController();
  final _bodyTemperatureController = TextEditingController();
  final _weightController = TextEditingController();

  // Step 2: Complaints
  final _complaintsController = TextEditingController();

  // Step 3: Optional fields
  final _hemoglobinController = TextEditingController();
  final _bloodGlucoseController = TextEditingController();
  final _proteinUrinController = TextEditingController();
  final _upperArmCircumferenceController = TextEditingController();
  final _fundalHeightController = TextEditingController();
  final _fetalHeartRateController = TextEditingController();

  @override
  void dispose() {
    _systolicController.dispose();
    _diastolicController.dispose();
    _heartRateController.dispose();
    _bodyTemperatureController.dispose();
    _weightController.dispose();
    _complaintsController.dispose();
    _hemoglobinController.dispose();
    _bloodGlucoseController.dispose();
    _proteinUrinController.dispose();
    _upperArmCircumferenceController.dispose();
    _fundalHeightController.dispose();
    _fetalHeartRateController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep == 0) {
      if (_formKey.currentState!.validate()) {
        setState(() => _currentStep = 1);
      }
    } else if (_currentStep == 1) {
      setState(() => _currentStep = 2);
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep = _currentStep - 1);
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final homeState = ref.read(homeViewModelProvider);
    final ibuHamil = homeState.ibuHamil;
    if (ibuHamil == null) {
      ErrorSnackbar.show(context, 'Gagal mendapatkan data ibu hamil');
      return;
    }

    final now = DateTime.now();
    final checkupDate = DateFormat('yyyy-MM-dd').format(now);

    final request = CreateHealthRecordRequestModel(
      bloodGlucose: _bloodGlucoseController.text.isNotEmpty
          ? double.tryParse(_bloodGlucoseController.text)
          : null,
      bloodPressureDiastolic: int.parse(_diastolicController.text),
      bloodPressureSystolic: int.parse(_systolicController.text),
      bodyTemperature: double.parse(_bodyTemperatureController.text),
      checkedBy: 'ibu_hamil',
      checkupDate: checkupDate,
      complaints: _complaintsController.text.trim().isEmpty
          ? null
          : _complaintsController.text.trim(),
      fetalHeartRate: _fetalHeartRateController.text.isNotEmpty
          ? int.tryParse(_fetalHeartRateController.text)
          : null,
      fundalHeight: _fundalHeightController.text.isNotEmpty
          ? double.tryParse(_fundalHeightController.text)
          : null,
      gestationalAgeDays: null,
      gestationalAgeWeeks: null,
      heartRate: int.parse(_heartRateController.text),
      hemoglobin: _hemoglobinController.text.isNotEmpty
          ? double.tryParse(_hemoglobinController.text)
          : null,
      ibuHamilId: ibuHamil.id,
      notes: null,
      perawatId: null,
      proteinUrin: _proteinUrinController.text.trim().isEmpty
          ? null
          : _proteinUrinController.text.trim(),
      upperArmCircumference:
          _upperArmCircumferenceController.text.isNotEmpty
              ? double.tryParse(_upperArmCircumferenceController.text)
              : null,
      weight: double.parse(_weightController.text),
    );

    final success = await ref
        .read(createHealthRecordViewModelProvider.notifier)
        .createHealthRecord(request);

    if (!mounted) return;

    if (success) {
      ErrorSnackbar.showSuccess(context, 'Data kesehatan berhasil disimpan');
      Navigator.of(context).pop();
    } else {
      final state = ref.read(createHealthRecordViewModelProvider);
      if (state.error != null) {
        ErrorSnackbar.show(context, state.error!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModelState = ref.watch(createHealthRecordViewModelProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Input Data Kesehatan',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // Progress indicator
            _buildProgressIndicator(),
            // Form content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: _buildStepContent(),
              ),
            ),
            // Navigation buttons
            _buildNavigationButtons(viewModelState.isLoading),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: Colors.white,
      child: Row(
        children: [
          _buildProgressStep(1, 'Data Dasar', _currentStep >= 0),
          _buildProgressLine(_currentStep >= 1),
          _buildProgressStep(2, 'Keluhan', _currentStep >= 1),
          _buildProgressLine(_currentStep >= 2),
          _buildProgressStep(3, 'Data Tambahan', _currentStep >= 2),
        ],
      ),
    );
  }

  Widget _buildProgressStep(int step, String label, bool isCompleted) {
    final isCurrent = _currentStep == step - 1;
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted || isCurrent
                  ? AppColors.primaryBlue
                  : Colors.grey.shade300,
            ),
            child: Center(
              child: isCompleted && !isCurrent
                  ? const Icon(Icons.check, color: Colors.white, size: 20)
                  : Text(
                      '$step',
                      style: TextStyle(
                        color: isCompleted || isCurrent
                            ? Colors.white
                            : Colors.grey.shade600,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
              color: isCompleted || isCurrent
                  ? AppColors.primaryBlue
                  : Colors.grey.shade600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressLine(bool isCompleted) {
    return Container(
      height: 2,
      margin: const EdgeInsets.only(bottom: 20),
      color: isCompleted ? AppColors.primaryBlue : Colors.grey.shade300,
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return _buildStep1();
      case 1:
        return _buildStep2();
      case 2:
        return _buildStep3();
      default:
        return _buildStep1();
    }
  }

  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Data Kesehatan Dasar',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Masukkan data kesehatan yang wajib diisi',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textLight,
          ),
        ),
        const SizedBox(height: 24),
        // Systolic
        CustomTextField(
          label: 'Tekanan Darah Sistolik (mmHg) *',
          hintText: 'Contoh: 120',
          controller: _systolicController,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Tekanan darah sistolik harus diisi';
            }
            final num = int.tryParse(value);
            if (num == null) {
              return 'Masukkan angka yang valid';
            }
            if (num < 50 || num > 250) {
              return 'Masukkan nilai antara 50-250';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        // Diastolic
        CustomTextField(
          label: 'Tekanan Darah Diastolik (mmHg) *',
          hintText: 'Contoh: 80',
          controller: _diastolicController,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Tekanan darah diastolik harus diisi';
            }
            final num = int.tryParse(value);
            if (num == null) {
              return 'Masukkan angka yang valid';
            }
            if (num < 30 || num > 150) {
              return 'Masukkan nilai antara 30-150';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        // Heart Rate
        CustomTextField(
          label: 'Detak Jantung (bpm) *',
          hintText: 'Contoh: 72',
          controller: _heartRateController,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Detak jantung harus diisi';
            }
            final num = int.tryParse(value);
            if (num == null) {
              return 'Masukkan angka yang valid';
            }
            if (num < 40 || num > 200) {
              return 'Masukkan nilai antara 40-200';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        // Body Temperature
        CustomTextField(
          label: 'Suhu Tubuh (°C) *',
          hintText: 'Contoh: 36.8',
          controller: _bodyTemperatureController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Suhu tubuh harus diisi';
            }
            final num = double.tryParse(value);
            if (num == null) {
              return 'Masukkan angka yang valid';
            }
            if (num < 30 || num > 45) {
              return 'Masukkan nilai antara 30-45';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        // Weight
        CustomTextField(
          label: 'Berat Badan (kg) *',
          hintText: 'Contoh: 65.5',
          controller: _weightController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Berat badan harus diisi';
            }
            final num = double.tryParse(value);
            if (num == null) {
              return 'Masukkan angka yang valid';
            }
            if (num < 30 || num > 200) {
              return 'Masukkan nilai antara 30-200';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildStep2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Keluhan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Masukkan keluhan yang Anda rasakan (opsional)',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textLight,
          ),
        ),
        const SizedBox(height: 24),
        CustomTextField(
          label: 'Keluhan',
          hintText: 'Contoh: Pusing, mual, atau tidak ada keluhan',
          controller: _complaintsController,
          maxLines: 5,
          keyboardType: TextInputType.multiline,
        ),
      ],
    );
  }

  Widget _buildStep3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Data Kesehatan Tambahan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primaryBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.primaryBlue.withOpacity(0.3),
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: AppColors.primaryBlue,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Data berikut bersifat opsional dan direkomendasikan untuk diukur di puskesmas dengan peralatan medis yang lebih akurat.',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Hemoglobin
        CustomTextField(
          label: 'Hemoglobin (g/dL)',
          hintText: 'Contoh: 12.5',
          controller: _hemoglobinController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: (value) {
            if (value != null && value.isNotEmpty) {
              final num = double.tryParse(value);
              if (num == null) {
                return 'Masukkan angka yang valid';
              }
              if (num < 5 || num > 20) {
                return 'Masukkan nilai antara 5-20';
              }
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        // Blood Glucose
        CustomTextField(
          label: 'Gula Darah (mg/dL)',
          hintText: 'Contoh: 95',
          controller: _bloodGlucoseController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: (value) {
            if (value != null && value.isNotEmpty) {
              final num = double.tryParse(value);
              if (num == null) {
                return 'Masukkan angka yang valid';
              }
              if (num < 50 || num > 500) {
                return 'Masukkan nilai antara 50-500';
              }
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        // Protein Urin
        CustomTextField(
          label: 'Protein Urin',
          hintText: 'Contoh: negatif, +1, +2, +3',
          controller: _proteinUrinController,
        ),
        const SizedBox(height: 16),
        // Upper Arm Circumference
        CustomTextField(
          label: 'Lingkar Lengan Atas (cm)',
          hintText: 'Contoh: 25',
          controller: _upperArmCircumferenceController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: (value) {
            if (value != null && value.isNotEmpty) {
              final num = double.tryParse(value);
              if (num == null) {
                return 'Masukkan angka yang valid';
              }
              if (num < 15 || num > 50) {
                return 'Masukkan nilai antara 15-50';
              }
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        // Fundal Height
        CustomTextField(
          label: 'Tinggi Fundus Uteri (cm)',
          hintText: 'Contoh: 28',
          controller: _fundalHeightController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: (value) {
            if (value != null && value.isNotEmpty) {
              final num = double.tryParse(value);
              if (num == null) {
                return 'Masukkan angka yang valid';
              }
              if (num < 10 || num > 50) {
                return 'Masukkan nilai antara 10-50';
              }
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        // Fetal Heart Rate
        CustomTextField(
          label: 'Detak Jantung Janin (bpm)',
          hintText: 'Contoh: 140',
          controller: _fetalHeartRateController,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value != null && value.isNotEmpty) {
              final num = int.tryParse(value);
              if (num == null) {
                return 'Masukkan angka yang valid';
              }
              if (num < 100 || num > 200) {
                return 'Masukkan nilai antara 100-200';
              }
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildNavigationButtons(bool isLoading) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (_currentStep > 0)
            Expanded(
              child: CustomButton(
                text: 'Kembali',
                onPressed: isLoading ? null : _previousStep,
                isOutlined: true,
              ),
            ),
          if (_currentStep > 0) const SizedBox(width: 12),
          Expanded(
            flex: _currentStep > 0 ? 1 : 1,
            child: CustomButton(
              text: _currentStep == 2 ? 'Simpan' : 'Selanjutnya',
              onPressed: isLoading
                  ? null
                  : (_currentStep == 2 ? _submit : _nextStep),
              isLoading: isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
