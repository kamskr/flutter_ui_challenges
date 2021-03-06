import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_challenges/challenges/brain_bob/brain_bob_home.dart';
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
    return Stack(
      children: const [
        _Background(),
        _WelcomeView(),
      ],
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
            children: [
              const _Logo(),
              const SizedBox(height: 20),
              SvgPicture.asset(
                'assets/bob_study.svg',
                height: 240,
              ),
              const SizedBox(height: 20),
              const _Header(),
              const SizedBox(height: 20),
              const _SubHeader(),
              const SizedBox(height: 40),
              const _StartButton()
            ],
          ),
        ),
      ),
    );
  }
}

class _StartButton extends StatelessWidget {
  const _StartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: colors["primary"],
        padding: const EdgeInsets.symmetric(
          horizontal: 60,
          vertical: 30,
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 0,
      ),
      onPressed: () {
        Navigator.of(context).push(BrainBobHome.route());
      },
      child: const Text("Let's start"),
    );
  }
}

class _SubHeader extends StatelessWidget {
  const _SubHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        'Listen to stories, watch videos and '
        'improve your language with BrainBob',
        style: TextStyle(
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        'Be ready to learn English easily',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
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
