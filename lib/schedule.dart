import 'package:flutter/material.dart';
import 'utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'navigation.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

  List<Widget> buildScheduleDetail(List<DocumentSnapshot> documents) {
      List<Widget> list = new List();
      for (var document in documents) {
        list.add(Utils.buildTitle('${document.data()['title']}\nLanguage: ${document.data()['language']}'));
        list.add(new Container(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: new Text(document.data()['period']))
          );
        var eventSize = document.data().length;
        for (var idx = 1; idx < eventSize; idx++) {
          if (!document.data().containsKey('schedule$idx'))
            break;
            list.add(
                Container(
                    padding: const EdgeInsets.only(bottom: 16.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                      width: 115.0,
                    padding: const EdgeInsets.only(left: 5.0, right: 12.0),
                      child: Text(document['schedule$idx']['time'],
                          style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black54)),
                  ),
                  Expanded(
                    child: Text(document['schedule$idx']['event'],
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black54)
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

  Widget buildDescription(String time, String description) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0, left: 8.0),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 80.0,
            child: Text(time,
                style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black54)),
          ),
          Expanded(
            child: Text(description,
              style:  Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black54),
              textAlign: TextAlign.start,),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget buildCurrentSchedule = new StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Schedules').where('active', isEqualTo: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData)
          return new Text('Coming Soon...');
        else {
          return new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buildScheduleDetail(snapshot.data.docs)
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
          buildDescription('04:30', 'Wake Up'),
          buildDescription('05:00', 'Morning Chanting, Meditation, and Spreading Loving Kindness'),
          buildDescription('06:30', 'Community Services'),
          buildDescription('07:10', 'Breakfast'),
          buildDescription('09:15', 'Meditation Session and Dhamma Talk'),
          buildDescription('11:00', 'Lunch'),
          buildDescription('12:30', 'Personal Time'),
          buildDescription('14:00', 'Meditation Session and Dhamma Talk'),
          buildDescription('16:15', 'Exercise'),
          buildDescription('17:00', 'Refreshments'),
          buildDescription('18:30', 'Evening Chanting'),
          buildDescription('19:00', 'Meditation Session and Dhamma Talk'),
          buildDescription('21:00', 'Personal Time'),
          buildDescription('21:30', 'Sleep in Peace'),
          new Divider(),
          buildCurrentSchedule,

        ],
      ),
        drawer: Navigation()
    );
  }
}
