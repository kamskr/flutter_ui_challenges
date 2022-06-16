import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/widgets/view_wrapper.dart';

final colors = {
  "primary": const Color(0xff5943BE),
  "background": const Color(0xffF7F5FF),
};

class BrainBob extends StatelessWidget {
  const BrainBob({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const BrainBob());

  @override
  Widget build(BuildContext context) {
    return const ViewWrapper(
      title: 'BrainBob',
      child: BrainBobView(),
    );
  }
}

class BrainBobView extends StatelessWidget {
  const BrainBobView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          _Background(),
          _WelcomeView(),
        ],
      ),
    );
  }
}

class _WelcomeView extends StatelessWidget {
  const _WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _Logo(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: colors["primary"],
            shape: BoxShape.circle,
          ),
          child: const SizedBox(
            height: 50,
            width: 50,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 12,
          ),
          child: RichText(
            text: TextSpan(
              text: "Br",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' ainBob',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: colors['primary'],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            flex: 3,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
          Expanded(
            child: OverflowBox(
              maxHeight: 2000,
              maxWidth: 2000,
              child: SizedBox(
                height: 800,
                width: 2000,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors["background"],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
