import 'package:flutter/material.dart';
import 'package:yes_or_no_app/config/helpers/get_yes_or_no_answer.dart';
import 'package:yes_or_no_app/modules/chat/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesOrNoAnswer getYesOrNoAnswer = GetYesOrNoAnswer();

  List<Message> messageList = [
    Message(
      text: 'Hola mundo',
      imageUrl: null,
      fromWho: FromWho.mine,
    ),
    Message(
      text: 'PEPE',
      imageUrl: null,
      fromWho: FromWho.mine,
    ),
  ];

  Future<void> sendMessage(String textMessage) async {
    if (textMessage.isEmpty) return;
    final newMessage = Message(
      text: textMessage,
      imageUrl: null,
      fromWho: FromWho.mine,
    );
    messageList.add(newMessage);
    if (textMessage.endsWith('?')) {
      himReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> himReply() async {
    final herMessage = await getYesOrNoAnswer.getYesOrNoAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
