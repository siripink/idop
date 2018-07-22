import 'package:carousel/carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_idop/navigation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: const Color(0xFFff5722),
        accentColor: const Color(0xFFff5722),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildProgram(String title, String subTitle) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(subTitle),
        leading: Icon(
          Icons.calendar_today,
          color: Colors.deepOrangeAccent,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
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
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CONTACT'),
          buildButtonColumn(Icons.near_me, 'DIRECTION'),
          buildButtonColumn(Icons.share, 'SHARE'),
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

    Widget textSection = Container(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 32.0),
      child: Text(
        '''
Once in life time, having ordination to be Buddhist monk with IDOP Program. You will learn more how to find your real happiness for your life as well as how to help buildup permanent peace for the world.        ''',
        softWrap: true,
      ),
    );

    return new Scaffold(
        appBar: AppBar(
          title: appBarTitle,
        ),
        body: ListView(
          children: [
            new SizedBox(
              width: 600.0,
              height: 300.0,
              child: new Stack(children: <Widget>[
                new PageView(
                  children: [bannerCarousel],
                ),
              ]),
            ),
            titleSection,
            textSection,
            _buildProgram('IDOP #16 (English/Chinese)',
                'Sat 7 July - Sat 18 August 2018 (43 Days)'),
            Divider(),
            _buildProgram('I-Novice (English, Age 12-16)',
                'Sat 7 Jul - Sun 5 Aug 2018 (30 Days)'),
          ],
        ),
        drawer: Navigation());
  }
}
