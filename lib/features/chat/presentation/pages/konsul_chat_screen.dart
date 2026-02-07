import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/features/chat/data/models/chat_message_model.dart';
import 'package:wellmom_app/features/chat/presentation/providers/chat_providers.dart';
import 'package:wellmom_app/features/chat/presentation/providers/chat_websocket_providers.dart';

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
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: (perawatPhotoUrl != null && perawatPhotoUrl.isNotEmpty)
                  ? NetworkImage(_imageUrl(perawatPhotoUrl))
                  : null,
              child: (perawatPhotoUrl == null || perawatPhotoUrl.isEmpty)
                  ? const Icon(Icons.person, color: Colors.grey)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                perawatName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messagesAsync = ref.watch(chatMessagesWithWsProvider(conversationId));

    return messagesAsync.when(
      data: (messages) {
        if (messages.isEmpty) {
          return const Center(
            child: Text(
              'Belum ada pesan. Mulai percakapan.',
              style: TextStyle(color: AppColors.textLight, fontSize: 14),
            ),
          );
        }
        return ListView.builder(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final msg = messages[messages.length - 1 - index];
            return _MessageBubble(message: msg);
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

class _MessageBubble extends ConsumerWidget {
  final ChatMessageModel message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Tentukan isMe: pesan dari ibu hamil = pesan saya (karena user yang login adalah ibu hamil)
    // Jika di masa depan ada role lain, bisa dibandingkan dengan currentUser.id
    final isMe = message.isFromIbuHamil;
    
    // Format waktu pengiriman
    final timeStr = DateFormat('HH:mm').format(message.createdAt);
    
    // Batasi lebar maksimum bubble (70% dari lebar layar)
    final maxBubbleWidth = MediaQuery.of(context).size.width * 0.70;

    // Warna untuk pesan saya (isMe == true)
    final myBubbleColor = AppColors.primaryBlue;
    final myTextColor = Colors.white;
    final myTimeColor = Colors.white.withOpacity(0.85);

    // Warna untuk pesan lawan bicara (isMe == false)
    final otherBubbleColor = Colors.grey.shade200;
    final otherTextColor = AppColors.textDark;
    final otherTimeColor = AppColors.textLight;

    // Tentukan warna berdasarkan isMe
    final bubbleColor = isMe ? myBubbleColor : otherBubbleColor;
    final textColor = isMe ? myTextColor : otherTextColor;
    final timeColor = isMe ? myTimeColor : otherTimeColor;

    // BorderRadius dengan sudut yang lebih lancip di sisi pengirim
    const radius = 18.0;
    const sharpRadius = 4.0; // Sudut lancip untuk "tail"
    
    final borderRadius = isMe
        ? BorderRadius.only(
            // Pesan saya: sudut kiri atas dan bawah lancip, kanan membulat
            topLeft: const Radius.circular(radius),
            topRight: const Radius.circular(radius),
            bottomLeft: const Radius.circular(sharpRadius),
            bottomRight: const Radius.circular(radius),
          )
        : BorderRadius.only(
            // Pesan lawan: sudut kanan atas dan bawah lancip, kiri membulat
            topLeft: const Radius.circular(radius),
            topRight: const Radius.circular(radius),
            bottomLeft: const Radius.circular(radius),
            bottomRight: const Radius.circular(sharpRadius),
          );

    // Content bubble dengan padding yang nyaman
    final content = Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      constraints: BoxConstraints(maxWidth: maxBubbleWidth),
      decoration: BoxDecoration(
        color: bubbleColor,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Teks pesan
          Text(
            message.messageText,
            style: TextStyle(
              fontSize: 15,
              color: textColor,
              height: 1.4,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 6),
          // Waktu pengiriman di sudut bawah
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                timeStr,
                style: TextStyle(
                  fontSize: 11,
                  color: timeColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    // Alignment: kanan untuk pesan saya, kiri untuk pesan lawan
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(
            left: isMe ? 40 : 0,
            right: isMe ? 0 : 40,
          ),
          child: content,
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
        child: Text(
          'Mulai konsultasi dengan $perawatName. Ketik pesan di bawah dan kirim.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
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
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: 12 + MediaQuery.of(context).padding.bottom,
      ),
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Tulis pesan...',
                  hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                  filled: true,
                  fillColor: const Color(0xFFF0F0F0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                maxLines: 4,
                minLines: 1,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => onSend(),
              ),
            ),
            const SizedBox(width: 8),
            Material(
              color: canSend ? AppColors.primaryBlue : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(24),
              child: InkWell(
                onTap: canSend && !sending ? onSend : null,
                borderRadius: BorderRadius.circular(24),
                child: SizedBox(
                  width: 48,
                  height: 48,
                  child: sending
                      ? const Padding(
                          padding: EdgeInsets.all(12),
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                          ),
                        )
                      : const Icon(Icons.send_rounded, color: Colors.white, size: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
