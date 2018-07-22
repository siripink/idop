import 'package:flutter/material.dart';

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
            title: Text('Homepage'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            title: Text('Application'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return drawer();
  }
}