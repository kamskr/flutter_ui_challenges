import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_challenges/challenges/challenges.dart';
import 'package:flutter_ui_challenges/widgets/view_wrapper.dart';

class BrainBobHome extends StatelessWidget {
  const BrainBobHome({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const BrainBobHome());

  @override
  Widget build(BuildContext context) {
    return const ViewWrapper(
      hideHomeButton: true,
      title: "BrainBob Home",
      child: BrainBobHomeView(),
    );
  }
}

class BrainBobHomeView extends StatelessWidget {
  const BrainBobHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.grid_view_rounded),
          onPressed: () {},
        ),
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark),
          )
        ],
      ),
      body: const _HomeBody(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          _TItle(),
          SizedBox(
            height: 30,
          ),
          _CategoryButtons(),
          SizedBox(
            height: 20,
          ),
          _VocabularyBox(),
          SizedBox(
            height: 200,
          ),
          Text('Test'),
          SizedBox(
            height: 200,
          ),
          Text('Test'),
          SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }
}

class _VocabularyBox extends StatelessWidget {
  const _VocabularyBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors["primary"],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Vocabulary',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Listen 20 new words',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 42),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: SizedBox(
                      width: 62,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text('Start'),
                          SizedBox(width: 8),
                          Icon(Icons.play_circle, size: 20),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SvgPicture.asset(
                "assets/listening_illustration.svg",
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryButtons extends StatelessWidget {
  const _CategoryButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: const [
            SizedBox(width: 15),
            _CategoryButton(title: 'Brainstorm'),
            SizedBox(width: 15),
            _CategoryButton(
              title: 'Books',
              reverseColors: true,
            ),
            SizedBox(width: 15),
            _CategoryButton(
              title: 'Video',
              reverseColors: true,
            ),
            SizedBox(width: 15),
            _CategoryButton(
              title: 'Music',
              reverseColors: true,
            ),
            SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    Key? key,
    required this.title,
    this.reverseColors = false,
  }) : super(key: key);

  final String title;
  final bool? reverseColors;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: reverseColors == true ? colors['background'] : Colors.black,
        onPrimary: reverseColors == true ? Colors.black : Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 25,
        ),
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: () {},
      child: Text(title),
    );
  }
}

class _TItle extends StatelessWidget {
  const _TItle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Choose what',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'to learn today?',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
