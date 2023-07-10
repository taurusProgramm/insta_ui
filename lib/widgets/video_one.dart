// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:marquee/marquee.dart';
import 'package:expandable_text/expandable_text.dart';

class VideoOne extends StatefulWidget {
  const VideoOne({super.key, required this.url, required this.name});
  final String url;
  final String name;

  @override
  State<VideoOne> createState() => _VideoOneState();
}

class _VideoOneState extends State<VideoOne> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.url);
    _controller.initialize().then((_) {
      setState(() {});
      _controller.play();
      _controller.setLooping(true);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double height = 20;
    return Scaffold(
      // backgroundColor: Colors.pink,
      body: Stack(children: [
        GestureDetector(
            onTap: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: VideoPlayer(_controller)),
        Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.play_arrow,
            color:
                Colors.white.withOpacity(_controller.value.isPlaying ? 0 : 0.5),
            size: 60,
          ),
        ),
        BottomInfo(
          name: widget.name,
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
              colors: VideoProgressColors(playedColor: Colors.grey.shade800),
            )),
        RightSideInfo(
          height: height,
          urlImage: 'kizaru',
          isPlaying: _controller.value.isPlaying ? true : false,
        )
      ]),
    );
  }
}

class RightSideInfo extends StatefulWidget {
  const RightSideInfo({
    Key? key,
    required this.height,
    required this.urlImage,
    required this.isPlaying,
  }) : super(key: key);

  final double height;
  final String urlImage;
  final bool isPlaying;

  @override
  State<RightSideInfo> createState() => _RightSideInfoState();
}

class _RightSideInfoState extends State<RightSideInfo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animationController.repeat();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isPlaying) {
      setState(() {
        _animationController.reset();
        _animationController.repeat();
      });
    } else {
      setState(() {
        _animationController.stop();
      });
    }
    return Align(
      alignment: Alignment(1, 1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/${widget.urlImage}.png'))),
                ),
                Positioned(
                  bottom: -8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: ColorFiltered(
                      colorFilter:
                          ColorFilter.mode(Colors.red, BlendMode.color),
                      child: Image.asset(
                        'images/plus.png',
                        height: 18,
                        width: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: widget.height * 1.2,
            ),
            ImageIcon(
              AssetImage('images/heart_full.png'),
              color: Colors.white,
              size: 28,
            ),
            Text(
              '266,3k',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: widget.height,
            ),
            Icon(
              Icons.comment,
              color: Colors.white,
              size: 28,
            ),
            Text(
              '514',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: widget.height,
            ),
            ImageIcon(
              AssetImage('images/mark_fill.png'),
              color: Colors.white,
              size: 28,
            ),
            Text(
              '19,0k',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: widget.height,
            ),
            ImageIcon(
              AssetImage('images/share_black.png'),
              size: 28,
              color: Colors.white,
            ),
            Text(
              '1025',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: widget.height,
            ),
            AnimatedBuilder(
                animation: _animationController,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'images/vinyl.png',
                      height: 55,
                      width: 55,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                              image:
                                  AssetImage('images/${widget.urlImage}.png'))),
                    ),
                  ],
                ),
                builder: (context, child) {
                  return Transform.rotate(
                      angle: 2 * pi * _animationController.value, child: child);
                })
          ],
        ),
      ),
    );
  }
}

class BottomInfo extends StatelessWidget {
  const BottomInfo({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            ExpandableText(
                'Очень очень очень очень очень очень очень очень очень очень очень очень очень очень большое описание #fyp #filter',
                expandText: 'Развернуть',
                collapseText: 'Скрыть',
                expandOnTextTap: true,
                collapseOnTextTap: true,
                maxLines: 2,
                prefixText: '',
                prefixStyle: TextStyle(fontWeight: FontWeight.normal),
                hashtagStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal),
                linkColor: Colors.grey.shade300),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(
                  CupertinoIcons.music_note_2,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: 20,
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: Marquee(
                    text: 'Оригинальный звук - morgenshtern cadillac ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
