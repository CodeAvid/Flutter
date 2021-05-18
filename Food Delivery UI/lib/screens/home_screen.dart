import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/screens/screens.dart';
import 'package:flutter_food_delivery_ui/widgets/widgets.dart';
import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (_) {
              return CartScreen();
            })),
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
          Column(
            children: [_buildRestaurants()],
          )
        ],
      ),
    );
  }

  _buildRestaurants() {
    List<Widget> restaurantsList = [];
    restaurants.forEach((Restaurant restaurant) {
      final restaurantImage = restaurant.imageUrl ?? '';
      final restaurantName = restaurant.name ?? '';
      final restaurantAddress = restaurant.address ?? '';
      restaurantsList.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RestaurantScreen(restaurant: restaurant),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                width: 1.0,
                color: Colors.grey[200] ?? Colors.grey,
              ),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Hero(
                    tag: restaurantImage,
                    child: Image(
                      height: 150.0,
                      width: 150.0,
                      image: AssetImage(restaurantImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurantName,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        RatingStars(rating: restaurant.rating),
                        SizedBox(height: 4.0),
                        Text(
                          restaurantAddress,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'O.2 miles away',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    return Column(children: restaurantsList);
  }
}
