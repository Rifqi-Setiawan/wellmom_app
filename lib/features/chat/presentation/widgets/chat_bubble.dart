import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/features/chat/data/models/chat_message_model.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageModel message;
  final bool isMe;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    // Colors for message bubbles
    // isMe (pesan sendiri): biru dengan teks putih, rata kanan
    // !isMe (pesan dari perawat): abu-abu dengan teks hitam, rata kiri
    final backgroundColor = isMe 
        ? AppColors.primaryBlue // Biru untuk pesan dari user yang login
        : Colors.grey.shade200; // Abu-abu terang untuk pesan dari perawat
    final textColor = isMe 
        ? Colors.white // Putih untuk pesan dari user
        : const Color(0xFF333333); // Hitam untuk pesan dari perawat
    final timeColor = isMe 
        ? Colors.white.withOpacity(0.9) // Putih semi-transparan untuk timestamp pesan user
        : Colors.grey.shade600; // Abu-abu untuk timestamp pesan perawat
    
    // Border Radius
    // isMe: sudut kanan bawah lancip (pointy end)
    // !isMe: sudut kiri bawah lancip (pointy end)
    const radius = Radius.circular(16);
    const smallRadius = Radius.circular(4); // Sedikit lebih besar untuk lebih jelas
    
    final borderRadius = isMe
        ? const BorderRadius.only(
            topLeft: radius,
            topRight: radius,
            bottomLeft: radius,
            bottomRight: smallRadius, // Sudut kanan bawah lancip untuk pesan sendiri
          )
        : const BorderRadius.only(
            topLeft: radius,
            topRight: radius,
            bottomLeft: smallRadius, // Sudut kiri bawah lancip untuk pesan dari perawat
            bottomRight: radius,
          );

    final timeStr = DateFormat('HH:mm').format(message.createdAt);

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end, // Align timestamp to right
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message.messageText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                timeStr,
                style: TextStyle(
                  color: timeColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
