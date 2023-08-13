import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_or_no_app/modules/chat/domain/entities/message.dart';
import 'package:yes_or_no_app/modules/chat/presentation/providers/chat_provider.dart';
import 'package:yes_or_no_app/modules/chat/presentation/widgets/his_message_bubble.dart';
import 'package:yes_or_no_app/modules/chat/presentation/widgets/my_message_bubble.dart';
import 'package:yes_or_no_app/shared/widgets/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media.licdn.com/dms/image/C4D03AQGVW8N4ASaQXQ/profile-displayphoto-shrink_800_800/0/1602160194806?e=1697673600&v=beta&t=m__x-wJmDXWNE1CmBpP3HPVf2NbBThyyko-7LKd8gHs'),
          ),
        ),
        centerTitle: false,
        title: const Text('Maridito ♥️'),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.him)
                      ? HisMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            const SizedBox(height: 8),
            MessageFieldBox(onValue: chatProvider.sendMessage)
          ],
        ),
      ),
    );
  }
}
