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
  List<Player> playersList = [];
  Player player;
  int currPlayer = 0;
  GameDeck gameDeck = new GameDeck();
  CardDeck card;
  String currentCard;
  bool nextScreen = false;
  String temp;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          HomeBackground(homeBackURL: "assets/backgrounds/play.svg"),
          Container(
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
          ),
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
                temp = value;
                setState(() {
                  addPlayer(context);
                });
              },
              cursorColor: Colors.white,
              cursorHeight: 25.0,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Entrez un joueur",
                fillColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
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
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          addPlayer(context);
                        });
                      },
                    ),
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.play_arrow_sharp),
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
                                          "Allez hop, \n PLUS or MINUS !!",
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
            margin:
                EdgeInsets.only(top: size.height/6.3),
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
                      title: Text(playersList[index].name),
                      subtitle: Text('Let\'s get it'),
                      trailing: TextButton(
                        onPressed: () {
                          removePlayer(playersList[index]);
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
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 230),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                backgroundColor: Colors.black,
              ),
              onPressed: () {

              },
              child: Text(
                "Jouer",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void removePlayer(Player e) {
    return setState(() {
      playersList.removeWhere((element) => element.name == e.name);
      temp = null;
    });
  }

  Future<void> addPlayer(BuildContext context) async {
    return setState(() {
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
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Wow !!!',
                textAlign: TextAlign.center,
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                      'Tu n\'as pas entrez de nom !!',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Entre le nom d\'un joueur !!',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    '🍻',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    });
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
