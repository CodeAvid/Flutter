import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/routes/routes_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: Colors.deepOrangeAccent,
      ),
      onGenerateRoute: routesPage(),
    );
  }
}
