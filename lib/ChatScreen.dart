import 'package:flutter/material.dart';

import 'components/ChatMessage.dart';
import 'components/MessageBox.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: Stack(children: [
        Column(
          children: <Widget>[
            Center(
              child: ChatMessage(
                message: 'Hello!,Thank you for contacting us.',
                messageType: MessageType.sent,
                showTime: true,
                time: '5 mins ago',
              ),
            ),
            Center(
              child: ChatMessage(
                message: 'Please explain how can we assist you today.',
                messageType: MessageType.sent,
                showTime: true,
                time: '5 mins ago',
              ),
            ),
            Center(
              child: ChatMessage(
                message: 'I lost the keys of my appartment.',
                showTime: true,
                time: '5 mins ago',
              ),
            ),
            Center(
              child: ChatMessage(
                message: 'Is it possible to get a copy?.',
                showTime: true,
                time: '5 mins ago',
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MessageBox(),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
