import 'package:flutter/material.dart';
import 'package:flutter_idop/utils.dart';

class Chanting extends StatefulWidget {
  @override
  _ChantingState createState() => _ChantingState();
}

class _ChantingState extends State<Chanting> {
  Widget appBarTitle = Container(
      margin: const EdgeInsets.only(left: 8.0),
      child: Text('Chanting'));

  Widget buildCard(String assets, String title, String details) {
    return new SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        padding: const EdgeInsets.all(24.0),
        height: 370.0,
        child: new Card(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // photo and title
              new SizedBox(
                height: 160.0,
                child: new Stack(
                  children: <Widget>[
                    new Positioned.fill(
                      child: new Image.asset(
                        assets,
                        fit: BoxFit.cover,
                      ),
                    ),

                  ],
                ),
              ),
              // description and share/explore buttons
              buildCardDescription(title, details),
              // share, explore buttons
              buildButtonBar('script1'),
            ],
          ),
        ),
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
                style: descriptionStyle,
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
              /* do nothing */
            },
          ),
        ],
      ),
    );
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
          Utils.buildheadTitle('Chanting during circumambulation of the temple'),
          Utils.buildDescription(context,
              'After the third circumambulation, ordinands should enter the ordination ground in the single row. To paying homage to the ordination ground. The pure and holy boundary where Sangha attend Sanghakamma. Buddha image, which represent the Lord Buddha, was placed here.'),
          buildCard(
              'images/1_Paying_Homage_to_the_ordination_ground_and_chapel2.jpg',
              'Paying Homage',
              'Paying Homage to Principle (main) Buddha image is to pay a highest respect to the Buddha image which represents the Lord of Buddha.'),
        ],
      ),
    );
  }
}
