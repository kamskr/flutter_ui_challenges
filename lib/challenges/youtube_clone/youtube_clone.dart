import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './screens/nav_screen.dart';

export 'data/data.dart';

class YoutubeClone extends StatelessWidget {
  const YoutubeClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ProviderScope(
      child: MaterialApp(
        title: 'YouTube Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.white),
        ),
        home: DevicePreview(
          enabled: MediaQuery.of(context).size.width > 800,
          builder: (_) => const NavScreen(),
        ),
      ),
    );
  }
}
