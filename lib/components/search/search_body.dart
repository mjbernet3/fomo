import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/search_bloc.dart';
import 'package:project_fomo/components/search/genre_grid.dart';
import 'package:project_fomo/components/shared/loading_indicator.dart';
import 'package:project_fomo/components/shared/vertical_event_listing.dart';
import 'package:project_fomo/style.dart';
import 'package:provider/provider.dart';
import '../shared/input_field.dart';

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  SearchBloc _bloc;
  TextEditingController _searchController = TextEditingController(
    text: '',
  );

  @override
  void didChangeDependencies() {
    _bloc = Provider.of<SearchBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: _searchController,
          cursorColor: AppTextColor.mediumEmphasis,
          autocorrect: false,
          decoration: InputDecoration(
            alignLabelWithHint: false,
            focusedBorder: AppDecoration.inputFieldUnderline,
            enabledBorder: AppDecoration.inputFieldUnderline,
            icon: Icon(
              Icons.search,
              color: AppColor.dp24,
            ),
            hintText: 'Search...',
            hintStyle: TextStyle(
              color: AppTextColor.mediumEmphasis,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              child: Text(
                "Search",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () => _bloc.search(_searchController.text),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        StreamBuilder(
          stream: _bloc.searchState,
          initialData: SearchState.IDLE,
          builder: (context, snapshot) {
            if (snapshot.data == SearchState.RESULT) {
              return Expanded(
                child: VerticalEventListing(),
              );
            } else if (snapshot.data == SearchState.LOADING) {
              return LoadingIndicator();
            } else if (snapshot.data == SearchState.ERROR) {
              return Center(
                child: Text('Oops...Something went wrong!'),
              );
            } else {
              return Expanded(
                child: GenreGrid(),
              );
            }
          },
        ),
      ],
    );
  }
}
