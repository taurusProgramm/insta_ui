import 'package:flutter/material.dart';
import 'package:instagram_ui/utils/avatar.dart';

class Post extends StatefulWidget {
  const Post({super.key, required this.name, required this.url});
  final String name;
  final String url;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool _isFavoritePressed = false;
  bool _isLikePressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Avatar.small(url: widget.url),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text('Обводный канал')
                      ],
                    ),
                  )
                ]),
                const ImageIcon(
                  AssetImage("images/dot.png"),
                  size: 20,
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onDoubleTap: () {
              setState(() {
                _isLikePressed = true;
              });
            },
            child: Container(
              height: 400,
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isLikePressed = !_isLikePressed;
                        });
                      },
                      child: _isLikePressed
                          ? const ImageIcon(
                              AssetImage('images/heart_red.png'),
                              size: 24,
                              color: Colors.red,
                            )
                          : const ImageIcon(
                              AssetImage('images/heart.png'),
                              size: 24,
                            ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: ImageIcon(
                        AssetImage('images/comment.png'),
                        size: 35,
                      ),
                    ),
                    const ImageIcon(
                      AssetImage('images/direct-instagram.png'),
                      size: 24,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _isFavoritePressed = !_isFavoritePressed;
                    });
                  },
                  child: _isFavoritePressed
                      ? const ImageIcon(
                          AssetImage('images/mark_fill.png'),
                          size: 24,
                        )
                      : const ImageIcon(
                          AssetImage('images/mark.png'),
                          size: 24,
                        ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(text: 'Нравится '),
                  TextSpan(
                      text: 'kizaru',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: ' и другим',
                  ),
                ])),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                      text: widget.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(
                      text:
                          ' Съешь еще этих мягких фрацузских булок, да выпей чаю. Съешь еще этих мягких фрацузских булок, да выпей чаю.')
                ])),
          )
        ],
      ),
    );
  }
}
