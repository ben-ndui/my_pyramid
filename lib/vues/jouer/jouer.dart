import 'package:flutter/material.dart';

import 'components/jouerComponents/jouer_appBar.dart';
import 'components/jouerComponents/jouer_body.dart';

class JouerScreen extends StatefulWidget {
  @override
  _JouerScreenState createState() => _JouerScreenState();
}

class _JouerScreenState extends State<JouerScreen> {
  static double xOffset = 0;
  static double yOffset = 0;
  static double scaleFactor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          JouerTopBar(),
          JouerBody(),
        ],
      ),
    );
  }
}
