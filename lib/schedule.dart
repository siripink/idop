import 'package:flutter/material.dart';
import 'package:flutter_idop/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

  List<Widget> buildScheduleDetail(List<DocumentSnapshot> documents) {
      List<Widget> list = new List();
      for (var document in documents) {
        list.add(Utils.buildTitle('${document['title']}\nLanguage: ${document['language']}'));
        list.add(new Container(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: new Text(document['period']))
          );
        var eventSize = document.data.length;
        for (var idx = 1; idx < eventSize; idx++) {
          if (!document.data.containsKey('schedule${idx}'))
            break;
            list.add(
                Container(
                    padding: const EdgeInsets.only(bottom: 16.0),
              child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                      width: 115.0,
                    padding: const EdgeInsets.only(right: 12.0),
                      child: Text(document['schedule${idx}']['time'],
                          style: Theme.of(context).textTheme.body1.copyWith(color: Colors.black54)),
                  ),
                  Expanded(
                    child: Text(document['schedule${idx}']['event'],
                    style: Theme.of(context).textTheme.body1.copyWith(color: Colors.black54)
                    ),
                  )
                  ],
              )
            )
            );
        }
        list.add(new Divider());
      }

      return list;
  }

  @override
  Widget build(BuildContext context) {

    Widget buildCurrentSchedule = new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Schedules').where('active', isEqualTo: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData)
          return new Text('Coming Soon...');
        else {
          return new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buildScheduleDetail(snapshot.data.documents)
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

05.00             Morning Chanting, Meditation, 
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
