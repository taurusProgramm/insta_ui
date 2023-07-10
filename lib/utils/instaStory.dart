import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class InstaStory extends StatefulWidget {
  final String urlImage;
  final String text;
  const InstaStory({super.key, required this.urlImage, required this.text});
  @override
  _InstaStoryState createState() => _InstaStoryState();
}

class _InstaStoryState extends State<InstaStory> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            Navigator.pop(context);
          }
        },
        storyItems: [
          StoryItem.text(
            title: widget.text,
            backgroundColor: Colors.pink,
            textStyle: const TextStyle(
              fontFamily: 'Dancing',
              fontSize: 40,
            ),
          ),
          StoryItem.pageProviderImage(
            AssetImage(widget.urlImage),
            imageFit: BoxFit.fitWidth,
          ),
        ],
        onStoryShow: (s) {
          // print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
          Navigator.pop(context);
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}
