import 'package:flutter/material.dart';
import 'package:project_fomo/style.dart';

class GenreCard extends StatelessWidget {
  final String genreText;
  final ImageProvider genreImage;
  final Function onPressed;

  const GenreCard({
    this.genreText,
    this.genreImage,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/welcome-background.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              genreText,
              style: TextStyle(
                fontFamily: AppFontFamily.family,
                fontSize: AppFontSize.size18,
                fontWeight: AppFontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
