import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';


// Definitely needs some work on... doesn't really fit the gradient perfect
// Perfect task for Jack our super detailed dude
// Linear Gradient will NOT work... it'll only fill with one color
// this method of a gradient icon needs a radial gradient

class GradientIcon extends StatelessWidget {

  final IconData icon;
  final double size;

  GradientIcon({@required this.icon, @required this.size});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (Rect bounds) {
          return RadialGradient(
            focal: Alignment.centerLeft,
            radius: 1.5,
            colors: <Color>[
              Color(0xFFFF6C1A),
              Color(0xFFF01844),
              Color(0xFF7E0BC9),
            ],
            tileMode: TileMode.mirror,

          ).createShader(bounds);
        },
        child: Icon(
            icon,
        size: size,)
    );
  }

}