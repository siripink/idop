import 'package:flutter/material.dart';
import 'package:flutter_idop/application.dart';
import 'package:flutter_idop/chanting.dart';

class Navigation extends StatefulWidget {
  const Navigation();

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
            title: Text('Chanting'),
            onTap: () => _navigateTo(context, 'Chanting'),
          ),
          ListTile(
            title: Text('Application'),
            onTap: () => _navigateTo(context, 'Application'),
          ),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, String title) {
    //close the drawer
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        switch (title) {
          case 'Chanting':
            return Chanting();
            break;
          case 'Application':
            return Application();
            break;
        }

      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return drawer();
  }
}