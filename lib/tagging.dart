import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'dart:async';

class Tagging {
  static FirebaseAnalytics analytics = new FirebaseAnalytics();

  Future<Null> sendEvent(String title) async {
    await analytics.logEvent(
        name: title
    );
  }
}