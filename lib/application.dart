import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Application'),
      ),
      body: Center(
        child: Text('Coming Soon'),
      ),
    );
  }
}