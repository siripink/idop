import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_idop/utils.dart';
import 'package:flutter_idop/chanting.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_idop/tagging.dart';

class Eligibility extends StatefulWidget {
  @override
  _EligibilityState createState() => _EligibilityState();
}

class _LinkTextSpan extends TextSpan {
  _LinkTextSpan({String url, String text, String tag}) : super(
    style: new TextStyle(color: Colors.deepOrange),
    text: text ?? url,
    recognizer: new TapGestureRecognizer()..onTap = () {
      launch(url, forceSafariVC: false);
      Tagging tagging = new Tagging();
      tagging.sendEvent('download_' + tag);
    }
  );
}

class _LinkInAppTextSpan extends TextSpan {
  _LinkInAppTextSpan({BuildContext context, String url, String text}) : super(
      style: new TextStyle(color: Colors.deepOrange),
      text: text ?? url,
      recognizer: new TapGestureRecognizer()..onTap = () {
        _navigateTo(context);
      }
  );

  static void _navigateTo(BuildContext context) {
    //close the drawer
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Chanting();
      },
    ));
  }
}

class _EligibilityState extends State<Eligibility> {
  
  Widget buildBullet(String text) {
  return new ListTile(
    title: Text(
      text,
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.body1.copyWith(color: Colors.black54),
      softWrap: true,
    ),
    leading: new Icon(
      Icons.stop,
      size: 10.0,
      color: Colors.deepOrangeAccent,
    ),
  );
  }

  Widget buildBulletMixBold() {
    return new ListTile(
      title: new RichText(
        textAlign: TextAlign.justify,
          text: new TextSpan(
              style: Theme.of(context).textTheme.body1.copyWith(color: Colors.black54),
              children: <TextSpan>[
                new TextSpan(text: 'Willing to strictly follow IDOP instructions and observe the Buddhist Eight Precepts as part of the training experience.',
                ),
                new TextSpan(text: ' The Eight Precepts ',
                    style: new TextStyle(fontWeight: FontWeight.bold)),
                new TextSpan(text: 'involve abstaining from taking the life of any creature; stealing; unchastely; speaking falsely or abusively or maliciously; consuming alcohol or intoxicants; taking food after midday; dancing, singing romantic songs, perfume and cosmetics; and sleeping on luxurious high seats or beds.',
                ),
              ]
          )),
      leading: new Icon(
        Icons.stop,
        size: 10.0,
        color: Colors.deepOrangeAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Eligibility'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        children: <Widget>[
          Utils.buildTitle('Eligibility'),
          new RichText(
              textAlign: TextAlign.justify,
              text: new TextSpan(
                  style: Theme.of(context).textTheme.body1.copyWith(color: Colors.black54),
                  children: <TextSpan>[
                    new TextSpan(text: '''

The International Dhammadayada Training & Ordination Program is designed to help participants achieve personal success during four weeks of training. Please see our web page called ''',
                     ),
                    new _LinkTextSpan(text: '"Monastic Code for Ordination" (pdf)',
                        url: 'https://ordinationthai.org/wp-content/uploads/2015/05/Vinaya-for-Ordination.pdf',
                        tag: 'monastic_code_pdf'),
                    new TextSpan(text: ' regarding a complete list of restrictions for ordination. We require all applicants to be:',
                    ),
                  ]
              )),
          buildBullet('Male, heterosexual, between the ages of 18 and 60'),
          buildBullet('Of good mental and physical health, free from infectious diseases, drug or alcohol dependence, facial piercings, inappropriate tattoos, and severe physical handicaps.'),
          buildBullet('Content with non-vegetarian diet and simple accommodation provided by the temple'),
          buildBullet('Free from commitments that might cause interruptions during the program such as examinations and vocational placements'),
          buildBulletMixBold(),
          Utils.buildDescription(context,
              '''
Participants usually learn from personal experiences that observing the Eight Precepts enhances their practice of meditation while helping to create a peaceful and harmonious environment conducive to inner personal development for every participant.

In order to improve the international experience for all IDOP participants, resident Thai men are welcome to apply for admission. However, admission is highly selective and subject to English language requirements. The IDOP administration reserves the right to deny applicants admission to the international ordination program. Please be advised that final acceptance into IDOP is subject to a personal interview at Wat Phra Dhammakaya. In the event an applicant is denied admission to the program, after a personal interview at Wat Dhammakaya, the temple and its affiliates are not liable for financial reimbursement to the applicant.'''),
          Utils.buildTitle('How To Apply'),

          Utils.buildDescription(context,
              '''
1.  Fill in the Online Application Form and submit it to the temple from there.

2.  If the application gets through, you will receive an immediate automatic response.

3.  Once your application is approved and your eligibility is confirmed, you will receive a notification from the temple via email sometime between the middle of June and early July.

4.  After receiving such notification, you will be asked to obtain a medical examination record with a physician’s statement confirming that you are in good health. It should be presented to the temple’s ordination staff upon arrival.

5.  As a successful applicant, you will be asked to provide a written permission/acknowledgement from your parents, guardian, spouse or relative, whichever is applicable in your case. This should be presented upon arrival.
              '''),
          Utils.buildTitle('What you will need to bring'),
      Utils.buildDescription(context, '''
-  Passport and a photocopy of your passport
-  2" photo
-  An amount of registration fee 5,000.00 Baht
-  Personal medication (if any)
-  Personal toiletries'''),
          Utils.buildTitle('How to practice your chanting until the start of the program'),
          new RichText(
              textAlign: TextAlign.justify,
              text: new TextSpan(
                  style: Theme.of(context).textTheme.body1.copyWith(color: Colors.black54),
                  children: <TextSpan>[
                    new TextSpan(text: '''

You can download '''),
                    new _LinkTextSpan(text: '"Ordination Chanting (Ukasa style)" (pdf)',
                        url: 'https://ordinationthai.org/download/ordination-chanting-english/?wpdmdl=736',
                        tag: 'chanting_pdf'),
                    new TextSpan(text: ' to practice the ordination chanting. For practicing the chanting with audio, please visit: '),
                      new _LinkInAppTextSpan(context: context,
                      text: 'the Chanting page'),
                  ]
              )),
          Utils.buildTitle('How to practice your meditation until the start of the program'),
          Utils.buildDescription(context, '''
Here are two meditation sessions by Phra Nicholas Thanissaro you can use to practice your meditation.'''),
          new RichText(
              textAlign: TextAlign.justify,
              text: new TextSpan(
                  style: Theme.of(context).textTheme.body1.copyWith(color: Colors.black54),
                  children: <TextSpan>[
                    new _LinkTextSpan(text: '''

-  Meditation for beginners (The seven bases of the mind) - MP3

''',
                        url: 'https://ordinationthai.org/download/meditation-for-beginners-seven-bases-of-the-mind/?wpdmdl=752',
                        tag: 'seven_bases_mp3'),
                    new _LinkTextSpan(text: '''
-  Dhammakaya meditation for beginners (The center of the body) - MP3''',
                        url: 'https://ordinationthai.org/download/meditation-for-beginners-center/?wpdmdl=750',
                        tag: 'center_mp3'),
                  ]
              )),

          Utils.buildDescription(context, '''
To free yourself from worry, we recommend that you leave at home valuable items such as jewelry, electronic equipment, MP3 or other music players.'''),
          new Divider(),
        ],
      ),
    );
  }
}
