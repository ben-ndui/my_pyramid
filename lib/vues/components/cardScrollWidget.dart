import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_pyramid/model/constants.dart';

import 'data.dart';

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 40.0;
  var verticalInset = 8.0;

  CardScrollWidget(
    this.currentPage,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("yo ");
      },
      child: new AspectRatio(
        aspectRatio: widgetAspectRatio,
        child: LayoutBuilder(builder: (context, contraints) {
          var width = contraints.maxWidth;
          var height = contraints.maxHeight;

          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 2;

          List<Widget> cardList = [];

          for (var i = 0; i < images.length; i++) {
            var delta = i - currentPage;
            bool isOnRight = delta > 0;

            var start = padding +
                max(
                    primaryCardLeft -
                        horizontalInset * -delta * (isOnRight ? 15 : 1),
                    0.0);

            var cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0.0),
              bottom: padding + verticalInset * max(-delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: Center(
                child: Container(
                  //color: Colors.red,
                  child: AspectRatio(
                      aspectRatio: cardAspectRatio,
                      child: Stack(
                        clipBehavior: Clip.antiAlias,
                        fit: StackFit.loose,
                        children: [
                          Center(
                            child: Image.asset(
                              images[i],
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Image.asset(
                              "assets/video/home6.gif",
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      )),
                ),
              ),
            );
            cardList.add(cardItem);
          }
          return Stack(
            children: cardList,
          );
        }),
      ),
    );
  }
}
