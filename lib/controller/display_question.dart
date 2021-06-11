import 'package:flutter/material.dart';
import 'package:my_pyramid/model/CardDeck.dart';
import 'package:my_pyramid/model/Players.dart';

class DisplayQuestion extends StatelessWidget {
  final CardDeck card;
  final String? text;
  final String? description;
  final Player? randomPlayer;

  const DisplayQuestion({
    Key? key,
    required this.card,
    required this.text,
    required this.description,
    required this.randomPlayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: AlertDialog(
        scrollable: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        content: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(child: card.img),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white,boxShadow: [BoxShadow(color: Colors.grey, offset: Offset.infinite, blurRadius: 1.0, spreadRadius: 1.0), BoxShadow(color: Colors.grey, offset: Offset.infinite, blurRadius: 1.0, spreadRadius: 1.0)]),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          child: Column(
                            children: [
                              Text(
                                    '🏌🏻‍♂️'+text! +'🏌🏻‍♂️'
                                    "\n\n" +
                                        "${randomPlayer!.name} " +
                                        "\n" +
                                    " " ,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 20,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                description!,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
