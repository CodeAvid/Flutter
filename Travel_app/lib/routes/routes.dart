import 'package:flutter/material.dart';
import 'package:travel_app/screen/destination_screen.dart';
import 'package:travel_app/screen/home.dart';

const DestinationScreenRoute = "/destination_details";
const HomeRoute = "/";

RouteFactory routesPage() {
  return (settings) {
    final Map<String, dynamic> arguments = settings.arguments;
    Widget screen;
    switch (settings.name) {
      case HomeRoute:
        screen = Home();
        break;
      case DestinationScreenRoute:
        screen = DestinationScreen(arguments["destination"]);
        break;
      default:
        return null;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}
