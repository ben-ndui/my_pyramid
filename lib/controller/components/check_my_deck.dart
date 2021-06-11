import 'package:flutter/material.dart';
import 'package:my_pyramid/configs/config.dart';
import 'package:my_pyramid/model/Players.dart';
import 'package:my_pyramid/model/constants.dart';

class CheckMyDeck extends StatelessWidget {
  final List<Player?>? playersList;
  final int? currPlayer;

  const CheckMyDeck({
    Key? key,
    required this.playersList,
    required this.currPlayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: size.width / 18),
      child: FloatingActionButton.extended(
        onPressed: () {
          showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              /// Si le mode menteur est activé
              /// Seul le joueur en cours voit ses cartes
              /// Sinon tout le monde voit les cartes de tout le monde
              if(liarMode == false){
                /// Lors du clic sur la zone, ca disparait
                return GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  /// Lors du clic sur la zone, ca disparait
                  child: Center(
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 5.0,
                          crossAxisCount: 1,
                        ),
                        itemCount: this.playersList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.all(30.0),
                            child: Stack(
                              children: [
                                Text("Carte de : ${this.playersList![index]!.name}", style: TextStyle(fontSize: 50, color: Colors.white),),
                                SizedBox(width: MediaQuery.of(context).size.width, height: 20.0,),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  margin: EdgeInsets.only(top: 50),
                                  child: GridView.builder(
                                    itemCount: this.playersList![index]!.deck.length,
                                    itemBuilder: (BuildContext context, int index2) {
                                      return Center(
                                          child: Image(image: this.playersList![index]!.deck[index2]!.img!.image,)
                                      );
                                  },
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 10.0,
                                      crossAxisSpacing: 5.0,
                                      crossAxisCount: 2,
                                    ),
                                  ),
                                ),
                              ]
                            ),
                          );
                        }
                    ),
                  ),
                );
              }else{
                return GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  /// Lors du clic sur la zone, ca disparait
                  child: Center(
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 5.0,
                          crossAxisCount: 2,
                        ),
                        itemCount: this.playersList![this.currPlayer!]!.deck.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Center(child: Image(image: this.playersList![this.currPlayer!]!.deck[index]!.img!.image,));
                        }
                    ),
                  ),
                );
              }
            },
          );
        },
        label: Text('Voir mes cartes', style: TextStyle(fontSize: 35),),
        icon: Icon(Icons.credit_card_rounded),
        backgroundColor: kMyLightBlueV2,
      ),
    );
  }
}
