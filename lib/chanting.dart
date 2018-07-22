import 'package:flutter/material.dart';

class Chanting extends StatefulWidget {
  @override
  _ChantingState createState() => _ChantingState();
}

class _ChantingState extends State<Chanting> {

  Widget appBarTitle = Container(
    child: Row(
      children: [
        Image.asset(
          'images/logo_icon.png',
          width: 30.0,
          height: 30.0,
          fit: BoxFit.cover,
        ),
        Container(
            margin: const EdgeInsets.only(left: 8.0), child: Text('Chanting')),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
      ),
      body: Center(
        child: Text('test Chanting'),
      ),
    );
  }
}