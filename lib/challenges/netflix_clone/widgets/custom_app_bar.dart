import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/challenges/netflix_clone/widgets/widgets.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.scrollOffset = 0.0,
  }) : super(key: key);

  final double scrollOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(
        (scrollOffset / 350).clamp(0, 1).toDouble(),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 24.0,
      ),
      child: const Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(width: 12.0),
          _AppBarButton(
            title: 'TV Shows',
            onTap: () {},
          ),
          _AppBarButton(
            title: 'Movies',
            onTap: () {},
          ),
          _AppBarButton(
            title: 'My List',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(Assets.netflixLogo1),
                const SizedBox(width: 12.0),
                _AppBarButton(
                  title: 'Home',
                  onTap: () {},
                ),
                _AppBarButton(
                  title: 'TV Shows',
                  onTap: () {},
                ),
                _AppBarButton(
                  title: 'Movies',
                  onTap: () {},
                ),
                _AppBarButton(
                  title: 'Latests',
                  onTap: () {},
                ),
                _AppBarButton(
                  title: 'My List',
                  onTap: () {},
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.search),
                  iconSize: 28,
                  color: Colors.white,
                  onPressed: () {},
                ),
                _AppBarButton(
                  title: 'Kids',
                  onTap: () {},
                ),
                _AppBarButton(
                  title: 'DVD',
                  onTap: () {},
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.card_giftcard,
                  ),
                  iconSize: 28,
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.notifications,
                  ),
                  iconSize: 28,
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  const _AppBarButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
