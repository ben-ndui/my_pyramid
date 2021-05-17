import 'package:flutter/material.dart';
import 'package:my_pyramid/configs/config.dart';
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        child: Stack(
          children: [
            HomeBackgroundv2(homeBackURL: "assets/video/beer3.gif"),
            AnimeBackground(imageURL: "assets/video/home12.gif"),
            Container(
              alignment: Alignment.centerLeft,
              width: 300,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              padding: EdgeInsets.all(8.0),
              child: SwitchListTile(
                tileColor: Colors.white,
                activeColor: Colors.greenAccent,
                inactiveThumbColor: Colors.redAccent,
                title: Text("Liar Mode", textAlign: TextAlign.center, style: TextStyle(fontSize: 35),),
                subtitle: Text("Pyramid menteur ?", textAlign: TextAlign.center, style: TextStyle(fontSize: 30),),
                value: liarMode,
                onChanged: (bool value) {
                  setState(() {
                    liarMode = value;
                    print(liarMode);
                  });
                },
              ),
            ),
            Home(),
          ],
        ),
      ),
    );
  }
}
