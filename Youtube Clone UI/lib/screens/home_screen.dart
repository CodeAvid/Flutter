import 'package:flutter/material.dart';
import 'package:flutter_youtube_ui/widgets/widgets.dart';

import '../data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 60.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final video = videos[index];
                  return VideoCard(
                    video: video,
                  );
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
