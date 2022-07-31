import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routing/app_router.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const Map<String, String> _tileTitles = {
    'Animated Clock': AppRoutes.animatedClock,
    'RenderObject Playground': AppRoutes.renderObjectPlayground,
    'BrainBob': AppRoutes.brainBob,
    'BottomNavBar animation with Rive': AppRoutes.bottomNavBarRive,
    'Netflix Clone': AppRoutes.netflixClone,
    'Youtube Clone': AppRoutes.youtubeClone,
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

class ListScreen extends StatelessWidget {
  const ListScreen({required this.tileTitles, Key? key}) : super(key: key);

  final Map<String, String> tileTitles;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: tileTitles.entries
            .map(
              (entry) => ListTile(
                onTap: () => context.go(entry.value),
                title: Text(entry.key),
              ),
            )
            .toList(),
      ),
    );
  }
}
