import 'package:flutter/material.dart';
import 'package:my_pyramid/controller/game.dart';
import 'package:my_pyramid/model/CardDeck.dart';
import 'package:my_pyramid/model/GameDeck.dart';
import 'package:my_pyramid/model/Players.dart';
import 'package:my_pyramid/vues/components/background.dart';

import '../customDialogBox.dart';

class JouerBody extends StatefulWidget {
  @override
  _JouerBodyState createState() => _JouerBodyState();
}

class _JouerBodyState extends State<JouerBody> {
  var _controller = TextEditingController();
  List<Player?> playersList = [];
  Player? player;
  int currPlayer = 0;
  GameDeck gameDeck = new GameDeck();
  CardDeck? card;
  String? currentCard;
  bool nextScreen = false;
  String? temp;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          HomeBackground(homeBackURL: "assets/backgrounds/play.svg"),
          backButton(context),
          Padding(
            padding: const EdgeInsets.only(
              top: 100,
              left: 25.0,
              right: 25.0,
            ),
            child: TextField(
              autofocus: true,
              onChanged: (value) {
                temp = value;
              },
              onSubmitted: (value) {
                setState(() {
                  temp = value;
                  addPlayer(context);
                });
              },
              cursorColor: Colors.white,
              cursorHeight: 25.0,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Entrez un joueur",
                fillColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.5,
                    style: BorderStyle.solid,
                  ),
                ),
                suffixIcon: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // added line
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.play_arrow_sharp),
                      onPressed: () {
                        setState(
                          () {
                            this.gameDeck.initDeck();

                            /// Si le nombre de joueur est suffisant, je lance le jeu ->
                            /// Redirection vers first setp of the game
                            if (this.playersList.length > 0) {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: Duration(
                                    milliseconds: 1000,
                                  ),
                                  transitionsBuilder: (context, animation,
                                      animationTime, child) {
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
                                  pageBuilder:
                                      (context, animation, animationTime) {
                                    return GameScreen(
                                      playersList: this.playersList,
                                      tour: 1,
                                      nextScreen: this.nextScreen,
                                      nextScreenBackground:
                                          "assets/backgrounds/fisrt.png",
                                      firstBtnImageURL:
                                          "assets/backgrounds/components/redChoice.png",
                                      secondBtnImageURL:
                                          "assets/backgrounds/components/blackChoice.png",
                                      nextScreenName: "PlusOuMoinsScreen",
                                      nextScreenMessage:
                                          "Allez hop, \n Plus ou Moins !!",
                                      gameDeck: this.gameDeck,
                                      currPlayer: 0,
                                    );
                                  },
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CustomDialogBox(
                                    title: "Bruuuh",
                                    descriptions:
                                        "On peut pas jouer la, tu n'as entré aucun joueur.. ",
                                    text: "Okay",
                                  );
                                },
                              );
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
                focusColor: Colors.white,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height / 5),
            // color: Colors.green,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: playersList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Card(
                    margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25.0,
                        backgroundColor:
                            Colors.brown[playersList[index].hashCode],
                      ),
                      title: Text(playersList[index]!.name!,
                          style: TextStyle(
                            fontSize: 45,
                          )),
                      subtitle: Text(
                        'Let\'s get it',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      trailing: TextButton(
                        onPressed: () {
                          setState(() {
                            removePlayer(playersList[index]);
                          });
                        },
                        child: Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          playButton(context),
        ],
      ),
    );
  }

  Container playButton(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          backgroundColor: Colors.black,
        ),
        onPressed: () {
          setState(
            () {
              this.gameDeck.initDeck();
              if (this.playersList.length > 0) {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(
                      milliseconds: 1000,
                    ),
                    transitionsBuilder:
                        (context, animation, animationTime, child) {
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
                      return GameScreen(
                        playersList: this.playersList,
                        tour: 1,
                        nextScreen: this.nextScreen,
                        nextScreenBackground: "assets/backgrounds/fisrt.png",
                        firstBtnImageURL:
                            "assets/backgrounds/components/redChoice.png",
                        secondBtnImageURL:
                            "assets/backgrounds/components/blackChoice.png",
                        nextScreenName: "PlusOuMoinsScreen",
                        nextScreenMessage: "Allez hop, \n Plus ou Moins !!",
                        gameDeck: this.gameDeck,
                        currPlayer: 0,
                      );
                    },
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogBox(
                      title: "Bruuuh",
                      descriptions:
                          "On peut pas jouer la, tu n'as entré aucun joueur.. ",
                      text: "Okay",
                    );
                  },
                );
              }
            },
          );
        },
        child: Container(
          width: 150,
          child: Text(
            "Jouer",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }

  Container backButton(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      margin: EdgeInsets.only(top: 60, left: 30),
      child: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Center(
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
      ),
    );
  }

  void removePlayer(Player? e) {
    return setState(() {
      playersList.removeWhere((element) => element!.name == e!.name);
      temp = null;
    });
  }

  Future<void> addPlayer(BuildContext context) async {
    if (temp != null) {
      player = Player(
        temp,
        playersList,
        player,
        currPlayer,
        gameDeck,
        null,
        null,
        nextScreen,
      );
      if (playersList.contains(player)) {
        print("deja inscrit");
      }
      playersList.add(player);
      _controller.clear();
      temp = null;
    } else {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: "👻",
            descriptions: "Tu n'as entré aucun joueur.. ",
            text: "Bruuh",
          );
        },
      );
    }
  }
}

// FlatButton(
//                           onPressed: () {
//                             removePlayer(playersList[index]);
//                             print(playersList.length);
//                           },
//                           child: Icon(
//                             Icons.cancel,
//                             color: Colors.white,
//                           ),
//                         ),
