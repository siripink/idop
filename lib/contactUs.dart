import 'package:flutter/material.dart';
import 'package:validate/validate.dart';
import 'package:flutter_idop/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ContactUs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ContactUsState();
}

class _FormData {
  String email = '';
  String message = '';
  String name = '';
  String subject = '';
}

class _ContactUsState extends State<ContactUs> {
  String status = "";
  Widget appBarTitle = Container(
      margin: const EdgeInsets.only(left: 8.0),
      child: Text('Contact Us'));

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _FormData _data = new _FormData();

  String _validateEmail(String value) {
    // If empty value, the isEmail function throw a error.
    // So I changed this function with try and catch.
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }

    return null;
  }

  String _validateNotEmptyString(String value) {
    if (value.length == 0) {
      return 'This field cannot be empty.';
    }

    return null;
  }

  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      print('Printing the form data.');
      print('Email: ${_data.email}');
      print('Name: ${_data.name}');

//      Widget result = new FutureBuilder<List<User>>(
//        future: fetchUsersFromGitHub(),
//        builder: (context, snapshot) {
//
//          if (snapshot.hasData) {
//            return new ListView.builder(
//                itemCount: snapshot.data.length,
//                itemBuilder: (context, index) {
//                  return new Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        new Text(snapshot.data[index].name,
//                            style: new TextStyle(fontWeight: FontWeight.bold)),
//                        new Divider()
//                      ]
//                  );
//                }
//            );
//          } else if (snapshot.hasError) {
//            return new Text("${snapshot.error}");
//          }
//
//          // By default, show a loading spinner
//          return new CircularProgressIndicator();
//        },
//      ),
    }
  }

//  Future<List<User>> fetchUsersFromGitHub() async {
//    final response = await http.get('http://api.ordinationthai.org/login');
//    print(response.body);
//    List responseJson = json.decode(response.body.toString());
//    List<User> userList = createUserList(responseJson);
//    return userList;
//  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: AppBar(
        title: appBarTitle,
      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                Utils.buildTitle('Dhammakaya Foundation'),
                Utils.buildDescription(context,
                    '''
40 Mu 8, Khlong Song,
Khlong Luang Patumthani 12120,Thailand
Tel (+66) 82 440 7777
Skype: Snarongchai
Line ID: @IDOP
Email: english@ordinationthai.org
Website: ordinationthai.org'''),
                new Divider(),
                Utils.buildTitle('Directions to the Temple'),
                Utils.buildTitle('Free Buses:'),
    Utils.buildDescription(context,
    '''
Every Sunday from Sanam Luang (near the main gate of Thammasat University),Ramkhamhaeng University (in front of the rector building),and from the Victory Monument.Look for the passengers dressed in white.Buses leave for the temple from 07.00-08.00 a.m.
    '''),
                new Divider(),
                Utils.buildTitle('Public Buses: From Bangkok to Rangsit:'),
    Utils.buildDescription(context,
    '''
Air con.No.s 3, 4, 10, 13, 29, 39, 95

Non-Aircon. No.s 29, 34, 39, 59, 95

From the western corner of Rangsit market take the 1008 service to the temple.
    '''),
                new Divider(),
                Utils.buildTitle('By Car:'),
                Utils.buildDescription(context,
                    '''
The journey from central Bangkok to the temple takes approximately 60 minutes.
    '''),
                new Divider(),
                Utils.buildTitle('By Taxi:'),
                Utils.buildDescription(context,
                    '''
The simplest way to come to Dhammakaya Temple the first time is to take a metered-taxi from the Donmueng airport (about 20 minutes & costing about 300 Baht)
    '''),
                new Divider(),
                Utils.buildTitle('Contact Us:'),
                new TextFormField(
                    decoration: new InputDecoration(
                        hintText: 'your name',
                        labelText: 'Name'
                    ),
                    validator: this._validateNotEmptyString,
                    onSaved: (String value) {
                      this._data.name = value;
                    }
                ),
                new TextFormField(
                    keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'you@example.com',
                        labelText: 'E-mail Address'
                    ),
                    validator: this._validateEmail,
                    onSaved: (String value) {
                      this._data.email = value;
                    }
                ),
                new TextFormField(
                    decoration: new InputDecoration(
                        hintText: 'Subject',
                        labelText: 'Subject'
                    ),
                    validator: this._validateNotEmptyString,
                    onSaved: (String value) {
                      this._data.subject = value;
                    }
                ),
                new TextFormField(
                    decoration: new InputDecoration(
                        hintText: 'your message',
                        labelText: 'Message'
                    ),
                    validator: this._validateNotEmptyString,
                    onSaved: (String value) {
                      this._data.message = value;
                    }
                ),
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'Send',
                      style: new TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed: this.submit,
                    color: Colors.blue,
                  ),
                  margin: new EdgeInsets.only(
                      top: 20.0
                  ),
                ),
                new Divider(),
              ],
            ),
          )
      ),
    );
  }
}