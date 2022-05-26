import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/widgets/widgets.dart';

import 'implicit_animations/implicit_animations.dart';

class Animations extends StatelessWidget {
  const Animations({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const Animations());

  static const Map<String, Widget> _tileTitles = {
    "Implicit": ImplicitAnimationsPage(),
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
