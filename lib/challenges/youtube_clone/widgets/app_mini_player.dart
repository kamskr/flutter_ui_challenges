import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_challenges/challenges/youtube_clone/screens/video_screen.dart';
import 'package:miniplayer/miniplayer.dart';
import '../data/data.dart';
import '../screens/nav_screen.dart';

class AppMiniPlayer extends ConsumerWidget {
  const AppMiniPlayer({
    Key? key,
    required this.video,
  }) : super(key: key);

  static const double _playerMinHeight = 65;
  final Video video;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _miniPlayerController =
        ref.watch(miniplayerControllerProvider.state).state;

    return Miniplayer(
      controller: _miniPlayerController,
      minHeight: _playerMinHeight,
      maxHeight: MediaQuery.of(context).size.height,
      builder: (height, percentage) {
        if (height > _playerMinHeight + 50) {
          return const VideoScreen();
        }
        return Container(
          height: height,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(
                    video.thumbnailUrl,
                    height: _playerMinHeight - 4,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              video.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              video.author.username,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.play_arrow),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      ref.read(selectedVideoProvider.state).state = null;
                    },
                  ),
                ],
              ),
              const LinearProgressIndicator(
                value: 0.4,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              )
            ],
          ),
        );
      },
    );
  }
}
