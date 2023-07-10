import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.url, this.radius = 35});
  const Avatar.small({super.key, required this.url, this.radius = 20});
  const Avatar.bottomBar(
      {super.key, this.url = 'images/me.png', this.radius = 12});
  const Avatar.large({required this.url, this.radius = 40, super.key});
  final String url;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(url),
    );
  }
}

class AvatarCover extends StatelessWidget {
  const AvatarCover.bottomBar(
      {super.key, this.url = 'images/me.png', this.radius = 12});
  final String url;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: radius * 2 + 4,
          width: radius * 2 + 4,
          decoration:
              const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        ),
        CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage(url),
        )
      ],
    );
  }
}

class StoryCover extends StatelessWidget {
  const StoryCover(
      {super.key, required this.url, this.radius = 35, required this.isSeened});
  final String url;
  final double radius;
  final bool isSeened;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: radius * 2 + 10,
          width: radius * 2 + 10,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                  color: isSeened ? Colors.grey.shade300 : Colors.red,
                  width: 2)),
        ),
        CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage(url),
        )
      ],
    );
  }
}
