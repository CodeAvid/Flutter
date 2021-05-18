import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/screens/screens.dart';

const HomeScreenRoute = '/';

RouteFactory routesPage() {
  return (settings) {
    // final Map<String, dynamic> arguments = settings.arguments;
    Widget screen;
    switch (settings.name) {
      case HomeScreenRoute:
        screen = HomeScreen();
        break;
      default:
        return null;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}
