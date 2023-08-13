import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final InputDecoration inputDecoration = InputDecoration(
      hintText: 'Pregunta de "sí" o "no". Termina con "?"',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          final textValue = textController.text;
          onValue(textValue);
          textController.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(),
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
