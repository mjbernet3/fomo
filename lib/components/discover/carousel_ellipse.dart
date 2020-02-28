import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';

class CarouselEllipse extends StatelessWidget {
  final bool activated;

  CarouselEllipse({this.activated});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12,
      height: 12,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: activated ? null : Color(0x0FFFFFFF),
          gradient: activated ? AppColor.gradient : null,
        ),
      ),
    );
  }
}
