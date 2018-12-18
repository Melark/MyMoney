import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.all(25.0),
        child: Stack(
          children: <Widget>[
            Card(
              child: Form(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Log In',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          )),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          )),
                      obscureText: true,
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text('Login'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
