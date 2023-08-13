import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_or_no_app/config/theme/theme.dart';
import 'package:yes_or_no_app/modules/chat/presentation/providers/chat_provider.dart';
import 'package:yes_or_no_app/modules/chat/presentation/screens/chat_screen.dart';

class YesOrNoApp extends StatelessWidget {
  const YesOrNoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme().themeData,
        home: const ChatScreen(),
      ),
    );
  }
}
