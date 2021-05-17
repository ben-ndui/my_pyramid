import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_pyramid/controller/symbole_screen.dart';
import 'package:my_pyramid/model/Animation.dart';
import 'package:my_pyramid/model/CardDeck.dart';
import 'package:my_pyramid/model/GameDeck.dart';
import 'package:my_pyramid/model/Players.dart';
import 'package:my_pyramid/model/Question.dart';
import 'package:my_pyramid/vues/pyramid/pyramid.dart';

import 'display_card_earned.dart';
import 'display_question.dart';
import 'game.dart';

class PlayController {
  List<Player> playersList;
  Player currentPlayer;
  int currPlayer;
  GameDeck gameDeck;
  CardDeck card;
  String currentCard;
  bool nextScreen;

  PlayController(
    List<Player> playersList,
    Player currentPlayer,
    GameDeck gameDeck,
    CardDeck card,
    String currentCard,
    bool nextScreen,
    int currPlayer,
  ) {
    this.playersList = playersList;
    this.currentPlayer = currentPlayer;
    this.gameDeck = gameDeck;
    this.card = card;
    this.currentCard = currentCard;
    this.nextScreen = nextScreen;
    this.currPlayer = currPlayer;
  }

  void initGameController(
    List<Player> playersList,
    int currPlayer,
    GameDeck gameDeck,
    CardDeck card,
    String currentCard,
    bool nextScreen,
    Player currentPlayer,
    PlayController playController,
  ) {
    this.playersList = playersList;
    this.currentPlayer = currentPlayer;
    this.currPlayer = currPlayer;
    this.gameDeck = gameDeck;
    this.card = card;
    this.nextScreen = nextScreen;
    this.currentCard = currentCard;
  }

  /**
   * chaque variable doit etre de type widget.varible
   */
  void setCurrPlayer(int nb) {
    this.currPlayer = nb;
  }

  Question getRandQuestion() {
    Random random = Random();
    Question randomQuestion = questionList[random.nextInt(
      questionList.length,
    )];
    return randomQuestion;
  }

  Player getRandomPlayer() {
    Random random = Random();
    Player randomPlayer =
        this.playersList[random.nextInt(this.playersList.length)];
    return randomPlayer;
  }

  Player setPlayer(int next, List<Player> playersList) {
    return playersList[next];
  }

  dynamic setupNextScreen(String name, int currPlayer) {
    print("RedirectionSetuppNextScreen");
    switch (name) {
      case "PlusOuMoinsScreen":
        return GameScreen(
          playersList: this.playersList,
          tour: 2,
          nextScreen: this.nextScreen,
          nextScreenBackground: "assets/backgrounds/green.png",
          firstBtnImageURL: "assets/backgrounds/components/minusBtn.png",
          secondBtnImageURL: "assets/backgrounds/components/upBtn.png",
          nextScreenName: "InOutScreen",
          nextScreenMessage: "Aller hop, \n IN or OUT !!!",
          gameDeck: this.gameDeck,
          currPlayer: currPlayer,
        );
        break;
      case "InOutScreen":
        return GameScreen(
          playersList: this.playersList,
          tour: 3,
          nextScreen: this.nextScreen,
          nextScreenBackground: "assets/backgrounds/cyan.png",
          firstBtnImageURL: "assets/backgrounds/components/in-btn.png",
          secondBtnImageURL: "assets/backgrounds/components/out-btn.png",
          nextScreenName: "CardSymboleScreen",
          nextScreenMessage: "Aller hop, \n CARD COLOR !!!",
          gameDeck: this.gameDeck,
          currPlayer: this.currPlayer,
        );
        break;
      case "CardSymboleScreen":
        return SymboleScreen(
          playersList: this.playersList,
          tour: 4,
          nextScreen: this.nextScreen,
          nextScreenBackground: "assets/backgrounds/cyan.svg",
          firstBtnImageURL: "assets/backgrounds/components/piqueButton.png",
          secondBtnImageURL: "assets/backgrounds/components/treffleButton.png",
          nextScreenName: "SmoothPyramid",
          nextScreenMessage: "Aller hop, \n PYRAMID TIME !!!",
          gameDeck: this.gameDeck,
          currPlayer: this.currPlayer,
        );
        break;
      case "SmoothPyramid":
        return SmoothPyramid(
          playersList: this.playersList,
          tour: 5,
          nextScreen: this.nextScreen,
          nextScreenBackground: "assets/backgrounds/cyan.svg",
          firstBtnImageURL: "assets/backgrounds/components/piqueButton.png",
          secondBtnImageURL: "assets/backgrounds/components/treffleButton.png",
          nextScreenName: "SmoothPyramid",
          nextScreenMessage: "Aller hop, \n PYRAMID TIME !!!",
          gameDeck: this.gameDeck,
          currPlayer: this.currPlayer,
        );
        break;
      default:
    }
  }

