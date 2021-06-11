import 'package:flutter/material.dart';

import 'data.dart';

class CardGenerator extends StatefulWidget {
  const CardGenerator({
    Key? key,
    this.controller,
  }) : super(key: key);

  final PageController? controller;

  @override
  _CardGeneratorState createState() => _CardGeneratorState();
}

class _CardGeneratorState extends State<CardGenerator> {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //print("lala $index");
              switch (index) {
                case 2:
                  setState(() {});
                  break;
                default:
              }
            },
            child: Container(
              child: Text(""),
            ),
          );
        },
        controller: widget.controller,
        reverse: true,
      ),
    );
  }
}
