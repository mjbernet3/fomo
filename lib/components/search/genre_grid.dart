import 'package:flutter/material.dart';
import 'package:project_fomo/components/search/genre_card.dart';

class GenreGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      children: <Widget>[
        GenreCard(
          genreText: 'Alternative',
          genreImage: AssetImage("lib/assets/images/welcome-background.jpeg"),
          onPressed: () => print('card clicked'),
        ),
        GenreCard(
          genreText: 'Country',
          genreImage: AssetImage("lib/assets/images/welcome-background.jpeg"),
          onPressed: () => print('card clicked'),
        ),
        GenreCard(
          genreText: 'Hip Hop',
          genreImage: AssetImage("lib/assets/images/welcome-background.jpeg"),
          onPressed: () => print('card clicked'),
        ),
        GenreCard(
          genreText: 'Rock',
          genreImage: AssetImage("lib/assets/images/welcome-background.jpeg"),
          onPressed: () => print('card clicked'),
        ),
        GenreCard(
          genreText: 'Electronic',
          genreImage: AssetImage("lib/assets/images/welcome-background.jpeg"),
          onPressed: () => print('card clicked'),
        ),
        GenreCard(
          genreText: 'Orchestra',
          genreImage: AssetImage("lib/assets/images/welcome-background.jpeg"),
          onPressed: () => print('card clicked'),
        ),
      ],
    );
  }
}
