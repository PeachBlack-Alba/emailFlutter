import 'package:emailFlutter/components/NewMessageOptions.dart';
import 'package:flutter/material.dart';

import 'MessageCard.dart';

class MessageListView extends StatefulWidget {
  @override
  _MessageListViewState createState() => _MessageListViewState();
}

class _MessageListViewState extends State<MessageListView> {
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
