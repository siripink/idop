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

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _FormData _data = new _FormData();

  String _validateEmail(String value) {
    // If empty value, the isEmail function throw a error.
    // So I changed this function with try and catch.
    try {
      Validate.isEmail(value.trim());
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

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return  new Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
          new Padding(
          padding: new EdgeInsets.all(16.0),
            child: new CircularProgressIndicator()
          ),
              new Text("Loading..."),
            ],
          ),
        );
        }
      );

      print('Printing the form data.');
      print('Email: ${_data.email}');
      print('Name: ${_data.name}');

      sendEmail();
    }
  }

  sendEmail() async {
    Map<String, String> body = {
      'name': '${_data.name}',
      'email': '${_data.email}',
      'subject': '${_data.subject}',
      'message': '${_data.message}',
    };
    final response = await http.post('http://api.ordinationthai.org/contactUs', body: body);
    Map data = json.decode(response.body.toString());
    String apiStatus = data['status'];
    String name = data['name'];
    print("apiStatus:  $apiStatus, name: $name");

    if (!mounted) return;

    setState(() {
      status = apiStatus;
    });

    Navigator.pop(context);
    _formKey.currentState.reset();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(title: Text('Contact Us')),
      body: new Container(
          padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 20.0),
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
                      this._data.email = value.trim();
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
            Container(
              padding: const EdgeInsets.only(top: 16.0),
              child: new Text('$status',
                    style: TextStyle(
                      color: Colors.green[600],
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    )
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