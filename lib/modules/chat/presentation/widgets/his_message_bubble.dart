import 'package:flutter/material.dart';
import 'package:yes_or_no_app/modules/chat/domain/entities/message.dart';

class HisMessageBubble extends StatelessWidget {
  final Message message;
  const HisMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final ColorScheme color = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color.secondary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ),
        const SizedBox(height: 4),
        _ImageBubble(imageUrl: message.imageUrl!),
        const SizedBox(height: 8)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
