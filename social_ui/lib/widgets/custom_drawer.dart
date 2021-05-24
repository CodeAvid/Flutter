import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/screen/screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  _buildDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 20.0),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  height: MediaQuery.of(context).size.height / 4,
                  width: double.infinity,
                  image: AssetImage(currentUser.backgroundImageUrl),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 3.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: ClipOval(
                          child: Image(
                            image: AssetImage(currentUser.profileImageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        currentUser.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width / 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            _buildDrawerOption(
              Icon(Icons.dashboard),
              "Home",
              () => _navigateToScreen(context, HomeScreen()),
            ),
            _buildDrawerOption(Icon(Icons.chat), "Chat", () => {}),
            _buildDrawerOption(Icon(Icons.location_on), "Location", () => {}),
            _buildDrawerOption(
                Icon(Icons.account_circle),
                "Your Profile",
                () => _navigateToScreen(
                    context,
                    ProfileScreen(
                      user: currentUser,
                    ))),
            _buildDrawerOption(Icon(Icons.settings), "Settings", () => {}),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: _buildDrawerOption(
                  Icon(Icons.directions_run),
                  "Logout",
                  () => _navigateToScreen(context, LoginScreen()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }
}
