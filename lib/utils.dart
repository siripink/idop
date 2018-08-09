import 'package:flutter/material.dart';


class Utils {

  static Widget buildTitle(String title) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, top: 18.0),
      child: Text(title,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          )),
    );
  }

  static Widget buildDescription(BuildContext context, String description) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 0.0),
      child: Text(
        description,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.body1.copyWith(color: Colors.black54),
        softWrap: true,
      ),
    );
  }
}