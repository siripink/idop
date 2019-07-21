import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import '../tagging.dart';

class LinkText extends TextSpan {

  LinkText({String url, String text, String tag}) : super(
      style: new TextStyle(color: Colors.deepOrange),
      text: text ?? url,
      recognizer: new TapGestureRecognizer()..onTap = () {
        launch(url, forceSafariVC: false);
        Tagging tagging = new Tagging();
        tagging.sendEvent('download_' + tag);
      }
  );

}