  Future<void> isWinOrNot(
    CardDeck card,
    String text,
    String textFalse,
    String interfaceMessage,
    BuildContext context,
    String nextScreenName,
    int tour,
    bool answer,
    int currPlayer,
  ) {
    if (answer == true) {
      return myDialog(
        card,
        text,
        interfaceMessage,
        context,
        nextScreenName,
        tour,
        currPlayer,
      );
    } else {
      return myDialog(
        card,
        textFalse,
        interfaceMessage,
        context,
        nextScreenName,
        tour,
        currPlayer,
      );
    }
  }

  Future<void> questionTime(CardDeck card, BuildContext context) {
    Player randomPlayer =
        this.playersList[this.currPlayer].playController.getRandomPlayer();
    switch (card.number) {
      case 12:
        return showGeneralDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          transitionBuilder: (context, _animation, _secondAnimation, _child) {
            return Animations.grow(_animation, _secondAnimation, _child);
          },
          pageBuilder: (_animation, _secondAnimation, _child) {
            return DisplayQuestion(
              card: card,
              text: this
                  .playersList[this.currPlayer]
                  .playController
                  .getRandQuestion()
                  .title,
              description: this
                  .playersList[this.currPlayer]
                  .playController
                  .getRandQuestion()
                  .description,
              randomPlayer: randomPlayer,
            );
          },
        );
        break;
      case 3:
        return showGeneralDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          transitionBuilder: (context, _animation, _secondAnimation, _child) {
            return Animations.grow(_animation, _secondAnimation, _child);
          },
          pageBuilder: (_animation, _secondAnimation, _child) {
            return DisplayQuestion(
              card: card,
              text: this
                  .playersList[this.currPlayer]
                  .playController
                  .getRandQuestion()
                  .title,
              description: this
                  .playersList[this.currPlayer]
                  .playController
                  .getRandQuestion()
                  .description,
              randomPlayer: randomPlayer,
            );
          },
        );
        break;
      case 13:
        return showGeneralDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          transitionBuilder: (context, _animation, _secondAnimation, _child) {
            return Animations.grow(_animation, _secondAnimation, _child);
          },
          pageBuilder: (_animation, _secondAnimation, _child) {
            return DisplayQuestion(
              card: card,
              text: this
                  .playersList[this.currPlayer]
                  .playController
                  .getRandQuestion()
                  .title,
              description: this
                  .playersList[this.currPlayer]
                  .playController
                  .getRandQuestion()
                  .description,
              randomPlayer: randomPlayer,
            );
          },
        );
        break;
      case 8:
        return showGeneralDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          transitionBuilder: (context, _animation, _secondAnimation, _child) {
            return Animations.grow(_animation, _secondAnimation, _child);
          },
          pageBuilder: (_animation, _secondAnimation, _child) {
            return DisplayQuestion(
              card: card,
              text: this
                  .playersList[this.currPlayer]
                  .playController
                  .getRandQuestion()
                  .title,
              description: this
                  .playersList[this.currPlayer]
                  .playController
                  .getRandQuestion()
                  .description,
              randomPlayer: randomPlayer,
            );
          },
        );
        break;
      case 5:
        return showGeneralDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          transitionBuilder: (context, _animation, _secondAnimation, _child) {
            return Animations.grow(_animation, _secondAnimation, _child);
          },
          pageBuilder: (_animation, _secondAnimation, _child) {
            return DisplayQuestion(
              card: card,
              text: this
                  .playersList[this.currPlayer]
                  .playController
                  .getRandQuestion()
                  .title,
              description: this
                  .playersList[this.currPlayer]
                  .playController
                  .getRandQuestion()
                  .description,
              randomPlayer: randomPlayer,
            );
          },
        );
        break;
      case 10:
        return showGeneralDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          transitionBuilder: (context, _animation, _secondAnimation, _child) {
            return Animations.grow(_animation, _secondAnimation, _child);
          },
          pageBuilder: (_animation, _secondAnimation, _child) {
            return DisplayQuestion(
              card: card,
              text: this
                  .playersList[this.currPlayer]
                  .playController
                  .getRandQuestion()
                  .title,
              description: this
                  .playersList[this.currPlayer]
                  .playController
                  .getRandQuestion()
                  .description,
              randomPlayer: randomPlayer,
            );
          },
        );
        break;
      default:
    }
  }

  /**
   * Affiche la carte gagné ou perdu et demande si tout le monde a joué a sa fermeture
   */

  Future<void> myDialog(
    CardDeck cardDeck,
    String text,
    String textToChangeInterface,
    BuildContext context,
    String nextScreenName,
    int tour,
    int currPlayer,
  ) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      transitionBuilder: (context, _animation, _secondAnimation, _child) {
        return Animations.grow(_animation, _secondAnimation, _child);
      },
      pageBuilder: (_animation, _secondAnimation, _child) {
        return DisplayCardEarned(
          tour: tour,
          card: cardDeck,
          text: text,
        );
      },
    ).then(
      (value) => ifEveryOnPlays(
        context,
        text,
        textToChangeInterface,
        nextScreenName,
        tour,
        currPlayer,
      ),
    );
  }

  // C'est ici que je regarde si a chaque tour tout le monde a joué ou non avec un switch sur le tour
  // Tout le monde a joué quand lors de chaque tour, le nombre de carte obtenue est égale au nombre de tour
  // SI LE JOUEUR COURANT A UN NOMBRE DE CARTE EGALE AU NOMBRE DE TOUR ON PASSE AU JOUEUR SUIVANT !
  Future<void> ifEveryOnPlays(
      BuildContext context,
      String text,
      String textToChangeInterface,
      String nextScreenName,
      int tour,
      int currPlayerr) async {
    switch (tour) {
      case 1:
        for (Player player in this.playersList) {
          if (player.getDeckLength() == tour) {
            myPopUp(
                context, textToChangeInterface, nextScreenName, currPlayerr);
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => GameScreen(
                  playersList: this.playersList,
                  tour: tour,
                  nextScreen: this.nextScreen,
                  nextScreenBackground: "assets/backgrounds/fisrt.png",
                  firstBtnImageURL:
                      "assets/backgrounds/components/redChoice.png",
                  secondBtnImageURL:
                      "assets/backgrounds/components/blackChoice.png",
                  nextScreenName: nextScreenName,
                  nextScreenMessage: "Plus ou Moins \n Que ta carte précédente ? \n Tu peux désormais voir tes cartes, n'oublie pas !",
                  gameDeck: this.gameDeck,
                  currPlayer: this.currPlayer,
                ),
              ),
            );
          }
        }
        break;
      case 2:
        for (Player player in this.playersList) {
          if (player.getDeckLength() == tour) {
            myPopUp(
                context, textToChangeInterface, nextScreenName, currPlayerr);
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => GameScreen(
                  playersList: this.playersList,
                  tour: tour,
                  nextScreen: this.nextScreen,
                  nextScreenBackground: "assets/backgrounds/green.png",
                  firstBtnImageURL:
                      "assets/backgrounds/components/minusBtn.png",
                  secondBtnImageURL: "assets/backgrounds/components/upBtn.png",
                  nextScreenName: nextScreenName,
                  nextScreenMessage: "Intérieur ou Extérieurs ?",
                  gameDeck: this.gameDeck,
                  currPlayer: this.currPlayer,
                ),
              ),
            );
          }
        }
        break;
      case 3:
        for (Player player in this.playersList) {
          if (player.getDeckLength() == tour) {
            myPopUp(
                context, textToChangeInterface, nextScreenName, currPlayerr);
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => GameScreen(
                  playersList: this.playersList,
                  tour: tour,
                  nextScreen: this.nextScreen,
                  nextScreenBackground: "assets/backgrounds/cyan.png",
                  firstBtnImageURL: "assets/backgrounds/components/in-btn.png",
                  secondBtnImageURL:
                      "assets/backgrounds/components/out-btn.png",
                  nextScreenName: nextScreenName,
                  nextScreenMessage: "Pique, Trefle, Careau \n ou Coeur ?",
                  gameDeck: this.gameDeck,
                  currPlayer: this.currPlayer,
                ),
              ),
            );
          }
        }
        break;
      case 4:
        for (Player player in this.playersList) {
          if (player.getDeckLength() == tour) {
            myPopUp(
                context, textToChangeInterface, nextScreenName, currPlayerr);
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SymboleScreen(
                    playersList: this.playersList,
                    tour: tour,
                    nextScreen: this.nextScreen,
                    nextScreenBackground: "assets/backgrounds/cyan.svg",
                    firstBtnImageURL:
                        "assets/backgrounds/components/redChoice.png",
                    secondBtnImageURL:
                        "assets/backgrounds/components/blackChoice.png",
                    nextScreenName: nextScreenName,
                    nextScreenMessage: "Pyramid Time !!",
                    gameDeck: this.gameDeck,
                    currPlayer: this.currPlayer),
              ),
            );
          }
        }
        break;
      default:
    }
  }

  Future<void> myPopUp(BuildContext context, String text1,
      String nextScreenName, int currPlayer) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(
                milliseconds: 1000,
              ),
              transitionsBuilder: (context, animation, animationTime, child) {
                animation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.bounceIn,
                );
                return ScaleTransition(
                  child: child,
                  scale: Tween<double>(end: 1.0, begin: 0.0).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Interval(0.50, 1.00, curve: Curves.linear),
                    ),
                  ),
                );
              },
              pageBuilder: (context, animation, animationTime) {
                return this.setupNextScreen(nextScreenName, 0);
              },
            ),
          ),
          child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Stack(
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
                      Center(
                        child: Image.asset(
                          "assets/backgrounds/components/cardBackBlack.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.width / 2,
                          color: Colors.white.withOpacity(0.8),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Center(
                                  child: Text(
                                    text1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF3A3238),
                                      fontSize: 25.0,
                                    ),
                                  ),
                                ),
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
      },
    );
  }
}
