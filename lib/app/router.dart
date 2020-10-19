import 'package:auto_route/auto_route_annotations.dart';
import 'package:cmbt/ui/views/home/home_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: HomeView, initial: true),
  ],
)
class $Router {}
