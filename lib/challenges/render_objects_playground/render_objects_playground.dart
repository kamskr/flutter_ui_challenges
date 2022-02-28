import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class RenderObjectPlayground extends StatelessWidget {
  const RenderObjectPlayground({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const RenderObjectPlayground());

  @override
  Widget build(BuildContext context) {
    return const Playground();
  }
}

class Playground extends StatelessWidget {
  const Playground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomColumn(
        children: const [
          CustomExpanded(
            flex: 1,
            child: SizedBox(),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Flutter render objects playground',
              style: TextStyle(fontSize: 32),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'A place to test out RenderObjects',
              textAlign: TextAlign.center,
            ),
          ),
          CustomExpanded(
            flex: 2,
            child: SizedBox(),
          ),
          // Spacer(),
        ],
      ),
    );
  }
}
