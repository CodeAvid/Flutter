import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/routes/routes_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: routesPage(),
    );
  }
}
