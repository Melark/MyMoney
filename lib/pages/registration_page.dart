import 'package:flutter/material.dart';
import '../services/auth_provider.dart';


class RegistrationPage extends StatefulWidget {
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();
  String _email;
  String _password;

bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        var auth = AuthProvider();
        String userId =
            await auth.registerWithEmailAndPassword(_email, _password);
        print('Registered User: $userId');
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
        padding: EdgeInsets.all(25.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _registrationFormStack(),
          FlatButton(
                    child: Text('Already a user? Sign In now!'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
        ],
      ),
    ));
  }

  Widget _registrationFormStack() {
    return Stack(
      alignment: Alignment(0.0, -1.25),
      children: <Widget>[
        _registrationCard(),
        Container(
          padding: EdgeInsets.fromLTRB(80.0, 10.0, 80.0, 10.0),
          decoration: BoxDecoration(color: Colors.blueGrey),
          child: Text('Sign Up',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        )
      ],
    );
  }

  Widget _registrationCard() {
    return Card(
      child: _registrationFormSection(),
    );
  }

  Widget _registrationFormSection() {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              key: Key('email'),
              decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  )),
              onSaved: (val) => _email = val,
              validator: (val) {
                if (val.isEmpty) {
                  return "Email cannot be empty";
                }
                return null;
              },
            ),
            TextFormField(
              key: Key('password'),
              decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  )),
              obscureText: true,
              onSaved: (val) => _password = val,
              validator: (val) {
                if (val.isEmpty) {
                  return "Password cannot be empty";
                }
                return null;
              },
            ),
            SizedBox(
              height: 7.0,
            ),
            RaisedButton(
              onPressed: validateAndSubmit,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
