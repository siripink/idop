import 'package:flutter/material.dart';
import 'package:flutter_idop/utils.dart';
import 'package:flutter_idop/audio.dart';

class Chanting extends StatefulWidget {
  @override
  _ChantingState createState() => _ChantingState();
}

class _ChantingState extends State<Chanting> {
  Widget appBarTitle = Container(
      margin: const EdgeInsets.only(left: 8.0),
      child: Text('Chanting'));

  Widget buildCard(double height, String scriptIndex, String asset, String title, String details) {
    return new SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
        height: height,
        child: new Card(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildCardImage(asset),
              // description and share/explore buttons
              buildCardDescription(title, details),
              // share, explore buttons
              buildButtonBar(scriptIndex),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardImage(String asset) {
    return new SizedBox(
      height: 150.0,
      child: new Stack(
        children: <Widget>[
          new Positioned.fill(
            child: new Image.asset(
              asset,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCardDescription(String title, String details) {
    final ThemeData theme = Theme.of(context);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    return new Expanded(
      child: new Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0),
        child: new DefaultTextStyle(
          softWrap: true,
          style: descriptionStyle,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // three line description
              new Text(
                title,
                style: descriptionStyle.copyWith(fontSize: 15.0),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: new Text(
                  details,
                  textAlign: TextAlign.justify,
                  style: descriptionStyle.copyWith(
                      color: Colors.black54,
                      fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtonBar(String action) {
    return new ButtonTheme.bar(
      child: new ButtonBar(
        alignment: MainAxisAlignment.start,
        children: <Widget>[
          new FlatButton(
            child: const Text('SCRIPT & AUDIO'),
            textColor: Colors.amber.shade500,
            onPressed: () {
              _navigateTo(action);
            },
          ),
        ],
      ),
    );
  }

  void _navigateTo(String title) {
    //close the drawer
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (context) => Audio(script: title),
//      builder: (BuildContext context) {
//        switch (title) {
//          case 'script1':
//            return Audio();
//            break;
//
//        }
//      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
      ),
      body: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Utils.buildTitle('Chanting during circumambulation of the temple'),
          Utils.buildDescription(context,
              'After the third circumambulation, ordinands should enter the ordination ground in the single row. To paying homage to the ordination ground. The pure and holy boundary where Sangha attend Sanghakamma. Buddha image, which represent the Lord Buddha, was placed here.'),
          buildCard(
            360.0,
              'script1',
              'images/1_Paying_Homage_to_the_ordination_ground_and_chapel2.jpg',
              '1. Paying Homage to the ordination ground and chapel',
              'Paying Homage to Principle (main) Buddha image is to pay a highest respect to the Buddha image which represents the Lord of Buddha.'),
          buildCard(
            430.0,
              'script2',
              'images/2.Seeking_parents_forgiveness.jpg',
              '2. Seeking parents forgiveness',
              'This is the procedure of paying respect to and seeking forgiveness from their guardian or parents in the trespassing that ordinands have done against them. Therefore, the ordinands will become pure in the ordination and unblemished in the Brabmafaring in their pursuit of Nibbanain in this lifetime. Next step the ordinands will accepted the Triple Robes from their guardians.'),

        ],
      ),
    );
  }
}
