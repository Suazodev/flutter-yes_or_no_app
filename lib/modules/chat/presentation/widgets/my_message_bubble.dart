import 'package:flutter/material.dart';
import 'package:yes_or_no_app/modules/chat/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final ColorScheme color = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
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
        const SizedBox(height: 8)
      ],
    );
  }
}
