import 'package:flutter/material.dart';
import 'package:my_pyramid/vues/components/background.dart';
import 'package:my_pyramid/vues/loader/loader.dart';

import '../home_screen.dart';

class Inter extends StatefulWidget {
  const Inter({
    Key key,
  }) : super(key: key);

  @override
  _InterState createState() => _InterState();
}

class _InterState extends State<Inter> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      child: Stack(
        children: [
          HomeBackgroundv2(homeBackURL: "assets/video/beer3.gif"),
          AnimeBackground(imageURL: "assets/video/home6.gif"),
          Home(),
        ],
      ),
    );
  }
}
