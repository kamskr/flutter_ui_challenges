import 'package:flutter/material.dart';

import 'challenges/challenges.dart';
import 'widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const Map<String, Widget> _tileTitles = {
    'Animations': Animations(),
    'Animated Clock': AnimatedClock(),
    'Render Object Playground': RenderObjectPlayground(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter UI Challenges',
        ),
      ),
      body: const ListScreen(
        tileTitles: _tileTitles,
      ),
    );
  }
}
