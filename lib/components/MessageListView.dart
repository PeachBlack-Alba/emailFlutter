import 'package:emailFlutter/components/NewMessageOptions.dart';
import 'package:flutter/material.dart';

import 'MessageCard.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            MessageCard(),
            MessageCard(),
            MessageCard(),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FloatingActionButton(
                backgroundColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewMessageOptions()));
                },
                child: Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
}
