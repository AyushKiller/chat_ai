import 'dart:async';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'chat_message.dart';

class ChatScreen extends StatefulWidget {

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
 
class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller=TextEditingController();
  final List<ChatMessage>_messages=[];
  OpenAI?chatGPT;
  StreamSubscription?_subscription;
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _sendMessage(){
    ChatMessage _message=ChatMessage(text: _controller.text, sender: "user");



   setState(() {
    _messages.insert(0, _message);
  });
  _controller.clear();
  }
  Widget _buildTextComposer(){
    return Row(
      children: [
        Expanded(child:TextField(
          onSubmitted: (value)=>_sendMessage(),
          controller: _controller,
          decoration: InputDecoration.collapsed(hintText: 'send a message'),
        ),
        ),
        IconButton(onPressed: ()=>_sendMessage(),
          icon:const Icon(Icons.send),)
      ],
    ).px16();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('chataAi'),
        //backgroundColor:Colors.lightBlueAccent,
      ),
      body:SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              child:ListView.builder(
                reverse:true,
                padding: Vx.m8,
                itemCount: _messages.length,
                itemBuilder: (context,index){
               return _messages[index];
      },)),

            Container(
              decoration:BoxDecoration(
                color: context.cardColor,
              ),
              child:_buildTextComposer(),
            )
          ],



        ),
      ),
    );
  }
}


