import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/utils/date_formatter.dart';
import 'package:wellmom_app/features/forum/presentation/providers/forum_providers.dart';

class ForumPostDetailScreen extends ConsumerStatefulWidget {
  final int postId;

  const ForumPostDetailScreen({
    super.key,
    required this.postId,
  });

  @override
  ConsumerState<ForumPostDetailScreen> createState() =>
      _ForumPostDetailScreenState();
}

class _ForumPostDetailScreenState
    extends ConsumerState<ForumPostDetailScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
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
          'Diskusi',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: state.isLoading && state.post == null
          ? const Center(child: CircularProgressIndicator())
          : state.error != null && state.post == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 48,
                        color: AppColors.textLight,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        state.error!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.textLight,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          ref
                              .read(forumPostDetailViewModelProvider(
                                      widget.postId)
                                  .notifier)
                              .refresh();
                        },
                        child: const Text('Coba Lagi'),
                      ),
                    ],
                  ),
                )
              : state.post == null
                  ? const Center(
                      child: Text('Post tidak ditemukan'),
                    )
                  : Column(
                      children: [
                        // Post Content
                        Expanded(
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Author Info
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 24,
                                      backgroundColor: Colors.grey[300],
                                      child: const Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                        size: 28,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.post!.authorName,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.textDark,
                                            ),
                                          ),
                                          Text(
                                            DateFormatter.formatRelativeTime(
                                                state.post!.createdAt),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: AppColors.textLight,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                // Post Title
                                Text(
                                  state.post!.title,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                // Post Details
                                Text(
                                  state.post!.details,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textDark,
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                // Like Button
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: state.isLiking
                                          ? null
                                          : () {
                                              ref
                                                  .read(
                                                      forumPostDetailViewModelProvider(
                                                              widget.postId)
                                                          .notifier)
                                                  .toggleLike();
                                            },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: state.post!.isLiked
                                              ? Colors.red.withOpacity(0.1)
                                              : Colors.grey.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: state.post!.isLiked
                                                ? Colors.red
                                                : Colors.grey.shade300,
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              state.post!.isLiked
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: state.post!.isLiked
                                                  ? Colors.red
                                                  : AppColors.textLight,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              '${state.post!.likeCount}',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: state.post!.isLiked
                                                    ? Colors.red
                                                    : AppColors.textLight,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          AppRouter.forumReply,
                                          arguments: widget.postId,
                                        ).then((_) {
                                          // Refresh post detail when coming back from reply screen
                                          ref
                                              .read(forumPostDetailViewModelProvider(
                                                      widget.postId)
                                                  .notifier)
                                              .refresh();
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(
                                            color: Colors.grey.shade300,
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(
                                              Icons.reply,
                                              color: AppColors.primaryBlue,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              '${state.post!.replyCount}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.textLight,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                // Replies Section
                                if (state.post!.replies.isNotEmpty) ...[
                                  const Text(
                                    'Balasan',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  ...state.post!.replies.map((reply) {
                                    return _buildReplyItem(reply);
                                  }),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
    );
  }

  Widget _buildReplyItem(reply) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey[300],
                child: const Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 18,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reply.authorName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDark,
                      ),
                    ),
                    Text(
                      DateFormatter.formatRelativeTime(reply.createdAt),
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            reply.replyText,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textDark,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
