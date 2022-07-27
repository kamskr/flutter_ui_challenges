import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'screens/screens.dart';
export 'models/models.dart';
export 'data/data.dart';

class NetflixClone extends StatelessWidget {
  const NetflixClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Netflix Clone",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: DevicePreview(
        enabled: kIsWeb,
        builder: (context) => const NavScreen(),
      ),
    );
  }
}
