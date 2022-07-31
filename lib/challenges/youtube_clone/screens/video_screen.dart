import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_challenges/challenges/challenges.dart';
import 'package:flutter_ui_challenges/challenges/youtube_clone/screens/nav_screen.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../widgets/widgets.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: CustomScrollView(
            controller: _scrollController,
            shrinkWrap: true,
            slivers: [
              SliverPinnedHeader(
                child: Consumer(
                  builder: (context, ref, _) {
                    final _selectedVideo =
                        ref.watch(selectedVideoProvider.state).state!;

                    return Column(
                      children: [
                        Container(
                          color: Colors.black,
                          height: MediaQuery.of(context).padding.top,
                        ),
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
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Consumer(
                  builder: (context, ref, _) {
                    final _selectedVideo =
                        ref.watch(selectedVideoProvider.state).state!;

                    return VideoInfo(video: _selectedVideo);
                  },
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final video = suggestedVideos[index];
                    return VideoCard(
                      video: video,
                      hasPadding: true,
                      onTap: () => _scrollController!.animateTo(
                        0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                      ),
                    );
                  },
                  childCount: suggestedVideos.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
