import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/widgets/error_snackbar.dart';
import 'package:wellmom_app/features/forum/presentation/providers/forum_providers.dart';

class ForumReplyScreen extends ConsumerStatefulWidget {
  final int postId;

  const ForumReplyScreen({
    super.key,
    required this.postId,
  });

  @override
  ConsumerState<ForumReplyScreen> createState() => _ForumReplyScreenState();
}

class _ForumReplyScreenState extends ConsumerState<ForumReplyScreen> {
  final TextEditingController _replyController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Auto focus input field when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _replyController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(forumPostDetailViewModelProvider(widget.postId));

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
          'Balas Diskusi',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          // Post Preview (if available)
          if (state.post != null)
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with author info
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withOpacity(0.05),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                AppColors.primaryBlue.withOpacity(0.3),
                                AppColors.primaryBlue.withOpacity(0.5),
                              ],
                            ),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.post!.authorName,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textDark,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Diskusi yang Anda balas',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Post Content
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          state.post!.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Details
                        Text(
                          state.post!.details,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textDark,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          // Reply Input Section
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit_note,
                          size: 20,
                          color: AppColors.primaryBlue,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Tulis Balasan Anda',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Input Field
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: _replyController,
                        focusNode: _focusNode,
                        onChanged: (text) {
                          // Force rebuild to update button state
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: 'Bagikan pendapat atau pengalaman Anda...',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 12,
                          ),
                        ),
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textDark,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  // Character count (optional, bisa diaktifkan jika perlu)
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  //   child: Text(
                  //     '${_replyController.text.length} karakter',
                  //     style: TextStyle(
                  //       fontSize: 12,
                  //       color: Colors.grey.shade500,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Send Button
          Container(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
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
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (state.isReplying ||
                          _replyController.text.trim().isEmpty)
                      ? null
                      : _sendReply,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    disabledBackgroundColor: Colors.grey.shade300,
                    disabledForegroundColor: Colors.grey.shade600,
                  ),
                  child: state.isReplying
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Mengirim...',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.send_rounded,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Kirim Balasan',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendReply() {
    final replyText = _replyController.text.trim();
    if (replyText.isEmpty) return;

    ref
        .read(forumPostDetailViewModelProvider(widget.postId).notifier)
        .replyPost(replyText)
        .then((_) {
      // Show success message
      ErrorSnackbar.showSuccess(context, 'Balasan berhasil dikirim');
      // Pop back to detail screen
      Navigator.of(context).pop();
      // Refresh the detail screen to show new reply
      ref
          .read(forumPostDetailViewModelProvider(widget.postId).notifier)
          .refresh();
    }).catchError((error) {
      ErrorSnackbar.show(context, error.toString());
    });
  }
}
