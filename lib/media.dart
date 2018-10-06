import 'package:flutter/material.dart';
import 'package:flutter_idop/utils.dart';
import 'package:flutter_idop/config/keys.dart';
import 'package:flutter_idop/tagging.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        leading: new Image.network(
          asset,
          fit: BoxFit.cover,
          width: 100.0,
        ),
        onTap: () {playYoutubeVideoId(videoId);},
      ),
    );
  }

  List<Widget> buildMediaDetail(List<DocumentSnapshot> documents) {
    List<Widget> list = new List();
    for (var document in documents) {
      list.add(
          buildPlayList(document['title'],
              document['image'],
              document['videoId']
          )
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    Widget buildCurrentMedia = new StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('Medias').orderBy('createdTs', descending: false).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return new Text('Coming Soon...');
          else {
            return new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildMediaDetail(snapshot.data.documents)
            );
          }
        }
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Media'),
      ),
      body: new ListView(
        // Important: Remove any padding from the ListView.
        padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
        children: <Widget>[
          buildCurrentMedia,
          new Divider(),
        ],
      ),
    );
  }
}
