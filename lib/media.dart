import 'package:flutter/material.dart';
import 'package:flutter_idop/audio.dart';
import 'package:flutter_idop/utils.dart';
import 'package:flutter_idop/tagging.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Media extends StatefulWidget {
  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<Media> {


  void playYoutubeVideoId(String videoId) {
    var youtube = new FlutterYoutube();

    youtube.playYoutubeVideoById(
      apiKey: "AIzaSyA7qu24iir7PE_Dmim4-wf_M2BhvsCgTB8",
      videoId: videoId,
    );
  }

  Widget buildPlayList(String title, String asset, String videoId) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: ListTile(
        title: Text(title,
            style: TextStyle(fontWeight: FontWeight.w500,
                color: Colors.black54)),
        leading: new Image.asset(
          asset,
          fit: BoxFit.cover,
          width: 100.0,
        ),
        onTap: () {playYoutubeVideoId(videoId);},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Media'),
      ),
      body: new ListView(
        // Important: Remove any padding from the ListView.
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        children: <Widget>[
          Utils.buildTitle('Introduction To Ordination'),
          new Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: new Text(''),
          ),
          buildPlayList('Introduction to ordination',
              'images/media/introduction.jpg',
              'LDs2wmaVcO8'
          ),
          buildPlayList('Training in IDOP',
              'images/media/training.jpg',
              'bFJWRhORfIA'
          ),
          buildPlayList('Ordain ritual in IDOP',
              'images/media/ritual.jpg',
              'kjmQYAddUos'
          ),
          buildPlayList('Stages in the ordination ceremony IDOP',
              'images/media/ceremony.jpg',
              '1N8og8nu07g'
          ),
          buildPlayList('Once in a life time, Howard McCrary',
              'images/media/howard.jpg',
              'Ig5e6qc0owg'
          ),
          buildPlayList('Ordination experience, Howard McCrary',
              'images/media/howard2.jpg',
              '94a5DILXteA'
          ),
          new Divider(),
          Utils.buildTitle('Past Event'),
          new Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: new Text(''),
          ),
          buildPlayList('IDOP is the solution',
              'images/media/past1.jpg',
              'BLzPvoTKmlc'
          ),
          buildPlayList('The best life - William Goh',
              'images/media/william.jpg',
              'uAHIGC0YcHU'
          ),
          buildPlayList('IDOP (Chinese)',
              'images/media/past3.jpg',
              'w5nqI2_rlK4'
          ),
          buildPlayList('IDOP #10',
              'images/media/idop10.jpg',
              'L7q4R35nbCQ'
          ),
          buildPlayList('IDOP #11',
              'images/media/idop11.jpg',
              'p4SKxMfOuFg'
          ),
          buildPlayList('IDOP #12 (Ep.1)',
              'images/media/idop12_ep1.jpg',
              'MXE5RANWEAU'
          ),
          buildPlayList('IDOP #12 (Byeong-Je Scoop)',
              'images/media/idop12.jpg',
              'e7J7chY1x_M'
          ),
          buildPlayList('IDOP #13 (Ep.1)',
              'images/media/idop13_ep1.jpg',
              '8wkMZr2RPb8'
          ),
          buildPlayList('IDOP #13 (Ep.2)',
              'images/media/idop13.jpg',
              'bnEkcYKbiNk'
          ),
          buildPlayList('IDOP Myanmar #1',
              'images/media/idop_myanmar.jpg',
              'E6gMIlLpoyk'
          ),
          buildPlayList('IDOP Interview',
              'images/media/interview.jpg',
              'OF9GmC3uQjU'
          ),
          new Divider(),
        ],
      ),
    );
  }
}
