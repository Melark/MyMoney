import 'package:flutter/material.dart';
import '../services/auth_provider.dart';

class Loginpage extends StatefulWidget {
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
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
              await auth.signInWithEmailAndPassword(_email, _password);
          print('Signed in: $userId');
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[Icon(Icons.attach_money, size: 150.0, color: Colors.white,),
              Text('Budget App', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),)],
            ),),
            Expanded(flex: 2,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[_loginFormStack(),
              FlatButton(child: Text('Not a user yet? Register now!'),)],
            ),)],
        ),
      ),
    );
  }

  Widget _loginFormStack(){
    return Stack(
      alignment: Alignment(0.0, -1.25),
      children: <Widget>[
        _loginCard(),
        Container(
          padding: EdgeInsets.fromLTRB(80.0, 10.0, 80.0, 10.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey
          ),
          child: Text('Log In', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)),
        )

      ],
    );
  }

  Widget _loginCard() {
    return Card(
      child: _loginFormSection(),
    );
  }

  Widget _loginFormSection() {
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
                  validator: (val){
                if (val.isEmpty)
                {
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
               validator: (val){
                if (val.isEmpty)
                {
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
              child: Text('Login'),
            ),
            
          ],
        ),
      ),
    );
  }
}
