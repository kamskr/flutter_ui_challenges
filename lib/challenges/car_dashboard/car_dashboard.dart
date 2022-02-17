import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class CarDashboard extends StatelessWidget {
  const CarDashboard({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const CarDashboard());

  @override
  Widget build(BuildContext context) {
    return const Dashboard();
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Car dashboard')),
      body: const Center(child: CustomSlider()),
    );
  }
}
