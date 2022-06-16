import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/routing/app_router.dart';
import 'package:go_router/go_router.dart';

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

class Playground extends StatefulWidget {
  const Playground({Key? key}) : super(key: key);

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => context.go(AppRoutes.home),
        ),
        title: const Text('Render objects playground'),
      ),
      body: Stack(
        children: [
          CustomColumn(
            alignment: CustomColumnAlignment.center,
            children: [
              const CustomExpanded(
                flex: 2,
                child: SizedBox(),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Flutter render objects playground',
                  style: TextStyle(fontSize: 32),
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'A place to test out RenderObjects',
                  textAlign: TextAlign.center,
                ),
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return CustomBox(
                    onTap: () {
                      if (_controller.isAnimating) {
                        _controller.stop();
                        return;
                      }
                      _controller.repeat();
                    },
                    flex: 3,
                    color: const Color(0xFFa83291),
                    rotation: _controller.value * 2 * pi,
                  );
                },
              ),
            ],
          ),
          const CustomProxy(
            child: SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
