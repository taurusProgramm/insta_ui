import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  double x = 0;
  double y = 0;
  double height = 300;
  double width = 300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GestureDetector(
        onTap: () => print('tapped!'),
        onTapDown: (TapDownDetails details) {
          setState(() {
            x = details.localPosition.dx;
            y = details.localPosition.dy;
          });
        },
        child: Stack(
          alignment: FractionalOffset((x / width), y / height),
          children: [
            Container(
              height: height,
              width: width,
              color: Colors.amber,
            ),
            Container(
              height: 25,
              width: 25,
              color: Colors.pink,
            ),
          ],
        ),
        // onTapUp: (TapUpDetails details) => _onTapUp(details),
      ),
    ));
  }

  _onTapDown(TapDownDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    // or user the local position method to get the offset
    print(details.localPosition);
    print("tap down " + x.toString() + ", " + y.toString());
  }

  _onTapUp(TapUpDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    // or user the local position method to get the offset
    print(details.localPosition);
    print("tap up " + x.toString() + ", " + y.toString());
  }
}
