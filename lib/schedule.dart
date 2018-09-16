import 'package:flutter/material.dart';
import 'package:flutter_idop/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

  Widget buildEvent(DocumentSnapshot document) {
    for (var i = 0; i < 3; i++) {
      return Row (
          children: [
            Text('Language'),
            Text(document['language'])
          ]
      );
    }
  }

  Widget buildSchedule(List<DocumentSnapshot> document) {
    //var documentSize = document.data.length;
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: buildScheduleDetail()
//          [
//            Text(document['title'],
//                style: TextStyle(fontWeight: FontWeight.w500,
//                  fontSize: 15.0,)
//            ),
//            Divider(),
//            ListTile(
//              title: new Text('Training Period'),
//              subtitle: new Text(document['period']),
//            ),
//            ListTile(
//              title: new Text('Language'),
//              subtitle: new Text(document['language']),
//            ),
//
//            //buildEvent(document)
//
//          ]
      ),
    );
  }

  List<Widget> buildScheduleDetail() {
      List<Widget> list = new List();
      list.add(new ListTile(
        title: new Text('Training Period'),
        subtitle: new Text('period'),
      ));
      list.add(new ListTile(
        title: new Text('Training Period'),
        subtitle: new Text('period'),
      ));
      return list;
  }
  @override
  Widget build(BuildContext context) {


    Widget buildCurrentSchedule = new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Schedules').where('active', isEqualTo: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData)
          return new Text('Loading...');
        else {
          return new Container(
              child: buildSchedule(snapshot.data.documents)
          );
        }
      }
    );


    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
      ),
      body:
      ListView(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        children: <Widget>[
          Utils.buildTitle('Daily Schedule'),
          Utils.buildDescription(context,
              '''
04.30             Wake Up

05.00             Morning Chanting, Meditation Session, 
                      and Spreading Loving Kindness

06.30             Community Services

07.10             Breakfast

09.15             Meditation Session and Dhamma Talk

11.00             Lunch

12.30             Personal Time

14.00             Meditation Session and Dhamma Talk

16.15             Exercise

17.00             Refreshments

18.30             Evening Chanting

19.00             Meditation Session and Dhamma Talk

21.00             Personal Time

21.30             Sleep in Peace
'''),

          new Divider(),
          buildCurrentSchedule,
        ],
      ),
    );
  }
}
