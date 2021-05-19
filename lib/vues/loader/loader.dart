import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_pyramid/model/constants.dart';
import 'package:my_pyramid/vues/components/background.dart';
import 'package:my_pyramid/vues/splash/splashScreen.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  Future<void> setupWorldTime() async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(
            milliseconds: 1500,
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
            return SplashScreen();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: FutureBuilder(
        future: setupWorldTime(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return SplashScreen();
          }
          return Stack(children: [
            HomeBackgroundv2(homeBackURL: "assets/home/home.jpg"),
            AnimeBackground(
              imageURL: "assets/video/pyra.webp",
            ),
            SpinKitFadingCube(
              color: kMyLightWhite,
              size: 50.0,
            ),
          ]);
        },
      )),
    );
  }
}

class AnimeBackground extends StatelessWidget {
  final String imageURL;
  const AnimeBackground({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        imageURL,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
