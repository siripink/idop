import 'package:flutter/material.dart';
import 'package:flutter_idop/utils.dart';
import 'package:flutter_idop/audio.dart';

class Chanting extends StatefulWidget {
  @override
  _ChantingState createState() => _ChantingState();
}

class _ChantingState extends State<Chanting> {

  Widget buildCard(double height, String scriptIndex, String asset, String title, String details) {
    return new SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        padding: const EdgeInsets.fromLTRB(18.0, 24.0, 18.0, 0.0),
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
        padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 0.0),
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
    //Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (context) => Audio(script: title),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chanting'),
      ),
      body: ListView(
        // Important: Remove any padding from the ListView.
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        children: <Widget>[
          Utils.buildTitle('Chanting during circumambulation of the temple'),
          Utils.buildDescription(context,
              'After the third circumambulation, ordinands should enter the ordination ground in the single row. To paying homage to the ordination ground. The pure and holy boundary where Sangha attend Sanghakamma. Buddha image, which represent the Lord Buddha, was placed here.'),
          buildCard(
            340.0,
              'script1',
              'images/1_Paying_Homage_to_the_ordination_ground_and_chapel2.jpg',
              '1. Paying Homage to the ordination ground and chapel',
              'Paying Homage to Principle (main) Buddha image is to pay a highest respect to the Buddha image which represents the Lord of Buddha.'),
          buildCard(
            410.0,
              'script2',
              'images/2.Seeking_parents_forgiveness.jpg',
              '2. Seeking parents forgiveness',
              'This is the procedure of paying respect to and seeking forgiveness from their guardian or parents in the trespassing that ordinands have done against them. Therefore, the ordinands will become pure in the ordination and unblemished in the Brabmafaring in their pursuit of Nibbanain in this lifetime. Next step the ordinands will accepted the Triple Robes from their guardians.'),
          buildCard(
              340.0,
              'script3',
              'images/3.Requesting_the_going-forth(pabbajja).jpg',
              '3. Requesting the going-forth(pabbajja)',
              'Pabbjja is the method of applying to be a priest by chanting with the highest respect to the Triple Gem, which are the Lord of Buddha, the Dhamma and the Sangha, to the preceptor.'),
          buildCard(
              410.0,
              'script4',
              'images/4.Basic_objects_of_meditaton.jpg',
              '4. Basic objects of meditation',
              'The preceptor instructs applicants in the Triple Gems, advise them to develop conviction in it as, their refuge and reminds them of the purpose and benefits of ordination. After that he teaches applicants the five basic objects of meditation, (which are Kesa = hair on the head, Loma = hair, Nakha = nail, Danta = teeth and Taco skin, Mulakarnrnatthana or Tacapancakakaininatthana)'),
          buildCard(
              380.0,
              'script5',
              'images/5.Taking_refuge_and_ten_precepts.jpg',
              '5. Taking refuge and ten precepts',
              'Taking Refuge and Ten Precepts is the request for the refuge from Triple Gem and accept Ten Precepts for studying and practice. Ten Precepts are training rules which help us to maintain a proper body action, verbal action and ideal conducts of our mind.'),
          buildCard(
              330.0,
              'script6',
              'images/6.Requesting_dependence(nissaya).jpg',
              '6. Requesting dependence(nissaya)',
              'Requesting Dependence is to request for a dependence, his guidance, his protection, his teaching and his education, from the preceptor.'),
          buildCard(
              360.0,
              'script7',
              'images/7.Scrutiny_of_the_bowl_and_robes.jpg',
              '7. Scrutiny of the bowl and robes',
              'The preceptor will explain the four requisites as follow; Patio (the bowl), Sanghati, Uttarasango(Civara), Aiitaravasago, (the under robe). Novices continue by acknowledging their requisites with the words “Ama bhante”'),
          buildCard(
              390.0,
              'script8',
              'images/8.Examination_outside_the_Sangha.jpg',
              '8. Examination outside the Sangha',
              'The novice is to stand facing the assembled Bhikkus, hands joined in the gesture of anjali one feet from the cloth, to go round this cloth and not to tread on it.(The second and the third novices follow the same procedure.) Now a number of questions will be asked in Pali language, which the Novice should answer'),
          buildCard(
              380.0,
              'script9',
              'images/9.Requesting_ordination(Upassampada).jpg',
              '9. Requesting ordination(Upassampada)',
              'When called, novices will walk around the special cloth and walk toward the platform. Climbing on to the platform with their left knees and walk on their knees, stop between first pair or Sangka. Bow 3 times, and then chant Requesting Ordination (Upasampada).'),
          new Divider(),
        ],
      ),
    );
  }
}
