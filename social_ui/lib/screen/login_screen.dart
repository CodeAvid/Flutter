import 'package:flutter/material.dart';
import 'package:flutter_social_ui/widgets/widgets.dart';

import 'screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              ClipPath(
                clipper: CurveClipper(),
                child: Image(
                  height: MediaQuery.of(context).size.height / 2.5,
                  image: AssetImage('assets/images/login_background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'FRENZY',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 10.0),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Username',
                    prefixIcon: Icon(Icons.account_box),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 40.0),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((_) => HomeScreen()),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 60.0),
                  height: 45.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width / 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    child: Container(
                      height: 80.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Text(
                        'Don\'t have an account? Sign up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width / 25,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
