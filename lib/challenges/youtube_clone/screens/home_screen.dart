import 'package:flutter/material.dart';

import '../data/data.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 60),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final video = videos[index];

                  return VideoCard(video: video);
                },
                childCount: videos.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
