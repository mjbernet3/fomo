import 'package:flutter/material.dart';
import 'package:project_fomo/blocs/search_bloc.dart';
import 'package:project_fomo/components/search/search_body.dart';
import 'package:project_fomo/services/search_service.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  static const String pageRoute = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Provider<SearchBloc>(
            create: (context) => SearchBloc(
              searchService: Provider.of<SearchService>(
                context,
                listen: false,
              ),
            ),
            dispose: (context, bloc) => bloc.dispose(),
            child: SearchBody(),
          ),
        ),
      ),
    );
  }
}
