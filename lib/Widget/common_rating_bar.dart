import 'package:flutter/material.dart';
import 'package:webledger_interview/Const/app_color.dart';

class CommonRatingBar extends StatelessWidget {
  final double rating ;

  const CommonRatingBar({
    Key? key,
    required this.rating
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(5, (index) {
        IconData iconData;
        double difference = rating - index;

        if (difference >= 0.75) {
          iconData = Icons.star; // Full Star
        } else if (difference >= 0.25 && difference < 0.75) {
          iconData = Icons.star_half; // Half Star
        } else {
          iconData = Icons.star_border; // Empty Star
        }

        return Icon(
          iconData,
          color: Colors.amber,
          size: 28,
        );
      }),
    );
  }
}