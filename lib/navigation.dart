import 'package:flutter/material.dart';
import 'package:flutter_idop/application.dart';
import 'package:flutter_idop/chanting.dart';
import 'package:flutter_idop/procedure.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class Navigation extends StatefulWidget {

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  Widget drawer() {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the Drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset(
              'images/logo.png',
              fit: BoxFit.fitWidth,
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrange[300],
            ),
          ),
          ListTile(
            title: Text('Training'),
          ),
          buildMenu('Program & schedules', 'action'),
          buildMenu('Procedure', 'procedure'),
          buildMenu('Chanting script & audio', 'chanting'),
          buildMenu('Eligibility', 'eligibility'),
          new Divider(),
          ListTile(
            title: Text('Online Application'),
            onTap: () => _navigateTo('Application'),
          ),
        ],
      ),
    );
  }

  void _navigateTo(String title) {
    //close the drawer
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        switch (title) {
          case 'procedure':
            return Procedure();
            break;
          case 'chanting':
            return Chanting();
            break;
          case 'application':
            return Application();
            break;
        }
      },
    ));
  }

  Widget buildMenu(String title, String action) {
    return GestureDetector(
        onTap: () {
          _navigateTo(action);
        },
        child: new Container(
          padding: new EdgeInsets.only(left: 50.0, bottom: 20.0),
          child: new Text(title,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return drawer();
  }
}
