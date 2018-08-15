import 'package:flutter/material.dart';
import 'package:flutter_idop/utils.dart';

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
        padding: const EdgeInsets.only(left: 18.0, right: 16.0, bottom: 12.0),
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
      case 'script3':
        return script3();
      case 'script4':
        return script4();
      case 'script5':
        return script5();
      case 'script6':
        return script6();
      case 'script7':
        return script7();
      case 'script8':
        return script8();
      case 'script9':
        return script9();
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
            fontWeight: FontWeight.w600,
          ),
        );
  }

  Text buildSubMainText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.grey[600],
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

  RichText buildMixStyle() {
    return new RichText(
        text: new TextSpan(
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey[600],
            ),
            children: <TextSpan>[
              new TextSpan(text: 'The ordinand responds: '),
              new TextSpan(text: '\'Amaphante\'',
                  style: new TextStyle(fontWeight: FontWeight.bold))
            ]
        ));
  }

  Container buildRowTwoColumn(String leftText, String rightText) {
    return new Container(
      child: new Row(
        //align text on (vertical) top
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: buildSubMainText(leftText),
          ),
          Expanded(
            child: buildMainText(rightText),
          )
        ],
      )
    );
  }

  List<Widget> script1() {
    return <Widget>[
      Utils.buildTitle('1. Paying Homage to the Ordination Ground and Chapel'),
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
      Utils.buildTitle('2. Seeking Parent\'s Forgiveness before Ordination'),
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

  List<Widget> script3() {
    return <Widget>[
      Utils.buildTitle('3. Requesting the Going-Forth (paphacha)'),
      PlayerWidget(
          url: '3.Requesting_the_going-forth(pabbajja).mp3',
          isLocal: true),
      buildMainText('''
Ukasa vanthami phante,
Sapphang aparathang khamatha me phante, Maya katang punyang samina anumothitaphang, Samina katang punyang maihang thatpphang, Sathu sathu anumothami,
Ukasa ka-run-yang kattava,
Papphatchang thethame phante.'''),
    buildInBetweenText('————— kneel down ————'),
      buildMainText('''
Ahang phante, papphatchang yajami.
Thutiyampi ahang phante, papphatchang yajami. Tatiyampi ahang phante, papphatchang yajami.

 ( Sapphathukkha nissarana, 
   Nipphana satchi karanat tha ya, 
   Imang kasavang khahettava, 
   Pappha chetha mang phante, 
   Anukampang upathaya.)'''),
      buildInBetweenText('————— repeat this verse 3 times ————'),
      buildMainText('''
 ( Sappatukkha nissaranah, 
   Nippana sacchi-karanat-tha-yah, 
   Etang kasavang tattava,
   Pappha chetha mang phante,
   Anukampang upathaya.)'''),
      buildInBetweenText('————— repeat this verse 3 times ————'),
      buildInBetweenText('————— bow 3 times ————'),
    ];
  }

  List<Widget> script4() {
    return <Widget>[
      Utils.buildTitle('4. Basic Objects of Meditation (mulakamatthana)'),
      PlayerWidget(
          url: '4.Basic_objects_of_meditaton.mp3',
          isLocal: true),
      buildMainText('''
          Kesa loma nakha thanta tajo, 
          Tajo thanta nakha loma kesah.'''),
      buildInBetweenText('—————————'),
    ];
  }

  List<Widget> script5() {
    return <Widget>[
      Utils.buildTitle('5. Taking Refuge and Ten Precepts'),
      PlayerWidget(
          url: '5.Taking_refuge_and_ten_precepts.mp3',
          isLocal: true),
      buildMainText('''
Ahang phante, sarana silang yajami. Thutiyampi ahang phante, sarana silang yajami. Tatiyampi ahang phante, sarana silang yajami.
'''),
      buildSubMainText('''
After this request, the preceptor will give the Refuges and Precepts, starting with homage to the Triple Gem which the ordinand will repeat after him.
 '''),
      buildMainText('''   
Namo tassa phakhavato arahato sammasamputthassa.'''),
      buildInBetweenText('————— repeat this verse 3 times ————'),
    buildSubMainText('''
The preceptor says: Yamahamg vatami tang vatehi. 
'''),
      buildMixStyle(),

    buildSubMainText('''

The preceptor then gives the Refuges and Precepts, and the ordinand repeats after him, verse by verse:
'''),
    buildMainText('''
    1) Phutthang saranang khatchami, Thammang saranang khatchami, Sangkhang saranang khatchami,
    
    2) Thutiyampi phutthang saranang khatchami, Thutiyampi thammang saranang khatchami, Thutiyampi sangkhang saranang khatchami,
    
    3) Tatiyampi phutthang saranang khatchami, Tatiyampi thammang saranang khatchami, Tatiyampi sangkhang saranang khatchami.
    '''),

    buildSubMainText('''
 The preceptor says 'Tisaranakhamanang nitthitang.'
 '''),
      buildMixStyle(),
    buildSubMainText('''
 
 Now, ordinands become ‘Novices’. They need to keep Ten Precepts. So novices will chant the Ten Precepts after the preceptor, verse by verse, as follows:
 '''),
    buildMainText('''
    1. Panatipata veramani, sikkhapathang samathiyami.
    2. Athinnathana veramani, sikkhapathang samathiyami.
    3. Aphramajariya veramani, sikkhapathang samathiyami.
    4. Musavatha veramani, sikkhapathang samathiyami.
    5. Surameraya matcha pamathatthana veramani, sikkhapathang samathiyami.
    6. Vikalaphochana veramani, sikkhapathang samathiyami.
    7. Natja khita vathita visukathassana veramani, sikkhapathang samathiyami.
    8. Mala khantha vilepana tharana mandana viphusanatthana veramani, sikkhapathang samathiyami.
    9. Utjasayana mahasayana veramani, sikkhapathang samathiyami.
    10. Chatarupa rachata patikkhahana veramani, sikkhapathang samathiyami.
    '''),
    buildSubMainText('''
Then, the preceptor will say:'''),
    buildMainText('''
 Imani thasa sikkhapathani samathiyami'''),
    buildInBetweenText('—— repeat this verse 3 times , then bow 3 times —'),
    ];
  }

  List<Widget> script6() {
    return <Widget>[
      Utils.buildTitle('6. Requesting Dependence (nissaya)'),
      PlayerWidget(
          url: '6.Requesting_dependence(nissaya).mp3',
          isLocal: true),
      buildMainText('''
Ahang phante, nissayang yajami. Thutiyampi ahang phante, nissayang yajami. Tatiyampi ahang phante, nissayang yajami.

    ( Upatchayo me phante hohi ) '''),
    buildInBetweenText('————— 3 times ————'),
      buildRowTwoColumn('Preceptor chants','Novice responds'),
      buildRowTwoColumn('Patirupang','Sathu phante'),
      buildRowTwoColumn('Opayikang','Sathu phante'),
      buildRowTwoColumn('Pasathikena sampathetha','Sathu phante'),

    buildSubMainText('''
    
The novice chants the following: '''),
      buildMainText('''
      
( Atchatakkhethani thero, maihang pharo, ahampi therassa pharo.)'''),
      buildInBetweenText('————— 3 times ————'),
      buildInBetweenText('————— bow 3 times ————'),
    ];
  }

  List<Widget> script7() {
    return <Widget>[
      Utils.buildTitle('7. Scrutiny of the Bowl and Robes'),
      PlayerWidget(
          url: '7.Scrutiny_of_the_bowl_and_robes.mp3',
          isLocal: true),
      buildRowTwoColumn('Preceptor chants','Novice responds'),
      buildRowTwoColumn('Ayante patto','Ama phante'),
      buildRowTwoColumn('Ayang sankhati','Ama phante'),
      buildRowTwoColumn('Ayang uttarasangkho','Ama phante'),
      buildRowTwoColumn('Ayang antaravasako','Ama phante'),

      buildSubMainText('''

The Preceptor will then put the strap of bowl over the head of the novice and requests him to retire to a point outside the assembly .'''),
      buildInBetweenText('—————————'),
    ];
  }

  List<Widget> script8() {
    return <Widget>[
      Utils.buildTitle('8. Examination Outside the Sangha'),
      PlayerWidget(
          url: '8.Examination_outside_the_Sangha.mp3',
          isLocal: true),
      buildRowTwoColumn('Question','Novice responds'),
      buildRowTwoColumn('Kutthang?','Natthi phante'),
      buildRowTwoColumn('Khantho?','Natthi phante'),
      buildRowTwoColumn('Kilaso?','Natthi phante'),
      buildRowTwoColumn('Soso?','Natthi phante'),
      buildRowTwoColumn('Apamaro?','Natthi phante'),
      buildRowTwoColumn('Manusosi?','Ama phante'),
      buildRowTwoColumn('Purisosi?','Ama phante'),
      buildRowTwoColumn('Phuchisosi?','Ama phante'),
      buildRowTwoColumn('Ananosi?','Ama phante'),
      buildRowTwoColumn('Nasirachaphato?','Ama phante'),
      buildRowTwoColumn('Anunyatosi matapituhi?','Ama phante'),
      buildRowTwoColumn('Paripunnavisativasosi?','Ama phante'),
      buildRowTwoColumn('Paripunnante pattajivarang?','Ama phante'),
      buildRowTwoColumn('Kinnamosi?','Ahang phante (1) nama'),
      buildRowTwoColumn('Ko nama te upatchayo?','Upatchayo me phante ayasama Suratecho nama'),

      buildInBetweenText('(1) substitute the monk’s Pali name'),
    ];
  }

  List<Widget> script9() {
    return <Widget>[
      Utils.buildTitle('9. Requesting Ordination (upasampada)'),
      PlayerWidget(
          url: '9.Requesting_ordination(Upassampada).mp3',
          isLocal: true),
      buildMainText('''
    Sangkham phante,
    Upasampathang yajami, 
    Ulumpatu mang phante sangkho, 
    Anukampang upathaya.
    Thutiyampi phante sangkang, 
    Upasampathang yajami, 
    Ulumpatu mang phante sangkho, 
    Anukampang upathaya.
    Tatiyampi phante sangkhang, 
    Upasampathang yajami, 
    Ulumpatu mang phante sangkho, 
    Anukampang upathaya.'''),
      buildInBetweenText('————— bow 3 times ————'),
    ];
  }
}
