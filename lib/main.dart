import 'package:carousel/carousel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_idop/navigation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IDOP',
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: const Color(0xFFff5722),
        accentColor: const Color(0xFFff5722),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildProgram(DocumentSnapshot document) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: ListTile(
        title: Text(document['name'],
            style: TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(document['period']),
        leading: Icon(
          Icons.calendar_today,
          color: Colors.deepOrangeAccent,
        ),
      ),
    );
  }

  void _showExplanatoryText() {
    print("pressed ");
  }

  Widget buildFloatingActionButton() {
    return new FloatingActionButton(
      key: new ValueKey<Color>(Colors.red),
      tooltip: 'Apply',
      backgroundColor: Colors.blueGrey,
      child: Text(
        'APPLY',
        style: TextStyle(
          fontSize: 12.0,
        ),
      ),
      onPressed: _showExplanatoryText,
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.only(
          top: 24.0, left: 32.0, right: 32.0, bottom: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'International Dhammadayada Ordination Program',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Patumthani, Thailand',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget appBarTitle = Container(
      child: Row(
        children: [
          Image.asset(
            'images/logo_icon.png',
            width: 30.0,
            height: 30.0,
            fit: BoxFit.cover,
          ),
          Container(
              margin: const EdgeInsets.only(left: 8.0), child: Text('IDOP')),
        ],
      ),
    );

    Widget bannerCarousel = new Container(
      child: new Carousel(
        children: [
          new AssetImage('images/banners/banner1.jpg'),
          new AssetImage('images/banners/banner2.jpg'),
          new AssetImage('images/banners/banner3.jpg'),
          new AssetImage('images/banners/banner4.jpg'),
        ]
            .map((bgImg) => new Image(
                image: bgImg, width: 600.0, height: 300.0, fit: BoxFit.cover))
            .toList(),
        displayDuration: const Duration(seconds: 3),
      ),
    );

    Widget descriptionSection = Container(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 18.0),
      child: Text(
        '''
Once in life time, having ordination to be Buddhist monk with IDOP Program. You will learn more how to find your real happiness for your life as well as how to help buildup permanent peace for the world.        ''',
        softWrap: true,
      ),
    );

    Widget bannerImages = new SizedBox(
      width: 600.0,
      height: 200.0,
      child: new Stack(children: <Widget>[
        new PageView(
          children: [bannerCarousel],
        ),
      ]),
    );

    Widget currentProgram = new Container(
      height: 200.0,
      child: new StreamBuilder(
          stream: Firestore.instance
              .collection('Programs')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return const Text('Loading...');
            return new ListView.builder(
              physics: ClampingScrollPhysics(),
              //Hide Overscoll Effect on the nested listview
              itemCount: snapshot.data.documents.length,
              padding: const EdgeInsets.only(top: 10.0),
              itemExtent: 55.0,
              itemBuilder: (context, index) =>
                  _buildProgram(snapshot.data.documents[index]),
            );
          }),
    );

    return new Scaffold(
        appBar: AppBar(
          title: appBarTitle,
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                new Column(
                  children: <Widget>[
                    bannerImages,
                    titleSection,
                    descriptionSection,
                    currentProgram
                  ],
                ),
              ]),
            )
          ],
        ),
        floatingActionButton: buildFloatingActionButton(),
        drawer: Navigation());
  }
}
