import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_challenges/challenges/youtube_clone/screens/nav_screen.dart';
import 'package:miniplayer/miniplayer.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Consumer(
                builder: (context, ref, _) {
                  final _selectedVideo =
                      ref.watch(selectedVideoProvider.state).state!;

                  return SafeArea(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              _selectedVideo.thumbnailUrl,
                              height: 220,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            IconButton(
                              iconSize: 30,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              onPressed: () {
                                ref
                                    .read(miniplayerControllerProvider.state)
                                    .state
                                    .animateToHeight(state: PanelState.MIN);
                              },
                            ),
                          ],
                        ),
                        const LinearProgressIndicator(
                          value: 0.4,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
