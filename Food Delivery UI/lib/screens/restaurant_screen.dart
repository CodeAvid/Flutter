import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/food.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/widgets.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({
    Key? key,
    @required this.restaurant,
  }) : super(key: key);

  final Restaurant? restaurant;

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    final restaurantName = widget.restaurant!.name ?? "";
    final restaurantImage = widget.restaurant!.imageUrl ?? "";
    final restaurantAddress = widget.restaurant!.address ?? "";
    final ratingStar = widget.restaurant!.rating ?? 0;
    final menu = widget.restaurant!.menu!;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: restaurantImage,
                child: Image(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(restaurantImage),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      iconSize: 30.0,
                      color: Theme.of(context).primaryColor,
                      onPressed: () => {},
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      restaurantName,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '0.2 miles away',
                      style: TextStyle(fontSize: 18.0),
                    )
                  ],
                ),
                RatingStars(rating: ratingStar),
                Text(
                  restaurantAddress,
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    backgroundColor: Theme.of(context).primaryColor,
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    )),
                child: Text(
                  'Reviews',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {},
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    backgroundColor: Theme.of(context).primaryColor,
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    )),
                child: Text(
                  'Contact',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(menu.length, (index) {
                Food menuItem = menu[index];
                return _buildMenuItem(menuItem);
              }),
            ),
          ),
        ],
      ),
    );
  }

  _buildMenuItem(Food menuItem) {
    final foodName = menuItem.name ?? '';
    final foodPrice = menuItem.price ?? '';
    final foodImage = menuItem.imageUrl ?? '';
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 160.0,
            width: MediaQuery.of(context).size.width / 2 - 30,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(foodImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15.0)),
          ),
          Container(
            height: 160.0,
            width: MediaQuery.of(context).size.width / 2 - 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: [0.1, 0.4, 0.6, 0.9],
              ),
            ),
          ),
          Positioned(
            bottom: 65.0,
            child: Column(
              children: [
                Text(
                  foodName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  '\$${foodPrice.toString()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
