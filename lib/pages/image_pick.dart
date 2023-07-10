import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class ImagePick extends StatefulWidget {
  const ImagePick({super.key});

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  List<Widget> imageList = [];
  int currentPage = 0;
  int? lastPage;
  bool isScrolled = false;

  handleScrollEvent(ScrollNotification scroll) {
    // if (scroll.metrics.pixels >= 500) {
    //   setState(() {
    //     isScrolled = true;
    //   });
    // } else if (scroll.metrics.pixels <= 500) {
    //   setState(() {
    //     isScrolled = false;
    //   });
    // }
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent <= .33) return;
    if (currentPage == lastPage) return;
    fetchAllImages();
  }

  fetchAllImages() async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) {
      return PhotoManager.openSetting();
    }
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.image, onlyAll: true);

    List<AssetEntity> photos =
        await albums[0].getAssetListPaged(page: currentPage, size: 24);

    List<Widget> temp = [];
    // print(albums[0]);
    for (var asset in photos) {
      temp.add(FutureBuilder(
        future: asset.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return InkWell(
              onTap: () => Navigator.pop(context, snapshot.data),
              borderRadius: BorderRadius.circular(5),
              splashFactory: NoSplash.splashFactory,
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: MemoryImage(snapshot.data as Uint8List),
                        fit: BoxFit.cover)),
              ),
            );
          }
          return const SizedBox();
        },
      ));
    }
    setState(() {
      imageList.addAll(temp);
      currentPage++;
    });
  }

  @override
  void initState() {
    fetchAllImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: isScrolled
            ? const Text(
                'Куда ты листаешь',
                style: TextStyle(color: Colors.white),
              )
            : const Text(
                'Дополнить историю',
                style: TextStyle(color: Colors.white),
              ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scroll) {
          handleScrollEvent(scroll);
          return true;
        },
        child: GridView.builder(
            itemCount: imageList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (_, index) {
              return imageList[index];
            }),
      ),
    );
  }
}
