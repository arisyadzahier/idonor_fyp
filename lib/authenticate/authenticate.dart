import 'package:flutter/material.dart';
import 'package:fyp_application/authenticate/LoginPage.dart';
import 'package:fyp_application/authenticate/SignUpPage.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLoginPage = true;
  toggleView() {
    setState(() => showLoginPage = !showLoginPage);
  }

  @override
  Widget build(BuildContext contect) {
    if (showLoginPage) {
      return LoginPage(toggleView: toggleView);
    } else {
      return SignUpPage(toggleView: toggleView);
    }
  }
}
