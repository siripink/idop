import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

  Widget appBarTitle = Container(
      margin: const EdgeInsets.only(left: 8.0),
      child: Text('Application'));

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
      ),
      body: Center(
        child: Text('Coming Soon'),
      ),
    );
  }
}