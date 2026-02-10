import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/widgets/error_snackbar.dart';
import 'package:wellmom_app/features/chatbot/presentation/providers/chatbot_providers.dart';
import 'package:wellmom_app/features/chatbot/presentation/viewmodels/chatbot_view_model.dart';
import 'package:wellmom_app/features/chatbot/presentation/widgets/chat_bubble.dart';
import 'package:wellmom_app/features/chatbot/presentation/widgets/chat_input.dart';
import 'package:wellmom_app/features/chatbot/presentation/widgets/quota_indicator.dart';
import 'package:wellmom_app/features/chatbot/presentation/widgets/typing_indicator.dart';

/// Main chatbot screen
class ChatbotScreen extends ConsumerStatefulWidget {
  const ChatbotScreen({super.key});

  @override
  ConsumerState<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends ConsumerState<ChatbotScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _handleSend(String message) {
    ref.read(chatbotViewModelProvider.notifier).sendMessage(message);
    _scrollToBottom();
  }

  void _showHistoryBottomSheet() {
    // Fetch conversations first
    ref.read(chatbotViewModelProvider.notifier).fetchConversations();
    
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _buildHistorySheet(),
    );
  }

  Widget _buildHistorySheet() {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(chatbotViewModelProvider);
        
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Riwayat Percakapan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      ref.read(chatbotViewModelProvider.notifier).startNewConversation();
                    },
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Baru'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (state.conversations.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Belum ada riwayat percakapan',
                      style: TextStyle(
                        color: AppColors.textLight,
                      ),
                    ),
                  ),
                )
              else
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.4,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.conversations.length,
                    itemBuilder: (context, index) {
                      final conversation = state.conversations[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const CircleAvatar(
                          backgroundColor: AppColors.primaryBlue,
                          child: Icon(
                            Icons.chat,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        title: Text(
                          conversation.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          '${conversation.messageCount} pesan',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textLight,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          color: AppColors.textLight,
                          onPressed: () async {
                            final success = await ref
                                .read(chatbotViewModelProvider.notifier)
                                .deleteConversation(conversation.id);
                            if (!success && mounted) {
                              ErrorSnackbar.show(
                                context, 
                                'Gagal menghapus percakapan',
                              );
                            }
                          },
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          ref.read(chatbotViewModelProvider.notifier)
                              .loadConversationHistory(conversation.id);
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatbotViewModelProvider);

    // Listen for errors and state changes
    ref.listen(chatbotViewModelProvider, (ChatbotState? previous, ChatbotState next) {
      if (next.error != null && (previous == null || previous.error != next.error)) {
        ErrorSnackbar.show(context, next.error!);
        ref.read(chatbotViewModelProvider.notifier).clearError();
      }
      
      // Scroll to bottom when new message arrives or typing indicator appears
      if (previous == null || 
          next.messages.length != previous.messages.length ||
          (next.isSending && !previous.isSending)) {
        _scrollToBottom();
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: AppColors.primaryBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.smart_toy,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'WellBot',
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Asisten Kesehatan',
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: AppColors.textDark),
            onPressed: _showHistoryBottomSheet,
            tooltip: 'Riwayat',
          ),
        ],
      ),
      body: Column(
        children: [
          // Status banner when chatbot is not available
          if (state.status != null && !state.status!.isAvailable)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: Colors.orange.shade100,
              child: Row(
                children: [
                  Icon(Icons.warning_amber_rounded, 
                       color: Colors.orange.shade700, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      state.status!.error ?? 'WellBot sedang tidak tersedia',
                      style: TextStyle(
                        color: Colors.orange.shade900,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(chatbotViewModelProvider.notifier).checkStatus();
                    },
                    child: Text(
                      'Coba Lagi',
                      style: TextStyle(
                        color: Colors.orange.shade700,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          
          // Quota indicator
          if (state.quota != null && state.isChatbotAvailable)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QuotaIndicator(quota: state.quota),
                ],
              ),
            ),
          
          // Messages list
          Expanded(
            child: state.isLoading || state.isCheckingStatus
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryBlue,
                    ),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    itemCount: state.messages.length + (state.isSending ? 1 : 0),
                    itemBuilder: (context, index) {
                      // Show typing indicator as last item when sending
                      if (state.isSending && index == state.messages.length) {
                        return const TypingIndicator();
                      }
                      
                      final message = state.messages[index];
                      // Skip loading messages (they're replaced by TypingIndicator)
                      if (message.isLoading) {
                        return const SizedBox.shrink();
                      }
                      
                      return ChatBubble(message: message);
                    },
                  ),
          ),
          
          // Input field
          ChatInput(
            onSend: _handleSend,
            enabled: state.canSendMessage,
            isSending: state.isSending,
          ),
        ],
      ),
    );
  }
}
