import 'package:flow_controller_sample/flowcontroller/landing_dep.dart';
import 'package:flow_controller_sample/widget/design.dart';
import 'package:flutter/gestures.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login up here",
            style: TextStyle(color: Colors.white, fontSize: 30.0),
          ),
          SizedBox(height: 20.0),
          GestureDetector(
            onTap: () => print("Go to home screen"),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Text(
                'Home',
              ),
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
                      signupListener().onSignUpClicked();
                    },
                  text: "Sign up",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  OnSignUpListener signupListener() {
    return context.findAncestorStateOfType<OnSignUpListener>();
  }
}
