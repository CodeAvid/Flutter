import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int? rating;

  const RatingStars({
    Key? key,
    @required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = rating ?? 0;
    String stars = '';
    for (int i = 0; i < count; i++) {
      stars += '⭐️  ';
    }
    stars.trim();
    return Text(
      stars,
      style: TextStyle(
        fontSize: 18.0,
      ),
    );
  }
}
