import 'package:flutter/material.dart';

enum MessageType { sent, received }

class ChatMessage extends StatelessWidget {
  final String message;
  final MessageType messageType;
  final Color backgroundColor;
  final Color textColor;
  final String time;
  final bool showTime;
  final double maxWidth;
  final double minWidth;

  ChatMessage(
      {this.message, this.messageType, this.backgroundColor, this.textColor, this.time, this.showTime, this.minWidth, this.maxWidth});

  CrossAxisAlignment messageAlignment() {
    if (messageType == null || messageType == MessageType.received) {
      return CrossAxisAlignment.start;
    } else {
      return CrossAxisAlignment.end;
    }
  }
  //esquinitas de la burbuja

  double topLeftRadius() {
    if (messageType == null || messageType == MessageType.received) {
      return 0.0;
    } else {
      return 20.0;
    }
  }
//esquinitas de la burbuja
  double topRightRadius() {
    if (messageType == null || messageType == MessageType.received) {
      return 20.0;
    } else {
      return 0.0;
    }
  }

  Color messageBgColor(BuildContext context) {
    if (messageType == null || messageType == MessageType.received) {
      return Colors.green;
    } else {
      return Colors.blueAccent;
    }
  }

  Color messageTextColor(BuildContext context) {
    return Colors.black;


  }

  Text messageTime() {
    if(showTime != null && showTime == true) {
      return Text(
        time ?? 'Time',
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.green,
        ),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 24.0,
      ),
      child: Column(
        crossAxisAlignment: messageAlignment(),
        children: [
          Container(
            constraints: BoxConstraints(minWidth: minWidth ?? 100.0, maxWidth: maxWidth ?? 250.0),
            decoration: BoxDecoration(
              color: backgroundColor ?? messageBgColor(context),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeftRadius()),
                topRight: Radius.circular(topRightRadius()),
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
            child: Text(
              //aqui
              message ,
              style: TextStyle(
                color: textColor ?? messageTextColor(context),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 12.0,
            ),
            child: messageTime(),
          ),
        ],
      ),
    );
  }
}