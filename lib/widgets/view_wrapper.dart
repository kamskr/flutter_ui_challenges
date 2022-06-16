import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/routing/app_router.dart';
import 'package:go_router/go_router.dart';

class ViewWrapper extends StatelessWidget {
  const ViewWrapper({
    Key? key,
    required this.title,
    required this.child,
    this.backgroundColor,
  }) : super(key: key);

  final String title;
  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final showDevicePreview =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width >
            480;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => context.go(AppRoutes.home),
        ),
        title: Text(title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: DevicePreview(
        enabled: showDevicePreview,
        builder: (context) => child,
      ),
    );
  }
}
