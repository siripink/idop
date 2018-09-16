import 'package:flutter/material.dart';
import 'package:flutter_idop/utils.dart';

class Program extends StatefulWidget {
  @override
  _ProgramState createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Program Details'),
      ),
      body:
      ListView(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        children: <Widget>[
          Utils.buildTitle('Overview of the Training Program'),
          Utils.buildTitle('''
Training Details'''),
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
          Utils.buildTitle('The Recommended Daily Routine'),
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
        Utils.buildTitle('Eligibility'),
    Utils.buildDescription(context,
    '''
  1. Gentlemen who can speak English, Chinese or Japanese well & are between the ages of 18-60.
  
  2. Good character and ready to conform strictly to the rules set the training supervisors.
  
  3. Healthy, free from infectious diseases or illnesses such as diabetes, mental illness, epilepsy, asthma, kidney disease or drug dependence.
  
  4. Free of commitments which might interrupt the course of training.
  
  5. Content with a non-vegetarian diet and whatever accommodation is provided by the training supervisors.
  
  6. Have a visa valid for at least 60 days stay in Thailand.'''),
      new Divider(),
      Utils.buildTitle('Application Requirements'),
      Utils.buildDescription(context,
    '''
  1. Two recent 2" passport-style photographs.
  
  2. Photocopies of identification documents and passport
  
  3. Written permission from applicant’s parents or guardian.
  
  4. Medical examination record with physician’s statement of guarantee.
  
  5. Application fee.
  '''),
          new Divider(),
        ],
      ),
    );
  }
}
