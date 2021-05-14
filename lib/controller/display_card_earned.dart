import 'package:flutter/material.dart';
import 'package:my_pyramid/model/CardDeck.dart';

class DisplayCardEarned extends StatelessWidget {
  final CardDeck card;
  final String text;
  const DisplayCardEarned({
    Key key,
    @required this.tour,
    @required this.card,
    @required this.text,
  }) : super(key: key);

  final int tour;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        content: Stack(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Center(child: card.img),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width / 4),
                      height: MediaQuery.of(context).size.width / 2,
                      color: Colors.white.withOpacity(0.8),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Text(
                              text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF3A3238),
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
