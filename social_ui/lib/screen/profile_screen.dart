import 'package:flutter/material.dart';

import 'package:flutter_social_ui/models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({Key key, this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  height: 300,
                  width: double.infinity,
                  image: AssetImage(widget.user.backgroundImageUrl),
                  fit: BoxFit.cover,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
