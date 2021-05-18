import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/screens/screens.dart';

const HomeScreenRoute = '/';
const RestaurantScreenRoute = '/restaurant_screen.dart';

RouteFactory routesPage() {
  return (settings) {
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
