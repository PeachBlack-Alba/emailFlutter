import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:thebase_app/ui/components/appBarComponent/AppBarComponent.dart';
import 'package:thebase_app/ui/components/appBarComponent/AppBarTransparentComponent.dart';
import 'package:thebase_app/ui/routing/routes.dart';
import 'package:thebase_app/ui/styles/Colors.dart';

import 'MessageCard.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            AppBarTransparentComponent(centerTitle: true, title: 'All Messages', showBack: true, backgroundColor: TheBaseColors.lightBlue),
          ];
        },
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
                  backgroundColor: TheBaseColors.lightBlue,
                  onPressed: () {
                    Navigator.pop(context);
                    pushNewScreen(context,
                        screen: Routes.getWidgetForRoute(Routes.newMessageOptions, context),
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                        withNavBar: true);
                  },
                  child: Icon(Icons.add),
//                  child: Container(
//                    height: 50,
//                    width: 150,
//                    decoration: BoxDecoration(color: TheBaseColors.lightBlue, borderRadius: BorderRadius.circular(10)),
//                    child: Center(
//                      child: Text(
//                        'Send New Message',
//                        style: TextStyle(fontSize: 15, color: Colors.white),
//                      ),
//                    ),
//                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
