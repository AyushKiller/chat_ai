import 'package:chat_ai/chat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatAI());
}

class ChatAI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData.dark(),
      home:ChatScreen(),
    );
  }
}
