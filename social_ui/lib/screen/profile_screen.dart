import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/user_model.dart';
import 'package:flutter_social_ui/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({Key key, this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _yourPostsPageController;
  PageController _favouritesPageController;

  @override
  void initState() {
    _yourPostsPageController = PageController(viewportFraction: 0.8);
    _favouritesPageController = PageController(viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 300,
                    width: double.infinity,
                    image: AssetImage(widget.user.backgroundImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 30.0,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 2),
                              blurRadius: 6.0)
                        ]),
                    child: ClipOval(
                      child: Image(
                        height: 120.0,
                        width: 120.0,
                        image: AssetImage(
                          widget.user.profileImageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                widget.user.name,
                style: TextStyle(
                  fontSize: min(screenWidth, screenHeight) / 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: min(screenWidth, screenHeight) / 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.user.following.toString(),
                      style: TextStyle(
                        fontSize: min(screenWidth, screenHeight) / 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: min(screenWidth, screenHeight) / 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.user.followers.toString(),
                      style: TextStyle(
                        fontSize: min(screenWidth, screenHeight) / 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //TODO: FIX PAGE CONTROLLER RENDERING ISSUE
            PostCarousel(
              pageController: _yourPostsPageController,
              title: "Your Post",
              posts: widget.user.posts,
            ),
            PostCarousel(
              pageController: _favouritesPageController,
              title: "Favourites",
              posts: widget.user.favorites,
            ),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
