import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_pyramid/model/Splash.dart';
import 'package:my_pyramid/vues/intermediaire/inter.dart';

class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Container(
          width: size.width,
          height: size.height,
          child: PageView.builder(
            itemCount: splashList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                  ),
                  child: Image.asset(
                    "assets/splashScreens/${splashList[index].name}.jpg",
                    width: size.width,
                    height: size.height,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(bottom: 130),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(
                    milliseconds: 1000,
                  ),
                  transitionsBuilder: (context, animation, animationTime, child) {
                    animation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.elasticInOut,
                    );
                    return ScaleTransition(
                      alignment: Alignment.center,
                      scale: animation,
                      child: child,
                    );
                  },
                  pageBuilder: (context, animation, animationTime) {
                    return Inter();
                  },
                ),
              );
            },
            child: Container(
              width: 100,
              child: Text(
                "Jouer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
