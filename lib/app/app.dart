import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/routing/app_router.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  App({
    Key? key,
  })  : _router = AppRouter().goRouter,
        super(key: key);

  final GoRouter _router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
