import 'package:flutter/material.dart';
import 'package:instagram_ui/utils/avatar.dart';
import 'package:instagram_ui/utils/instaStory.dart';

class Story extends StatefulWidget {
  const Story({super.key, required this.text, required this.url});
  final String text;
  final String url;

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  bool isSeened = false;
  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      child: GestureDetector(
        onTapDown: (TapDownDetails details) {
          setState(() {
            x = details.globalPosition.dx;
            y = details.globalPosition.dy;
          });

          Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 200),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                scale: animation,
                alignment: FractionalOffset((x / width), (y / height)),
                child: child,
              );
            },
            pageBuilder: (context, animation, secondaryAnimation) => InstaStory(
              urlImage: widget.url,
              text: widget.text,
            ),
          ));
          setState(() {
            isSeened = true;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
          child: Column(
            children: [
              StoryCover(
                url: widget.url,
                isSeened: isSeened,
              ),
              const SizedBox(height: 5),
              Container(
                alignment: Alignment.center,
                width: 80,
                child: Text(
                  widget.text,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
