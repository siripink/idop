import 'package:flutter/material.dart';
import 'package:flutter_idop/utils.dart';
import 'package:flutter_idop/config/keys.dart';
import 'package:flutter_idop/tagging.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Media extends StatefulWidget {
  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<Media> {

  Tagging tagging = new Tagging();

  void playYoutubeVideoId(String videoId) {
    var youtube = new FlutterYoutube();
    tagging.sendEvent('youtube_' + videoId);

    youtube.playYoutubeVideoById(
      apiKey: youTubeKey,
      videoId: videoId,
      autoPlay: true
    );
  }

  Widget buildPlayList(String title, String asset, String videoId) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: ListTile(
        title: Text(title,
            style: TextStyle(fontSize: 15.0)),
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
          //https://img.youtube.com/vi/aHX6wyDcZ3Y/default.jpg
          buildPlayList('Introduction to ordination',
              'images/media/introduction.jpg',
              'LDs2wmaVcO8'
          ),
          buildPlayList('Ordain ritual in IDOP',
              'images/media/ritual.jpg',
              'kjmQYAddUos'
          ),
          buildPlayList('Once in a life time, Howard McCrary',
              'images/media/howard.jpg',
              'Ig5e6qc0owg'
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
          buildPlayList('IDOP #11',
              'images/media/idop11.jpg',
              'p4SKxMfOuFg'
          ),
          buildPlayList('IDOP #15 (Ep.1)',
              'images/media/idop15.jpg',
              'hm6l9WJLJbY'
          ),
          buildPlayList('IDOP #16 Asking for forgiveness, robe offering ceremony',
              'images/media/idop16.jpg',
              'aHX6wyDcZ3Y'
          ),
          new Divider(),
        ],
      ),
    );
  }
}
