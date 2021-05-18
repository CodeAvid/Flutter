import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/widgets/widgets.dart';
import '../data/data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30.0,
          onPressed: () => print('Account'),
        ),
        title: Text('Food Delivery'),
        actions: [
          TextButton(
            onPressed: () => print('Add to cart'),
            child: Text(
              'Cart (${currentUser.cart != null ? currentUser.cart!.length : 0})',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(width: 0.8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                    borderSide: BorderSide(
                      width: 0.8,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  prefixIcon: Icon(Icons.search, size: 30.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {},
                  ),
                  hintText: 'Seach Food or Restaurants'),
            ),
          ),
          RecentOrders(),
        ],
      ),
    );
  }
}
