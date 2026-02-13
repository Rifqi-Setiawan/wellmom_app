import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/features/chat/data/models/chat_message_model.dart';
import 'package:wellmom_app/features/chat/presentation/providers/chat_providers.dart';
import 'package:wellmom_app/features/chat/presentation/providers/chat_websocket_providers.dart';
import 'package:wellmom_app/features/chat/presentation/widgets/chat_bubble.dart';

/// Arguments to open Konsul chat: either existing [conversationId] or start with assigned [perawatId].
class KonsulChatArgs {
  final int? conversationId;
  final int? perawatId;
  final String? perawatName;
  final String? perawatPhotoUrl;

  const KonsulChatArgs({
    this.conversationId,
    this.perawatId,
    this.perawatName,
    this.perawatPhotoUrl,
  });

  static KonsulChatArgs? fromDynamic(dynamic args) {
    if (args == null) return null;
    if (args is KonsulChatArgs) return args;
    if (args is Map) {
      return KonsulChatArgs(
        conversationId: args['conversationId'] as int?,
        perawatId: args['perawatId'] as int?,
        perawatName: args['perawatName'] as String?,
        perawatPhotoUrl: args['perawatPhotoUrl'] as String?,
      );
    }
    return null;
  }
}

String _imageUrl(String? path) {
  if (path == null || path.isEmpty) return '';
  if (path.startsWith('http')) return path;
  return 'http://103.191.92.29:8000$path';
}

class KonsulChatScreen extends ConsumerStatefulWidget {
  final KonsulChatArgs? args;

  const KonsulChatScreen({super.key, this.args});

  @override
  ConsumerState<KonsulChatScreen> createState() => _KonsulChatScreenState();
}

