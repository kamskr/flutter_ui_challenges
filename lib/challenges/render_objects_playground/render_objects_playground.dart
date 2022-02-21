import 'package:flutter/material.dart';

class RenderObjectPlayground extends StatelessWidget {
  const RenderObjectPlayground({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const RenderObjectPlayground());

  @override
  Widget build(BuildContext context) {
    return const Dashboard();
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color(0xFF1F2430),
            Color(0xFF14161F),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: const Text('Car dashboard')),
        body: const Center(child: Text('Pg')),
      ),
    );
  }
}
