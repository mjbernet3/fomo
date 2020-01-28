import 'package:project_fomo/backend/services/authentication.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  //Services
  Provider<Authentication>(
    create: (context) => Authentication(),
  ),
];
