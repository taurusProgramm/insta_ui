import 'package:flutter/material.dart';
import 'package:instagram_ui/models/video_model.dart';
import 'package:instagram_ui/widgets/video_one.dart';

import 'package:story_view/story_view.dart';
import 'dart:math';
import 'export.dart';

class Reels extends StatefulWidget {
  @override
  _ReelsState createState() => _ReelsState();
}

class _ReelsState extends State<Reels> {
  final controller = PageController(initialPage: 0);

  List videos = [
    Video(url: 'assets/videos/kizaru.mp4', name: 'tommyhellatrigger'),
    Video(url: 'assets/videos/11.mp4', name: 'FunnyVideos'),
    Video(url: 'assets/videos/22.mp4', name: 'TheCats'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.black,
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  )
                ],
                title: const TabBar(
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  labelStyle: TextStyle(fontSize: 16),
                  splashFactory: NoSplash.splashFactory,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      text: 'Подписки',
                    ),
                    Tab(
                      text: 'Рекомендации',
                    )
                  ],
                )),
            body: PageView.builder(
              scrollDirection: Axis.vertical,
              // itemCount: videoUrl.length,
              itemBuilder: (context, index) {
                // var i = Random().nextInt(3);
                // index % videoUrl.length
                return VideoOne(
                  url: videos[index % videos.length].url,
                  name: videos[index % videos.length].name,
                );
              },
            )),
      ),
    );
  }
}
