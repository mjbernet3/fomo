import 'package:project_fomo/backend/services/AuthService.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  //Services
  Provider<AuthService>(
    create: (context) => AuthService(),
  ),
];
