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
              return GestureDetector(
                onTap: () => Navigator.of(context).pop(),

                /// Lors du clic sur la zone, ca disparait
                child: Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: this.playersList!.length > 0 ? CustomScrollView(
                    shrinkWrap: true,
                    slivers: <Widget>[
                      SliverPadding(
                        padding: const EdgeInsets.all(10.0),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate(
                            List.generate(
                              this.playersList!.length,
                              (index) {
                                return ListTile(
                                  leading: Icon(Icons.account_circle_outlined, color: Colors.black, size: 60,),
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Cartes de ' + this.playersList![index]!.name!, style: TextStyle(fontSize: 30),),
                                  ),
                                  subtitle: this.playersList![index]!.deck.length > 0 ? Container(
                                    width: size.width,
                                    height: 120,
                                    child: liarMode == true ? GridView.count(
                                      mainAxisSpacing: 10.0,
                                      crossAxisSpacing: 10.0,
                                      crossAxisCount: 4,
                                      scrollDirection: Axis.vertical,
                                      children: List.generate(this.playersList![index]!.deck.length, (cardIndex){
                                        if(this.playersList![index]!.name == this.playersList![this.currPlayer!]!.name){
                                          return Container(child: this.playersList![this.currPlayer!]!.deck[cardIndex]!.img, width: 200, height: 300,);
                                        }else{
                                          return Image.asset('assets/backgrounds/components/cardBackBlack.png', fit: BoxFit.cover, width: size.width, height: size.height,);
                                        }
                                      }),
                                    ) : GridView.count(
                                      crossAxisCount: 4,
                                      scrollDirection: Axis.vertical,
                                      children: List.generate(this.playersList![index]!.deck.length, (cardIndex){
                                          return Center(child: Container(child: this.playersList![index]!.deck[cardIndex]!.img, width: this.playersList![index]!.deck[cardIndex]!.img!.width, height: this.playersList![index]!.deck[cardIndex]!.img!.height,));
                                      }),
                                    ),
                                  ) : Center(child: CircularProgressIndicator(),),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ) : Center(child: CircularProgressIndicator(),),
                ),
              );
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
