import 'package:cloud_firestore/cloud_firestore.dart';
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

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return new ListTile(
      key: new ValueKey(document.documentID),
      title: new Container(
        decoration: new BoxDecoration(
          border: new Border.all(color: const Color(0x80000000)),
          borderRadius: new BorderRadius.circular(5.0),
        ),
        padding: const EdgeInsets.all(10.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Text(document['name']),
            ),
            new Text(
              document['period'],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgram(DocumentSnapshot document) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: ListTile(
        title: Text(document['name'],
            style: TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(document['period']),
        leading: Icon(
          Icons.calendar_today,
          color: Colors.deepOrangeAccent,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: appBarTitle,
        ),
        body: new Column(
          children: <Widget>[
            Text('Test Loading...'),
            new Container(
              height: 300.0,
              child: new StreamBuilder(
                  stream: Firestore.instance.collection('Programs').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const Text('Loading...');
                    return new ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      padding: const EdgeInsets.only(top: 10.0),
                      itemExtent: 55.0,
                      itemBuilder: (context, index) =>
                          _buildProgram(snapshot.data.documents[index]),
                    );
                  }),
            )
          ],
        ));
  }
}
