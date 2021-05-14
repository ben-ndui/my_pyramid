import 'package:flutter/material.dart';
import 'package:my_pyramid/model/Players.dart';
import 'package:my_pyramid/model/constants.dart';

class CheckMyDeck extends StatelessWidget {
  final List<Player> playersList;
  final int currPlayer;

  const CheckMyDeck({
    Key key,
    @required this.playersList,
    @required this.currPlayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: size.width / 18),
      child: FloatingActionButton.extended(
        onPressed: () {
          return showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: size.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.white,
                        ),
                        child: GridView.count(
                          crossAxisCount: 2,
                          children: List.generate(
                            this.playersList[this.currPlayer].deck.length,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: this
                                    .playersList[this.currPlayer]
                                    .deck[index]
                                    .img,
                              );
                            },
                          ),
                        ),
                      ),
                      Text("0", style: TextStyle(fontSize: 10,),),
                    ],
                  ),
                ),
              );
            },
          );
        },
        label: Text('Voir mes cartes'),
        icon: Icon(Icons.credit_card_rounded),
        backgroundColor: kMyLightBlueV2,
      ),
    );
  }
}
