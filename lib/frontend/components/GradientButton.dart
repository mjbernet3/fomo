import 'package:flutter/material.dart';
import 'dart:math' as math;

class GradientButton extends StatelessWidget {
  final String buttonText;
  final Function buttonPressed;

  static final LinearGradient gradientOutline = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: const [Color(0xFFFF6C1A), Color(0xFFF01844), Color(0xFF7E0BC9)],
    stops: const [0.0, .528, 1.0],
    transform: GradientRotation(math.pi/4),
  );

  final innerDecor = BoxDecoration(
    color: Color(0xFF121212),
    border: Border.all(color: Color(0xFF121212)),
    borderRadius: BorderRadius.circular(20)
  );

  final gradientBoxDecoration = BoxDecoration(
    gradient: gradientOutline,
    borderRadius: BorderRadius.circular(20),
  );

  GradientButton({
    @required this.buttonText,
    @required this.buttonPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          child: ButtonTheme(
            child:FlatButton(
              color: Colors.transparent,
              onPressed: buttonPressed,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20)
              ),
              child: Text(
                  buttonText,
                  textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                    fontSize: 24.0
                ),
              )
            ),
            minWidth: 88.0,
            height: MediaQuery.of(context).size.width * 0.12
          ),
          decoration: innerDecor,
        ),
      ),
      constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
      height: MediaQuery.of(context).size.width * 0.12,
      decoration: gradientBoxDecoration,
    );
  }
}