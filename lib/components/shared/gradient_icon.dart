import 'package:flutter/material.dart';

// TODO: Make gradient look better
// Linear Gradient will NOT work (so cannot use app gradient in stylesheet)

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
        size: size,
      ),
    );
  }
}
