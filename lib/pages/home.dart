import 'package:flutter/material.dart';
import 'package:instagram_ui/utils/add_story.dart';
import 'package:instagram_ui/utils/post.dart';
import 'package:instagram_ui/utils/stories.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // const Home({super.key});
  List<String> people = [
    'therock',
    'tommyhellatrigger',
    'morgen_shtern',
    'norimyxxxo',
    'face'
  ];

  List<String> url = [
    'images/therock.png',
    'images/kizaru.png',
    'images/morgen.png',
    'images/oxxxy.png',
    'images/face.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ImageIcon(
          AssetImage('images/Instagram.png'),
          size: 115,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          ImageIcon(
            AssetImage('images/more.png'),
            size: 24,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 20.0),
            child: ImageIcon(
              AssetImage('images/icon-chat.png'),
              size: 24,
            ),
          )
        ],
      ),
      body: ListView(children: [
        SizedBox(
          height: 115,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            const AddStory(text: 'Ваша история', url: 'images/me.png'),
            ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: people.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Story(
                      text: people[index],
                      url: url[index],
                    )),
          ]),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: people.length,
          itemBuilder: (context, index) => Post(
            name: people[index],
            url: url[index],
          ),
        )
      ]),
    );
  }
}