class _KonsulChatScreenState extends ConsumerState<KonsulChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _sending = false;
  String? _sendError;
  /// Set after first send when opening with perawatId only.
  int? _resolvedConversationId;

  int? get _conversationId => _resolvedConversationId ?? widget.args?.conversationId;
  int? get _perawatId => widget.args?.perawatId;

  @override
  void initState() {
    super.initState();
    final cid = widget.args?.conversationId;
    if (cid != null) {
      ref.read(chatRepositoryProvider).markRead(cid);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    ref.invalidate(conversationsListProvider);
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _sending) return;
    if (_conversationId == null && _perawatId == null) {
      setState(() => _sendError = 'Pilih percakapan atau perawat.');
      return;
    }
    setState(() {
      _sending = true;
      _sendError = null;
    });
    _controller.clear();

    final repo = ref.read(chatRepositoryProvider);
    final result = await repo.sendMessage(
      conversationId: _conversationId,
      perawatId: _perawatId,
      messageText: text,
    );

    result.fold(
      (failure) {
        if (mounted) {
          setState(() {
            _sending = false;
            _sendError = failure.message;
          });
        }
      },
      (message) {
        if (mounted) {
          setState(() {
            _sending = false;
            _resolvedConversationId ??= message.conversationId;
          });
          ref.invalidate(conversationsListProvider);
          ref.invalidate(chatMessagesWithWsProvider(message.conversationId));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = widget.args ?? KonsulChatArgs.fromDynamic(ModalRoute.of(context)?.settings.arguments);
    final conversationId = args?.conversationId;
    final perawatId = args?.perawatId;
    final perawatName = args?.perawatName ?? 'Perawat';
    final perawatPhotoUrl = args?.perawatPhotoUrl;

    // Resolve conversationId from perawatId so chat lama langsung dimuat saat buka
    final resolvedFromPerawat = perawatId != null && conversationId == null && _resolvedConversationId == null
        ? ref.watch(conversationIdByPerawatProvider(perawatId)).valueOrNull
        : null;
    final effectiveConversationId = conversationId ?? _resolvedConversationId ?? resolvedFromPerawat;
    final resolvingPerawat = perawatId != null && conversationId == null && _resolvedConversationId == null
        ? ref.watch(conversationIdByPerawatProvider(perawatId))
        : const AsyncValue<int?>.data(null);
    final canSend = effectiveConversationId != null || perawatId != null;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC), // Cleaner, verified medical/healthcare look light grey
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: (perawatPhotoUrl != null && perawatPhotoUrl.isNotEmpty)
                      ? NetworkImage(_imageUrl(perawatPhotoUrl))
                      : null,
                  child: (perawatPhotoUrl == null || perawatPhotoUrl.isEmpty)
                      ? const Icon(Icons.person, color: Colors.grey)
                      : null,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.shade700,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    perawatName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    'Online',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
            IconButton(
                onPressed: () {}, 
                icon: const Icon(Icons.more_vert, color: AppColors.textLight)
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: effectiveConversationId != null
                ? _MessageList(
                    conversationId: effectiveConversationId,
                    scrollController: _scrollController,
                    perawatName: perawatName,
                  )
                : resolvingPerawat.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _EmptyConversation(perawatName: perawatName),
          ),
          if (_sendError != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                _sendError!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          _InputBar(
            controller: _controller,
            sending: _sending,
            canSend: canSend,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}

class _MessageList extends ConsumerWidget {
  final int conversationId;
  final ScrollController scrollController;
  final String perawatName;

  const _MessageList({
    required this.conversationId,
    required this.scrollController,
    required this.perawatName,
  });

  // Group messages by date
  Map<String, List<ChatMessageModel>> _groupMessagesByDate(List<ChatMessageModel> messages) {
    final grouped = <String, List<ChatMessageModel>>{};
    for (var msg in messages) {
      final dateKey = _getDateKey(msg.createdAt);
      if (!grouped.containsKey(dateKey)) {
        grouped[dateKey] = [];
      }
      grouped[dateKey]!.add(msg);
    }
    return grouped;
  }

  String _getDateKey(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final checkDate = DateTime(date.year, date.month, date.day);

    if (checkDate == today) {
        return 'Hari Ini';
    } else if (checkDate == yesterday) {
        return 'Kemarin';
    } else {
        return DateFormat('EEE, d MMM y', 'id_ID').format(date);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Note: ChatMessageModel uses senderRole ('ibu_hamil' or 'perawat') from backend field "sender_role"
    // So we determine isMe based on senderRole == 'ibu_hamil' using isFromIbuHamil getter
    
    // Note: Assuming 'id_ID' locale is initialized in main.dart or supported by intl.
    // If not, might default to English formatting or need initialization.
    final messagesAsync = ref.watch(chatMessagesWithWsProvider(conversationId));
    return messagesAsync.when(
      data: (messages) {
        if (messages.isEmpty) {
          return Center(
            child: Text(
              'Belum ada pesan. Mulai percakapan.',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
            ),
          );
        }

        // The API returns messages, likely sorted newest first or oldest first. 
        // We need to check ordering. Assuming newest first based on previous code `reverse: true`.
        // Let's re-sort to be safe: Oldest first for grouping logic
        final sortedMessages = List<ChatMessageModel>.from(messages);
        sortedMessages.sort((a, b) => a.createdAt.compareTo(b.createdAt));

        final groupedMessages = _groupMessagesByDate(sortedMessages);
        final dateKeys = groupedMessages.keys.toList();

        return ListView.builder(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
          // We use normal direction (reverse: false) for easier grouped rendering 
          // but we need to auto-scroll to bottom on load.
          // Or we can stick to reverse: true BUT then we have to reverse the groups.
          // Let's use reverse: true for chat feel, so we reverse the groups and items inside.
          reverse: true,
          itemCount: dateKeys.length,
          itemBuilder: (context, index) {
            // Reverse index to show newest group at bottom (start of list in reverse mode)
            final dateKey = dateKeys[dateKeys.length - 1 - index]; 
            final msgs = groupedMessages[dateKey]!;
            // Within group, show oldest to newest? No, if list is reverse, we want
            // the items to appear visually top-to-bottom.
            // In a reverse listview: index 0 is at bottom.
            // So we want the LAST group (most recent date) to be at index 0.
            
            return Column(
              children: [
                // Date Header should be at the "top" of the group visually.
                // In reverse column? No, Column is not reverse.
                // So: Date Header, then Messages.
                // Wait, if ListView is reverse, the bottom-most item is the first one rendered.
                // So if we have:
                // [Group Today]
                // [Group Yesterday]
                // We render [Group Today] first (at bottom).
                // Inside [Group Today], we want:
                // Header (Top)
                // Msg 1
                // Msg 2 (Bottom)
                // So the column children should be: Header, Msg1, Msg2...
                // But since ListView.reverse basically flips the whole scrolling area...
                
                // Let's try standard ListView (reverse: false) and scroll to bottom initially 
                // to avoid complexity with sticky headers nicely? 
                // Or stick to reverse: true which is standard for Chat.
                
                // If reverse: true
                // Item 0: Newest Group (Today)
                // Item 1: Yesterday Group
                
                // Inside Item 0 (Today):
                // We want it to look like:
                // [Header Today]
                // [Msg 1]
                // [Msg 2]
                // ...
                
                // So Column children:
                // Header
                // Msg 1
                // Msg 2
                
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        dateKey,
                        style: TextStyle(
                            fontSize: 12, 
                            fontWeight: FontWeight.w500, 
                            color: Colors.grey.shade700
                        ),
                      ),
                    ),
                  ),
                ),
                ...msgs.map((msg) {
                  // Determine if message is from current user (ibu hamil)
                  // Backend menggunakan field "sender_role" dengan nilai "ibu_hamil" atau "perawat"
                  // isFromIbuHamil getter sudah melakukan case-insensitive comparison
                  final isMe = msg.isFromIbuHamil;

                  return ChatBubble(
                    message: msg, 
                    isMe: isMe,
                  );
                }),
              ],
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Gagal memuat pesan: $e',
            style: const TextStyle(color: Colors.red, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class _EmptyConversation extends StatelessWidget {
  final String perawatName;

  const _EmptyConversation({required this.perawatName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(Icons.chat_bubble_outline, size: 64, color: Colors.grey.shade300),
             const SizedBox(height: 16),
             Text(
              'Mulai konsultasi dengan $perawatName.\nKetik pesan di bawah dan kirim.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _InputBar extends StatelessWidget {
  final TextEditingController controller;
  final bool sending;
  final bool canSend;
  final VoidCallback onSend;

  const _InputBar({
    required this.controller,
    required this.sending,
    required this.canSend,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -2),
            blurRadius: 10,
          ),
        ],
      ),
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
        top: 10,
        bottom: 10 + MediaQuery.of(context).padding.bottom,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
            // Attachment Button
            Padding(
                padding: const EdgeInsets.only(bottom: 6, right: 8),
                child: InkWell(
                    onTap: () {
                        // Action attachment
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.attach_file, color: Colors.grey),
                    ),
                ),
            ),
            
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFF2F4F5),
                        borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                            hintText: 'Tulis pesan...',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        maxLines: 4,
                        minLines: 1,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (_) => onSend(),
                    ),
                ),
            ),
            
            const SizedBox(width: 8),

            // Send Button
            Padding(
                padding: const EdgeInsets.only(bottom: 2), // Align with text field
                child: Material(
                  color: canSend ? AppColors.primaryBlue : Colors.grey.shade300,
                  shape: const CircleBorder(),
                  elevation: canSend ? 2 : 0,
                  child: InkWell(
                    onTap: canSend && !sending ? onSend : null,
                    customBorder: const CircleBorder(),
                    child: SizedBox(
                      width: 44,
                      height: 44,
                      child: sending
                          ? const Padding(
                              padding: EdgeInsets.all(12),
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            )
                          : const Icon(Icons.send_rounded, color: Colors.white, size: 22),
                    ),
                  ),
                ),
            ),
        ],
      ),
    );
  }
}
