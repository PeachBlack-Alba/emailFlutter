import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:thebase_app/ui/components/appBarComponent/AppBarTransparentComponent.dart';
import 'package:thebase_app/ui/routing/routes.dart';
import 'package:thebase_app/ui/styles/Colors.dart';

class IconMenu {
  final IconData iconName;
  final String titleIcon;

  IconMenu({this.iconName, this.titleIcon});
}

List<IconMenu> iconList = [
  IconMenu(iconName: Icons.apartment, titleIcon: 'My Apartment'),
  IconMenu(iconName: Icons.person, titleIcon: 'Community'),
  IconMenu(iconName: Icons.picture_as_pdf_outlined, titleIcon: 'My Contract'),
  IconMenu(iconName: Icons.event, titleIcon: 'Events'),
  IconMenu(iconName: Icons.design_services, titleIcon: 'Services'),
  IconMenu(iconName: Icons.all_inclusive, titleIcon: 'Other'),
];

class NewMessageOptions extends StatefulWidget {
  @override
  _NewMessageOptionsState createState() => _NewMessageOptionsState();
}

class _NewMessageOptionsState extends State<NewMessageOptions> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            AppBarTransparentComponent(centerTitle: true, title: 'Choose a Message Subject', showBack: true, backgroundColor: TheBaseColors.lightBlue),
          ];
        },
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.end,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 450,
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: iconList.length,
                      itemBuilder: (BuildContext context, int position) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = position;
                              print('im tapped');
                              Navigator.pop(context);
                              pushNewScreen(context,
                                  screen: Routes.getWidgetForRoute(Routes.newMessage, context),
                                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                  withNavBar: true);
                            });
                          },
                          //     onTap: () => setState(() => selectedIndex = position),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 10,
                            child: Card(
                              shape: (selectedIndex == position) ? RoundedRectangleBorder(side: BorderSide(color: TheBaseColors.lightGreen, width: 5)) : null,
                              elevation: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[Icon(iconList[position].iconName), Text(iconList[position].titleIcon)],
                              ),
                            ),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: (2 / 1),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}