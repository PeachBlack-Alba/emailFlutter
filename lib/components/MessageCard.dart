import 'package:emailFlutter/ChatScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessageCard extends StatefulWidget {
  @override
  _MessageCardState createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('proceed to chat');
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            //  border: Border.all(color: Colors.blueAccent, width: 3),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    /////FIXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                    image: DecorationImage(image:AssetImage('assets/img/solange.jpg')),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'New Contract',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          Spacer(),
                          Text(
                            '5:20 PM',
                            style: TextStyle(color: Colors.grey, fontSize: 12.0),
                          ),
                        ],
                      ),
                      Text(
                        'Your new contract',
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Unread message',
                            style: TextStyle(color: Colors.black, fontSize: 12.0),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
