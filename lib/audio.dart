import 'package:flutter/material.dart';

import 'player_widget.dart';

class Audio extends StatefulWidget {
  final String script;

  Audio({Key key, @required this.script}) : super(key: key);

  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  Widget appBarTitle = Container(
      margin: const EdgeInsets.only(left: 8.0),
      child: Text('Ordination Chanting (Ukasa style)'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
      ),
      body: ListView(
        padding: const EdgeInsets.only(
            top: 18.0, left: 18.0, right: 16.0, bottom: 12.0),
        children: buildScript(),
      ),
    );
  }

  List<Widget> buildScript() {
    switch (widget.script) {
      case 'script1':
        return script1();
      case 'script2':
        return script2();
      default:
        return script1();
    }
  }

  Text buildMainText(String text) {
    return Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey[600],
            fontWeight: FontWeight.bold,
          ),
        );
  }

  Container buildInBetweenText(String text) {
    return new Container(
          padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
          child: new Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
          ),
        );
  }

  List<Widget> script1() {
    return <Widget>[
      Text(
        '1. Paying Homage to the Ordination Ground and Chapel',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      PlayerWidget(
          url: '1_Paying_Homage_to_the_ordination_ground_and_chapel.mp3',
          isLocal: true),
      buildMainText('''
Ukasa vanthami phante,
Sapphang aparathang khamatha me phante, Maya katang punyang samina anumothitaphang Samina katang punyang maihang thatapphang, 
Sathu sathu anumothami.'''),
      buildInBetweenText('———— kneel down —————'),
      buildMainText('Sapphang aparathang khamatha me phante.'),
      buildInBetweenText('———— bow once —————'),
      buildMainText('''
Ukasa thavarattayena katang,
Sapphang aparathang khamatha me phante.'''),
      buildInBetweenText('———— bow once, then stand —————'),
      buildMainText('''
Vanthami phante,
Sapphang aparathang khamatha me phante, Maya katang punyang samina anumothitaphang Samina katang punyang maihang thatapphang,
Sathu sathu anumothami'''),
      buildInBetweenText('———— kneel down and bow 3 times —————'),
    ];
  }

  List<Widget> script2() {
    return <Widget>[
      Text(
        '2. Seeking Parent\'s Forgiveness before Ordination',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      PlayerWidget(
          url: '2.Seeking_parents_forgiveness.mp3',
          isLocal: true),
      buildMainText('''
Ukasa, all of us assembled here on this day, bowing in farewell to mother and father, brothers and sisters, and all amongst the Buddhist congregation here, so that we may take ordination; 

Throughout immeasurable life that we have been born and reborn in this cycle of existence, if we have offense against any of you with or without your knowledge, intentionally or without intention, that we can recall or that is without recall throughout uncountable lifetimes or in this present lifetime: 

May all assembled here, forgive us our trespasses, that we may be pure in ordination and unblemished in our Holy life, and in our pursuit of Nirvana in this lifetime.'''),
      buildInBetweenText('—————————'),
    ];
  }
}
