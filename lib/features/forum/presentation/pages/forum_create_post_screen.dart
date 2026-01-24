import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/widgets/error_snackbar.dart';
import 'package:wellmom_app/features/forum/presentation/providers/forum_providers.dart';

class ForumCreatePostScreen extends ConsumerStatefulWidget {
  const ForumCreatePostScreen({super.key});

  @override
  ConsumerState<ForumCreatePostScreen> createState() =>
      _ForumCreatePostScreenState();
}

class _ForumCreatePostScreenState
    extends ConsumerState<ForumCreatePostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int? _selectedCategoryId;

  @override
  void dispose() {
    _titleController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  Future<void> _submitPost() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedCategoryId == null) {
      ErrorSnackbar.show(context, 'Pilih kategori terlebih dahulu');
      return;
    }

    try {
      await ref.read(forumViewModelProvider.notifier).createPost(
            title: _titleController.text.trim(),
            details: _detailsController.text.trim(),
            categoryId: _selectedCategoryId!,
          );

      if (mounted) {
        ErrorSnackbar.showSuccess(context, 'Post berhasil dibuat!');
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        ErrorSnackbar.show(context, e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(forumViewModelProvider);
    final isCreating = state.isCreatingPost;

    // Note: Categories sudah di-fetch di ForumViewModel._initialize()
    // Tidak perlu fetch ulang di sini

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textDark,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Buat Diskusi',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Field
              const Text(
                'Judul Diskusi',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _titleController,
                maxLength: 100,
                decoration: InputDecoration(
                  hintText: 'Masukkan judul diskusi Anda...',
                  hintStyle: const TextStyle(color: AppColors.textLight),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.primaryBlue,
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Judul tidak boleh kosong';
                  }
                  if (value.trim().length < 5) {
                    return 'Judul minimal 5 karakter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              // Category Dropdown
              const Text(
                'Kategori',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: state.categories.isEmpty && state.isLoading
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Memuat kategori...',
                              style: TextStyle(
                                color: AppColors.textLight,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    : DropdownButtonFormField<int>(
                        initialValue: _selectedCategoryId,
                        isExpanded: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        hint: const Text(
                          'Pilih kategori',
                          style: TextStyle(color: AppColors.textLight),
                        ),
                        dropdownColor: Colors.white,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.textDark,
                        ),
                        items: state.categories
                            .where((cat) => cat.isActive)
                            .map((category) {
                          return DropdownMenuItem<int>(
                            value: category.id,
                            child: Text(
                              category.displayName,
                              style: const TextStyle(
                                color: AppColors.textDark,
                                fontSize: 14,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: state.categories.isEmpty
                            ? null
                            : (value) {
                                setState(() {
                                  _selectedCategoryId = value;
                                });
                              },
                        validator: (value) {
                          if (value == null) {
                            return 'Pilih kategori terlebih dahulu';
                          }
                          return null;
                        },
                      ),
              ),
              const SizedBox(height: 24),
              // Details Field
              const Text(
                'Isi Diskusi',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _detailsController,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Bagikan pengalaman atau pertanyaan Anda...',
                  hintStyle: const TextStyle(color: AppColors.textLight),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.primaryBlue,
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  contentPadding: const EdgeInsets.all(16),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Isi diskusi tidak boleh kosong';
                  }
                  if (value.trim().length < 10) {
                    return 'Isi diskusi minimal 10 karakter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isCreating ? null : _submitPost,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    disabledBackgroundColor: Colors.grey.shade300,
                  ),
                  child: isCreating
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Mengirim...',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      : const Text(
                          'Kirim',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
