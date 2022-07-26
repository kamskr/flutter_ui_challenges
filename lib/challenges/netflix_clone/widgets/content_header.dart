import 'package:flutter/material.dart';

import '../models/content_model.dart';
import 'widgets.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({
    Key? key,
    required this.featuredContent,
  }) : super(key: key);

  final Content featuredContent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250,
            child: Image.asset(
              featuredContent.titleImageUrl!,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: 'List',
                onTap: () {},
              ),
              const _PlayButton(),
              VerticalIconButton(
                icon: Icons.info_outline,
                title: 'Info',
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        primary: Colors.black,
        padding: const EdgeInsets.fromLTRB(15, 5, 20, 5),
      ),
      label: const Text(
        'Play',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
      ),
      onPressed: () {},
    );
  }
}
