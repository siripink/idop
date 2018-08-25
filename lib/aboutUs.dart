import 'package:flutter/material.dart';
import 'package:flutter_idop/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  Widget appBarTitle = Container(
      margin: const EdgeInsets.only(left: 8.0),
      child: Text('About Us'));

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        children: <Widget>[
          new Image.asset(
            'images/about_us.jpg',
            width: 600.0,
            height: 200.0,
            fit: BoxFit.cover,
          ),

          Utils.buildDescription(context,
              '''
The Buddhist Monk Ordination Program was first organized in 2005. The training was initiated by Luang Phaw Dhammajayo, The president of Dhammakaya Foundation ( A UN’s NGO and member of The World Fellowship of Buddhist ), with the objective of promoting ethics and morality among youths, in addition to their academic education. Education alone cannot adequately cultivate ethics and morality in a person.

A wise person who is highly educated may use knowledge and skills in the wrong way. For example, the use of advanced physics in the production of nuclear bombs during World War II has inflicted a permanent wound in mankind.

Hence the cultivation of a consciousness of goodness in students is extremely crucial, so that the wise person will combine both education and morality, and in turn, bring the benefits of both, thereby using knowledge in a creative and beneficial manner, which is another path to world peace.

– Buddhist monk ordination program'''),
          Utils.buildTitle('Related sites'),
          new Column(
            children: <Widget>[
              new FlatButton(
                child: Image.asset(
                  'images/dhammakaya.png',
                  width: 80.0,
                  fit: BoxFit.cover,
                ),
                textColor: Colors.amber.shade500,
                onPressed: () {
                  launch('http://www.dhammakaya.net/', forceSafariVC: false);
                },
              ),
              new Text ('Dhammakaya Foundation'),
            ],
          ),

           new Divider(),
        ],
      ),
    );
  }
}
