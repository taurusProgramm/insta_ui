import 'package:flutter/material.dart';
import 'package:instagram_ui/utils/avatar.dart';

class AddStory extends StatelessWidget {
  const AddStory({super.key, required this.text, required this.url});
  final String text;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
      child: Column(
        children: [
          Stack(alignment: AlignmentDirectional.bottomEnd, children: [
            Avatar(url: url),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 21,
                  width: 21,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
                Image.asset(
                  'images/plus.png',
                  height: 18,
                  width: 18,
                )
              ],
            )
          ]),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.center,
            width: 70,
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11),
            ),
          )
        ],
      ),
    );
  }
}
