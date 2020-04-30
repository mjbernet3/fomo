import 'package:flutter/material.dart';
import 'package:project_fomo/components/search/genre_card.dart';

class GenreGrid extends StatelessWidget {
  final List<GenreCard> genreCards;

  const GenreGrid({this.genreCards});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      children: genreCards,
    );
  }
}
