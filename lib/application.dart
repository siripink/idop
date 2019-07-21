import 'package:flutter/material.dart';
import 'dropdown_formfield.dart';
import 'navigation.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class Applicant {
  String program = '';
  //Personal Info
  String name = '';
  String nationality = '';
  String race = '';
  String religion = '';
  String nativeLanguage = '';
  String secondLanguage = '';
  String birthPlace = '';
  String dob = '';
  String age = '';
  String height = '';
  String weight = '';

  //Contact Info
  String phone = '';
  String email = '';
}

class _ApplicationState extends State<Application> {
  int currStep = 0;

  //static var _focusNode = new FocusNode();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static Applicant data = new Applicant();
  List<String> _dropdownValues = <String>['red', 'green', 'blue', 'orange'];

  List<Step> steps = [
    new Step(
        title: const Text('PERSONAL INFORMATION'),
        //subtitle: const Text('Enter your name'),
        isActive: true,
        //state: StepState.error,
        state: StepState.indexed,
        content: personalInfo),
    new Step(
        title: const Text('EDUCATION INFORMATION'),
        //subtitle: const Text('Subtitle'),
        isActive: true,
        //state: StepState.editing,
        state: StepState.indexed,
        content: new TextFormField(
          keyboardType: TextInputType.phone,
          autocorrect: false,
          validator: (value) {
            if (value.isEmpty || value.length < 10) {
              return 'Please enter valid number';
            } else
              return null;
          },
          onSaved: (String value) {
            data.phone = value;
          },
          maxLines: 1,
          decoration: new InputDecoration(
              labelText: 'Enter your number',
              hintText: 'Enter a number',
              icon: const Icon(Icons.phone),
              labelStyle:
                  new TextStyle(decorationStyle: TextDecorationStyle.solid)),
        )),
    new Step(
        title: const Text('CONTACT INFORMATION'),
        // subtitle: const Text('Subtitle'),
        isActive: true,
        state: StepState.indexed,
        // state: StepState.disabled,
        content: new TextFormField(
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          validator: (value) {
            if (value.isEmpty || !value.contains('@')) {
              return 'Please enter valid email';
            } else
              return null;
          },
          onSaved: (String value) {
            data.email = value;
          },
          maxLines: 1,
          decoration: new InputDecoration(
              labelText: 'Enter your email',
              hintText: 'Enter a email address',
              icon: const Icon(Icons.email),
              labelStyle:
                  new TextStyle(decorationStyle: TextDecorationStyle.solid)),
        )),
    new Step(
        title: const Text('EMERGENCY CONTACT INFORMATION'),
        // subtitle: const Text('Subtitle'),
        isActive: true,
        state: StepState.indexed,
        content: new TextFormField(
          keyboardType: TextInputType.number,
          autocorrect: false,
          validator: (value) {
            if (value.isEmpty || value.length > 2) {
              return 'Please enter valid age';
            } else
              return null;
          },
          maxLines: 1,
          onSaved: (String value) {
            data.age = value;
          },
          decoration: new InputDecoration(
              labelText: 'Enter your age',
              hintText: 'Enter age',
              icon: const Icon(Icons.explicit),
              labelStyle:
                  new TextStyle(decorationStyle: TextDecorationStyle.solid)),
        )),
    new Step(
        title: const Text('GUARANTEE'),
        subtitle: const Text('Subtitle'),
        isActive: true,
        state: StepState.complete,
        content: const Text('Enjoy Step Fifth'))
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    ScrollController _scrollController = new ScrollController();

    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      Scaffold.of(context)
          .showSnackBar(new SnackBar(content: new Text(message)));
    }

    void _submitDetails() {
      final FormState formState = _formKey.currentState;

      if (!formState.validate()) {
        showSnackBarMessage('Please enter correct data');
      } else {
        formState.save();
        print("Name: ${data.name}");
        print("Phone: ${data.phone}");
        print("Email: ${data.email}");
        print("Age: ${data.age}");

        showDialog(
            context: context,
            builder: (_) => new AlertDialog(
              title: new Text("Details"),
              //content: new Text("Hello World"),
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    new Text("Name : " + data.name),
                    new Text("Phone : " + data.phone),
                    new Text("Email : " + data.email),
                    new Text("Age : " + data.age),
                  ],
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
      }
    }

    return Scaffold(
        appBar: AppBar(title: Text('Application'), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done_outline),
            tooltip: 'Submit',
            onPressed: _submitDetails,
          )
        ]),
        body: new Container(
            child: new Form(
                key: _formKey,
                child: new NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      new SliverList(
                        delegate: new SliverChildListDelegate(<Widget>[
                          new Container(
                            width: screenSize.width,
                            child: DropdownFormField<String>(
                              hint: 'IDOP Program',
                              value: data.program,
                              items: _dropdownValues.toList(),
                              onChanged: (val) => setState(() {
                                    data.program = val;
                                  }),
                              validator: (val) => (val == null || val.isEmpty)
                                  ? 'Please choose IDOP Program'
                                  : null,
                              //initialValue: '',
                              onSaved: (val) => setState(() {
                                    data.program = val;
                                  }),
                            ),
                            margin:
                                new EdgeInsets.only(left: 40.0, right: 40.0),
                          )
                        ]),
                      )
                    ];
                  },
                  body: new Stepper(
                    steps: steps,
                    type: StepperType.vertical,
                    currentStep: this.currStep,
                    onStepContinue: () {
                      setState(() {
                        if (currStep < steps.length - 1) {
                          currStep = currStep + 1;
                        } else {
                          currStep = 0;
                        }
                      });
                    },
                    onStepCancel: () {
                      setState(() {
                        if (currStep > 0) {
                          currStep = currStep - 1;
                        } else {
                          currStep = 0;
                        }
                      });
                    },
                    onStepTapped: (step) {
                      setState(() {
                        currStep = step;
                      });
                    },
                  ),
                ))),
        drawer: Navigation()
    );
  }

  static Widget personalInfo = new Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      createTextFormField(data.name, "Full name"),
      createTextFormField(data.nationality, "Nationality"),
      createTextFormField(data.race, "Race"),
      createTextFormField(data.religion, "Religion"),
      createTextFormField(data.nativeLanguage, "Native language"),
      createTextFormField(data.secondLanguage, "Second or other languages"),
      createTextFormField(data.birthPlace, "Place of birth (city, state/province, country)"),
      createTextFormField(data.dob, "Date of birth (dd/mm/yyyy)"),
      createTextFormField(data.age, "Age"),
      createTextFormField(data.height, "Height"),
      createTextFormField(data.weight, "Weight"),
    ],
  );

  static TextFormField createTextFormField(String dataField, String textLabel) {
    return new TextFormField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      onSaved: (String value) {
        dataField = value;
      },
      maxLines: 1,
      validator: (value) {
        if (value.isEmpty || value.length < 1) {
          return 'Please enter your ${textLabel.toLowerCase()}';
        } else
          return null;
      },
      decoration: new InputDecoration(
          labelText: '${textLabel}',
          hintText: 'Enter your ${textLabel.toLowerCase()}',
          labelStyle:
          new TextStyle(decorationStyle: TextDecorationStyle.solid)),
    );
  }

}
