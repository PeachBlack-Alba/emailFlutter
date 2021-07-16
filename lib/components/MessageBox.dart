import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: <Widget>[
            Material(
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.attach_file),
                  color:  Colors.blue, onPressed: () {  },
                ),
              ),
              color: Colors.white,
            ),

            // Text input
            Flexible(
              child: Container(
                child: TextField(
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                  controller: textEditingController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Write a message',
                    hintStyle: TextStyle(color:  Colors.blue),
                  ),
                ),
              ),
            ),

            // Send Message Button
            Material(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => {},
                  color: Colors.blue,
                ),
              ),
              color: Colors.white,
            ),
          ],
        ),
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.black, width: 0.5)), color: Colors.white),
      ),
    );
  }
}
