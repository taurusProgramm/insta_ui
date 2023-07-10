import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_ui/pages/image_pick.dart';
import 'package:instagram_ui/utils/avatar.dart';
import 'dart:math' as math;

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> with SingleTickerProviderStateMixin {
  bool isTapped = false;

  settingsTypeBottomSheet() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.67,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Container(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Настройки'),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                minLeadingWidth: 5,
              ),
              const ListTile(
                leading: Icon(Icons.timelapse),
                title: Text('Запланированный контент'),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                minLeadingWidth: 5,
              ),
              const ListTile(
                leading: Icon(Icons.stairs),
                title: Text('Статистика'),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                minLeadingWidth: 5,
              ),
              const ListTile(
                leading: Icon(Icons.stairs),
                title: Text('Статистика'),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                minLeadingWidth: 5,
              ),
              const ListTile(
                leading: Icon(Icons.stairs),
                title: Text('Статистика'),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                minLeadingWidth: 5,
              ),
              const ListTile(
                leading: Icon(Icons.stairs),
                title: Text('Статистика'),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                minLeadingWidth: 5,
              ),
              const ListTile(
                leading: Icon(Icons.stairs),
                title: Text('Статистика'),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                minLeadingWidth: 5,
              ),
              const ListTile(
                leading: Icon(Icons.stairs),
                title: Text('Статистика'),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                minLeadingWidth: 5,
              ),
              const ListTile(
                leading: Icon(Icons.stairs),
                title: Text('Статистика'),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                minLeadingWidth: 5,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                'taurus_theone',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              actions: [
                const ImageIcon(
                  AssetImage('images/more.png'),
                  size: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 30.0),
                  child: InkWell(
                      onTap: () {
                        settingsTypeBottomSheet();
                      },
                      child: const Icon(Icons.menu)),
                )
              ],
            ),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  pinned: true,
                  toolbarHeight: 10,
                  expandedHeight: isTapped ? 260 : 370,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: SafeArea(
                        child: Column(
                      children: [
                        // const SizedBox(
                        //   height: 70,
                        // ),
                        AvatarAndInfo(),
                        const About(),
                        const UpdateBotton(),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  isTapped = !isTapped;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Актуальное из историй',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  isTapped
                                      ? Transform.rotate(
                                          angle: 270 * math.pi / 180,
                                          child: const Icon(
                                            Icons.arrow_back_ios,
                                            size: 12,
                                          ),
                                        )
                                      : Transform.rotate(
                                          angle: 90 * math.pi / 180,
                                          child: const Icon(
                                            Icons.arrow_back_ios,
                                            size: 12,
                                          ),
                                        )
                                ],
                              ),
                            )),
                        isTapped
                            ? Container()
                            : Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                          'Сохраняйте свои лучшие истории в профиле'),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Stack(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .center,
                                                    children: [
                                                      Container(
                                                        height: 65,
                                                        width: 65,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 1,
                                                                ),
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                      const Icon(
                                                        Icons.add,
                                                        size: 35,
                                                      )
                                                    ]),
                                                const Text('Добавить')
                                              ],
                                            ),
                                            const GreyStory(),
                                            const GreyStory(),
                                            const GreyStory(),
                                            const GreyStory()
                                          ],
                                        ),
                                      )
                                    ]),
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
                  ),
                  bottom: const TabBar(tabs: [
                    Tab(
                      icon: ImageIcon(
                        AssetImage('images/grid.png'),
                        size: 24,
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.person),
                    )
                  ]),
                )
              ],
              body: TabBarView(children: [
                const CustomScrollView(
                  slivers: [SliverPhotoGrid(imageUrl: 'images/selfie.png')],
                ),
                Container(
                  color: Colors.amber,
                )
              ]),
            ),
          )),
    );
  }
}

class UpdateBotton extends StatelessWidget {
  const UpdateBotton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {},
            child: const Text('Редактировать профиль')),
      ),
    );
  }
}

class GridPhoto extends StatelessWidget {
  const GridPhoto({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 18,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.cover)),
          ),
        );
      },
    );
  }
}

class GreyStory extends StatelessWidget {
  const GreyStory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Container(
        height: 65,
        width: 65,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Валерий',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Soon')
            ],
          ),
        ],
      ),
    );
  }
}

class AvatarAndInfo extends StatefulWidget {
  const AvatarAndInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<AvatarAndInfo> createState() => _AvatarAndInfoState();
}

class _AvatarAndInfoState extends State<AvatarAndInfo> {
  Uint8List? imageGallery;
  File? imageCamera;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
            onTap: () async {
              final image = await Navigator.of(context).push(PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 100),
                reverseTransitionDuration: const Duration(milliseconds: 100),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const ImagePick(),
              ));
              if (image == null) return;
              setState(() {
                imageGallery = image;
              });
            },
            child: imageGallery != null
                ? CircleAvatar(
                    radius: 40,
                    backgroundImage: MemoryImage(imageGallery!),
                  )
                : const Avatar.large(url: 'images/me.png')),
        Column(
          children: const [
            Text('1',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text('Публикации')
          ],
        ),
        Column(
          children: const [
            Text('68',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text('Подписчики')
          ],
        ),
        Column(
          children: const [
            Text('64',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text('Подписки')
          ],
        ),
      ],
    );
  }
}

class SliverPhotoGrid extends StatelessWidget {
  const SliverPhotoGrid({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageUrl), fit: BoxFit.cover)),
            ),
          );
        },
        childCount: 20,
      ),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    );
  }
}
