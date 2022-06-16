import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String home = '/';
}

class AppRouter {
  final goRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const Text(''),
      ),
      GoRoute(
        path: '/page2',
        builder: (BuildContext context, GoRouterState state) => const Text(''),
      ),
    ],
    urlPathStrategy: UrlPathStrategy.path,
  );
}
