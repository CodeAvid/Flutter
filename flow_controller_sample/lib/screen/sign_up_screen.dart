import 'package:flow_controller_sample/flowcontroller/landing_dep.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Sign up here"),
          SizedBox(height: 20.0),
          GestureDetector(
            onTap: () => print("Go to home screen"),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Text('Home'),
            ),
          ),
          SizedBox(height: 20.0),
          RichText(
            text: TextSpan(
              text: "Don't have an account click here to",
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _loggedInListener().onLogInClicked();
                    },
                  text: "Log in",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  OnLoggedInListener _loggedInListener() {
    return context.findAncestorStateOfType<OnLoggedInListener>();
  }
}
