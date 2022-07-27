import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_challenges/challenges/netflix_clone/cubits/app_bar_cubit.dart';
import 'package:flutter_ui_challenges/challenges/netflix_clone/screens/screens.dart';
import 'package:flutter_ui_challenges/challenges/netflix_clone/widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(key: PageStorageKey('homeScreen')),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  final Map<String, IconData> _icons = {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Downloads': Icons.file_download,
    'More': Icons.menu,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AppBarCubit(),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
              backgroundColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              selectedItemColor: Colors.white,
              selectedFontSize: 11,
              unselectedItemColor: Colors.grey,
              unselectedFontSize: 11,
              onTap: (index) => setState(() {
                _currentIndex = index;
              }),
              items: [
                ..._icons
                    .map(
                      (title, icon) =>
                          MapEntry<String, BottomNavigationBarItem>(
                        title,
                        BottomNavigationBarItem(
                          icon: Icon(
                            icon,
                            size: 30,
                          ),
                          label: title,
                        ),
                      ),
                    )
                    .values
                    .toList()
              ],
            )
          : null,
    );
  }
}
