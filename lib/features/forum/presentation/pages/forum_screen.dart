import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/routing/app_router.dart';
import 'package:wellmom_app/core/utils/date_formatter.dart';
import 'package:wellmom_app/features/forum/data/models/forum_post_full_model.dart';
import 'package:wellmom_app/features/forum/presentation/pages/forum_create_post_screen.dart';
import 'package:wellmom_app/features/forum/presentation/providers/forum_providers.dart';
import 'package:wellmom_app/features/forum/presentation/viewmodels/forum_view_model.dart';

class ForumScreen extends ConsumerStatefulWidget {
  const ForumScreen({super.key});

  @override
  ConsumerState<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends ConsumerState<ForumScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      final state = ref.read(forumViewModelProvider);
      if (state.hasMore && !state.isLoadingMore && !state.isLoading) {
        ref.read(forumViewModelProvider.notifier).fetchPosts();
      }
    }
  }

  Color _getCategoryColor(String categoryName) {
    final name = categoryName.toLowerCase();
    if (name.contains('kesehatan')) {
      return AppColors.primaryBlue;
    } else if (name.contains('nutrisi')) {
      return Colors.green;
    } else if (name.contains('olahraga')) {
      return Colors.orange;
    } else if (name.contains('curhat')) {
      return Colors.pink;
    } else if (name.contains('tips')) {
      return Colors.purple;
    }
    return AppColors.primaryBlue;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(forumViewModelProvider);

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
          'Forum Diskusi',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                // Debounce search
                Future.delayed(const Duration(milliseconds: 500), () {
                  if (_searchController.text == value) {
                    ref.read(forumViewModelProvider.notifier).searchPosts(value);
                  }
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari topik diskusi...',
                prefixIcon: const Icon(Icons.search, color: AppColors.textLight),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: AppColors.textLight),
                        onPressed: () {
                          _searchController.clear();
                          ref.read(forumViewModelProvider.notifier).searchPosts('');
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
            ),
          ),
          // Category Filter
          if (state.categories.isNotEmpty)
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: state.categories.length + 1, // +1 for "Semua" option
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // "Semua" option
                    final isSelected = state.selectedCategoryId == null;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: const Text('Semua'),
                        selected: isSelected,
                        onSelected: (selected) {
                          ref
                              .read(forumViewModelProvider.notifier)
                              .filterByCategory(null);
                        },
                        selectedColor: AppColors.primaryBlue.withOpacity(0.2),
                        checkmarkColor: AppColors.primaryBlue,
                        labelStyle: TextStyle(
                          color: isSelected
                              ? AppColors.primaryBlue
                              : AppColors.textDark,
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    );
                  }
                  final category = state.categories[index - 1];
                  final isSelected = state.selectedCategoryId == category.id;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(category.displayName),
                      selected: isSelected,
                      onSelected: (selected) {
                        ref
                            .read(forumViewModelProvider.notifier)
                            .filterByCategory(selected ? category.id : null);
                      },
                      selectedColor: _getCategoryColor(category.name)
                          .withOpacity(0.2),
                      checkmarkColor: _getCategoryColor(category.name),
                      labelStyle: TextStyle(
                        color: isSelected
                            ? _getCategoryColor(category.name)
                            : AppColors.textDark,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  );
                },
              ),
            ),
          const SizedBox(height: 8),
          // Posts List
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.read(forumViewModelProvider.notifier).refresh();
              },
              child: _buildPostsList(state),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const ForumCreatePostScreen(),
            ),
          );
          if (result == true) {
            // Refresh posts after creating
            ref.read(forumViewModelProvider.notifier).refresh();
          }
        },
        backgroundColor: AppColors.primaryBlue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildPostsList(ForumState state) {
    if (state.isLoading && state.posts.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null && state.posts.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: AppColors.textLight,
              ),
              const SizedBox(height: 16),
              Text(
                state.error!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textLight,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(forumViewModelProvider.notifier).refresh();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                ),
                child: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      );
    }

    if (state.posts.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.forum_outlined,
                size: 80,
                color: Colors.grey.shade300,
              ),
              const SizedBox(height: 24),
              const Text(
                'Belum ada diskusi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Yuk mulai berbagi pengalaman!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textLight,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ForumCreatePostScreen(),
                    ),
                  );
                  if (result == true) {
                    ref.read(forumViewModelProvider.notifier).refresh();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: const Text(
                  'Buat Diskusi Pertama',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      itemCount: state.posts.length + (state.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == state.posts.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          );
        }
        return _buildPostCard(state.posts[index]);
      },
    );
  }

  Widget _buildPostCard(ForumPostFullModel post) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRouter.forumPostDetail,
          arguments: post.id,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Author + Time
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: post.authorPhotoUrl != null
                      ? NetworkImage(post.authorPhotoUrl!)
                      : null,
                  child: post.authorPhotoUrl == null
                      ? const Icon(Icons.person, color: Colors.grey, size: 24)
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.authorName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        DateFormatter.formatRelativeTime(post.createdAt),
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textLight,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.bookmark_border,
                    color: AppColors.textLight,
                    size: 20,
                  ),
                  onPressed: () {
                    // TODO: Implement bookmark
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Title
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 8),
            // Preview Content
            Text(
              post.details,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textDark,
                height: 1.5,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            // Category Tag
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _getCategoryColor(post.categoryName).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _getCategoryColor(post.categoryName).withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Text(
                post.categoryDisplayName,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: _getCategoryColor(post.categoryName),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Footer: Likes + Replies
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      post.isLiked ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                      color: post.isLiked ? Colors.red : AppColors.textLight,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${post.likeCount}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    const Icon(
                      Icons.chat_bubble_outline,
                      size: 20,
                      color: AppColors.textLight,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${post.replyCount}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
