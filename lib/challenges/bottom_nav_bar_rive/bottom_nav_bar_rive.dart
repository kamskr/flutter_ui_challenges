import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

import '../../widgets/view_wrapper.dart';

class BottomNavBarRive extends StatefulWidget {
  const BottomNavBarRive({Key? key}) : super(key: key);

  @override
  State<BottomNavBarRive> createState() => _BottomNavBarRiveState();
}

class _BottomNavBarRiveState extends State<BottomNavBarRive> {
  List<SMIInput<bool>?> inputs = [];
  List<Artboard> artboards = [];
  List<String> assetPaths = [
    'assets/bottom_nav_bar_rive/fire.riv',
    'assets/bottom_nav_bar_rive/land.riv',
    'assets/bottom_nav_bar_rive/mediation.riv',
    'assets/bottom_nav_bar_rive/composer.riv',
    'assets/bottom_nav_bar_rive/profile.riv',
  ];
  int currentActiveIndex = 0;

  initializeArtboard() async {
    for (var path in assetPaths) {
      final data = await rootBundle.load(path);
      final file = RiveFile.import(data);

      final artboard = file.mainArtboard;
      SMIInput<bool>? input;
      final controller =
          StateMachineController.fromArtboard(artboard, 'State Machine 1');
      if (controller != null) {
        artboard.addController(controller);
        input = controller.findInput<bool>('status');
        input!.value = true;
      }
      inputs.add(input);
      artboards.add(artboard);
    }
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await initializeArtboard();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(
      title: 'BottomNavBar Animation',
      child: Center(
        child: ColoredBox(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: artboards.map((artboard) {
              final index = artboards.indexOf(artboard);
              return ButtomAppBarItem(
                artboard: artboard,
                currentIndex: currentActiveIndex,
                tabIndex: index,
                input: inputs[index],
                onTap: () {
                  setState(() {
                    currentActiveIndex = index;
                  });
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class ButtomAppBarItem extends StatelessWidget {
  const ButtomAppBarItem({
    Key? key,
    this.artboard,
    required this.onTap,
    required this.currentIndex,
    required this.tabIndex,
    required this.input,
  }) : super(key: key);

  final Artboard? artboard;
  final VoidCallback onTap;
  final int currentIndex;
  final int tabIndex;
  final SMIInput<bool>? input;

  @override
  Widget build(BuildContext context) {
    if (input != null) {
      input!.value = currentIndex == tabIndex;
    }
    return SizedBox(
      width: 100,
      height: 100,
      child: GestureDetector(
        onTap: onTap,
        child: artboard == null
            ? const SizedBox()
            : Rive(
                artboard: artboard!,
              ),
      ),
    );
  }
}
