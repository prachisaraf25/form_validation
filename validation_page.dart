import 'package:flutter/material.dart';

class ValidationPage extends StatefulWidget {
  @override
  _ValidationPageState createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Validation Demo')),
        body: Card(
          elevation: 2,
          margin: EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16),
                children: <Widget>[
                  Text(
                    'Entry Form',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Name'),
                    textCapitalization: TextCapitalization.words,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'This field is required';
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Age'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Required field';
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Date Of Birth'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Required field';
                      }

                      String pattern = r'[0-9]';
                      RegExp regexp = RegExp(pattern);

                      if (!regexp.hasMatch(value)) {
                        return 'Date Of Birth should be in the format DD/MM/YY';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Post'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Required field';
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Salary'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Must write salary';
                      }

                      String pattern1 = r'[0-9]';
                      RegExp regexp = RegExp(pattern1);

                      if (!regexp.hasMatch(value)) {
                        return 'Salary must be in numbers';
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  RaisedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        //
                      }
                    },
                  )
                ],
              )),
        ));
  }
}
