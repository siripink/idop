import 'package:flutter/material.dart';
import 'package:flutter_idop/utils.dart';

class Program extends StatefulWidget {
  @override
  _ProgramState createState() => _ProgramState();
}

class _ProgramState extends State<Program> {

  Widget appBarTitle = Container(
      margin: const EdgeInsets.only(left: 8.0),
      child: Text('Program'));

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        children: <Widget>[
          Utils.buildTitle('General Overview of the Training Program'),
          Utils.buildTitle('''
Phase	  Training Details'''),
          Utils.buildDescription(context,
              '''
 1.  Orientation, Medical and Outward Bounds Training
 2.  Meditation and Training in Basic Virtue
 3.  Meditation and Rehearsal for Ordination
 4.  Ordination Ceremony
 5.  Study of Monastic Discipline and Training and the Meditation Retreat
 6.  Meditation Retreat
 7.  Application of Dhamma Principles for Everyday Life and Course Debriefing'''),
          Utils.buildTitle('Duties'),
    Utils.buildDescription(context,
    '''
The main purpose of ordaining is to free yourself from worldly commitments and worries so that you may have the opportunity to fully commit yourself to meditation and break away from the shackles of desire so that you may find true happiness.

Monks manage to free themselves from worldly desire by fulfilling the daily routine required of them by the tenets laid down by the Lord Buddha. In this case, the word 'duty' (kicavatra) is a compound made up of two words: 'kica' and 'vatra'.

'Kica' means duties that are so important that they are considered compulsory. 'Vatra' means things that are advisable do, although not required. If you choose not do these latter, the consequences may not be disastrous – they do not break the monastic discipline – but they could result in the lessening of respect by those who support the monks out of faith. However, if you comply with these activities, the level of respect accorded on you will only improve and strengthen. These items of daily routine will also help to free you from worldly desire.'''),
          Utils.buildTitle('The recommended daily routine is as follows:'),
          Utils.buildDescription(context,
              '''
 1. Going on almsround
 2. Sweeping the temple
 3. Confession
 4. Chanting and Meditation
 5. Reflection
 6. Caring for Your Preceptor
 7. Management, Maintenance, Exercise
 8. Studying the Dhamma and Monastic discipline
 9. Caring for Temple Property and Responsibility
10. Behaviors Worthy of Respect'''),
           new Divider(),
        ],
      ),
    );
  }
}
