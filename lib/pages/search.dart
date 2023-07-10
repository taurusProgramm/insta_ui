import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'export.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isTapped = false;
  // late TabController _tabController;
  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(length: 2, vsync: this);
  // }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                pinned: true,
                title: const Text(
                  'taurus_theone',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                actions: const [
                  ImageIcon(
                    AssetImage('images/more.png'),
                    size: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Icon(Icons.menu),
                  )
                ],
                expandedHeight: isTapped ? 330 : 440,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: SafeArea(
                      child: Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      const AvatarAndInfo(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Актуальное из историй',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: Colors.black,
                                                            width: 1,
                                                          ),
                                                          color: Colors.white),
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
        ));
  }
}
