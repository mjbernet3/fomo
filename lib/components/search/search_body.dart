import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/search_bloc.dart';
import 'package:project_fomo/components/search/genre_grid.dart';
import 'package:provider/provider.dart';
import '../shared/input_field.dart';

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  SearchBloc _bloc;

  @override
  void didChangeDependencies() {
    _bloc = Provider.of<SearchBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InputField(
          labelText: 'Search...',
          icon: Icons.search,
          onChanged: (value) => print(value),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: GenreGrid(),
        ),
      ],
    );
  }
}
