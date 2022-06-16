import 'package:flutter/widgets.dart';
import 'package:flutter_ui_challenges/challenges/challenges.dart';
import 'package:flutter_ui_challenges/home/home.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String home = '/';
  static const String animatedClock = '/animated-clock';
  static const String renderObjectPlayground = '/render-object-playground';
  static const String brainBob = '/brain-bob';
}

class AppRouter {
  final goRouter = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (BuildContext context, GoRouterState state) => const Home(),
      ),
      GoRoute(
        path: AppRoutes.animatedClock,
        builder: (BuildContext context, GoRouterState state) =>
            const AnimatedClock(),
      ),
      GoRoute(
        path: AppRoutes.renderObjectPlayground,
        builder: (BuildContext context, GoRouterState state) =>
            const RenderObjectPlayground(),
      ),
      GoRoute(
        path: AppRoutes.brainBob,
        builder: (BuildContext context, GoRouterState state) =>
            const BrainBob(),
      ),
    ],
    urlPathStrategy: UrlPathStrategy.path,
  );
}
