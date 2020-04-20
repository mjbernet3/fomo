import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/search_bloc.dart';
import 'package:project_fomo/components/search/genre_card.dart';
import 'package:project_fomo/components/search/genre_grid.dart';
import 'package:project_fomo/components/shared/error_indicator.dart';
import 'package:project_fomo/components/shared/vertical_event_listing.dart';
import 'package:project_fomo/models/event.dart';
import 'package:project_fomo/style.dart';
import 'package:project_fomo/utils/structures/page_state.dart';
import 'package:provider/provider.dart';

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  SearchBloc _bloc;
  TextEditingController _searchController = TextEditingController(text: '');

  static const UnderlineInputBorder searchBarUnderline = UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppTextColor.mediumEmphasis,
      width: 2,
    ),
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
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            alignLabelWithHint: false,
            focusedBorder: searchBarUnderline,
            enabledBorder: searchBarUnderline,
            icon: Icon(
              Icons.search,
              color: AppColor.dp24,
            ),
            hintText: 'Search...',
            hintStyle: TextStyle(
              color: AppTextColor.mediumEmphasis,
            ),
          ),
          onChanged: (text) {
            if (_searchController.text == '') {
              _bloc.changeState(PageState(state: SearchState.IDLE));
            } else {
              _bloc.searchEvents(_searchController.text);
            }
          },
        ),
        SizedBox(
          height: 20.0,
        ),
        StreamBuilder(
          stream: _bloc.searchState,
          initialData: PageState(state: SearchState.IDLE),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ErrorIndicator(
                errorText: snapshot.error.toString(),
              );
            } else if (snapshot.data.state == SearchState.RESULT) {
              List<Event> events = snapshot.data.data;

              if (events.length > 0) {
                return Expanded(
                  child: VerticalEventListing(
                    events: events,
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    'No results. Try something else.',
                    style: TextStyle(
                      color: AppTextColor.highEmphasis,
                      fontFamily: AppFontFamily.family,
                      fontSize: AppFontSize.size18,
                      fontWeight: AppFontWeight.normal,
                    ),
                  ),
                );
              }
            } else {
              return Expanded(
                child: GenreGrid(
                  genreCards: [
                    GenreCard(
                      genreText: 'Alternative',
                      genreImage:
                          AssetImage("lib/assets/images/alternativeDARK.png"),
                      onPressed: () {
                        _searchController.text = 'Alternative';
                        _bloc.searchEvents('', genreFilter: 'Alternative');
                      },
                    ),
                    GenreCard(
                      genreText: 'Country',
                      genreImage:
                          AssetImage("lib/assets/images/countryDARK.png"),
                      onPressed: () {
                        _searchController.text = 'Country';
                        _bloc.searchEvents('', genreFilter: 'Country');
                      },
                    ),
                    GenreCard(
                      genreText: 'Rock',
                      genreImage: AssetImage("lib/assets/images/rockDARK.png"),
                      onPressed: () {
                        _searchController.text = 'Rock';
                        _bloc.searchEvents('', genreFilter: 'Rock');
                      },
                    ),
                    GenreCard(
                      genreText: 'Pop',
                      genreImage: AssetImage("lib/assets/images/popDARK.png"),
                      onPressed: () {
                        _searchController.text = 'Pop';
                        _bloc.searchEvents('', genreFilter: 'Pop');
                      },
                    ),
                    GenreCard(
                      genreText: 'Hip-Hop',
                      genreImage:
                          AssetImage("lib/assets/images/hiphopDARK.png"),
                      onPressed: () {
                        _searchController.text = 'Hip-Hop';
                        _bloc.searchEvents('', genreFilter: 'Hip-Hop');
                      },
                    ),
                    GenreCard(
                      genreText: 'Electronic',
                      genreImage:
                          AssetImage("lib/assets/images/electronicDARK.png"),
                      onPressed: () {
                        _searchController.text = 'Electronic';
                        _bloc.searchEvents('', genreFilter: 'Electronic');
                      },
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
