import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double zOffset = 0;
  double scaleFactor = 1;
  double rotateY = 0;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateZ(rotateY),
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isDrawerOpen ? 30 : 0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isDrawerOpen
                  ? IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        setState(() {
                          xOffset = 0;
                          yOffset = 0;
                          zOffset = 0;
                          scaleFactor = 1;
                          rotateY = 0;
                          isDrawerOpen = false;
                        });
                      },
                    )
                  : IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        setState(() {
                          xOffset = 200;
                          yOffset = 150;
                          scaleFactor = 0.7;
                          rotateY = -0.12;
                          isDrawerOpen = true;
                        });
                      },
                    ),
              Column(
                children: [
                  Text('Location'),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.green,
                      ),
                      Text('Ukranie'),
                    ],
                  )
                ],
              ),
              CircleAvatar(),
            ],
          )
        ],
      ),
    );
  }
}
