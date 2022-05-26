import 'package:flutter/material.dart';

import 'widgets/avatar_animation.dart';

class ExplicitAnimations extends StatelessWidget {
  const ExplicitAnimations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explicit Animations')),
      body: ColoredBox(
        color: Colors.blue,
        child: Center(child: AvatarAnimation()),
      ),
    );
  }
}
