import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBackground extends StatelessWidget {
  final String? homeBackURL;
  const HomeBackground({
    Key? key,
    required this.homeBackURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: SvgPicture.asset(homeBackURL!, fit: BoxFit.cover,),
    );
  }
}

class HomeBackgroundv2 extends StatelessWidget {
  final String? homeBackURL;
  const HomeBackgroundv2({
    Key? key,
    required this.homeBackURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Image.asset(homeBackURL!, fit: BoxFit.cover,),
    );
  }
}
