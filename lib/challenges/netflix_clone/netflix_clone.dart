import 'package:flutter/material.dart';

class NetflixClone extends StatelessWidget {
  const NetflixClone({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const NetflixClone());

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('netflix clone'),
    );
  }
}
