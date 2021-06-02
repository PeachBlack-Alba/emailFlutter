import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as native_image;
import 'package:image_picker/image_picker.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _subjectController = TextEditingController(text: 'The subject');

  final _bodyController = TextEditingController(
    text: 'Mail body.',
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  File image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(title:Text( 'Messages')),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _subjectController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _bodyController,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(labelText: 'Body', border: OutlineInputBorder()),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Wrap(
                  children: <Widget>[
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: image != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.file(
                                        image,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
                                      width: 100,
                                      height: 100,
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                            ),
                            FlatButton(
                              onPressed: () => {imgFromGallery()},
                              child: Row(
                                // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Text('Attach files'),
                                  IconButton(
                                    icon: Icon(Icons.attach_file),
                                    onPressed: () {
                                      imgFromGallery();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            FlatButton(
                              onPressed: () => {},
                              color: Colors.green,
                              padding: EdgeInsets.all(10.0),
                              child: Text('Send'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }

  Future imgFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 25, maxWidth: 1920, maxHeight: 1080);

    setState(() {
      this.image = image;
    });
  }
}
