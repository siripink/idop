import 'package:flutter/material.dart';
import 'package:flutter_idop/application.dart';
import 'package:flutter_idop/chanting.dart';
import 'package:flutter_idop/procedure.dart';
import 'package:flutter_idop/program.dart';
import 'package:flutter_idop/schedule.dart';
import 'package:flutter_idop/eligibility.dart';
import 'package:flutter_idop/aboutUs.dart';
import 'package:flutter_idop/contactUs.dart';
import 'package:flutter_idop/faq.dart';
import 'package:flutter_idop/tagging.dart';
import 'package:flutter_idop/media.dart';

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
      child:
        new Container(
          color: Colors.orange[100],
          child:
      ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset(
              'images/logo.png',
              fit: BoxFit.fitWidth,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text('Training'),
          ),
          buildMenu('Program Details', 'program'),
          buildMenu('Schedules', 'schedule'),
          buildMenu('Procedure', 'procedure'),
          buildMenu('Chanting Script & Audio', 'chanting'),
          buildMenu('Eligibility', 'eligibility'),
//          new Divider(),
//          ListTile(
//            title: Text('Online Application'),
//            onTap: () => _navigateTo('application'),
//          ),
          new Divider(),
          ListTile(
            title: Text('About Us'),
            onTap: () => _navigateTo('about'),
          ),
          buildMenu('Contact Us', 'contact'),
          buildMenu('About Us', 'about'),
          buildMenu('Media', 'media'),
          buildMenu('FAQ', 'faq'),

        ],
      ),
        )
    );
  }

  void _navigateTo(String title) {
    //close the drawer
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        Tagging tagging = new Tagging();
        tagging.sendEvent('view_' + title);
        switch (title) {
          case 'program':
            return Program();
            break;
          case 'schedule':
            return Schedule();
            break;
          case 'procedure':
            return Procedure();
            break;
          case 'chanting':
            return Chanting();
            break;
          case 'eligibility':
            return Eligibility();
            break;
          case 'application':
            return Application();
            break;
          case 'about':
            return AboutUs();
            break;
          case 'contact':
            return ContactUs();
            break;
          case 'media':
            return Media();
            break;
          case 'faq':
            return FAQ();
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
