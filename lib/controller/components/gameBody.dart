import 'package:flutter/material.dart';
import 'package:my_pyramid/model/CardDeck.dart';
import 'package:my_pyramid/model/GameDeck.dart';
import 'package:my_pyramid/model/Players.dart';
import 'package:my_pyramid/vues/components/top_quit_btn.dart';

import '../PlayGameMethod.dart';
import 'check_my_deck.dart';

class GameBody extends StatefulWidget {
  List<Player> playersList;
  Player currentPlayer;

  int tour;
  int currPlayer;

  GameDeck gameDeck;
  CardDeck card;

  bool nextScreen;

  String currentCard;
  String nextScreenBackground;
  String firstBtnImageURL;
  String secondBtnImageURL;
  String nextScreenName;
  String nextScreenMessage;

  GameBody({
    Key key,
    @required this.playersList,
    @required this.currentPlayer,
    @required this.tour,
    @required this.currPlayer,
    @required this.gameDeck,
    @required this.card,
    @required this.nextScreen,
    @required this.currentCard,
    @required this.nextScreenBackground,
    @required this.firstBtnImageURL,
    @required this.secondBtnImageURL,
    @required this.nextScreenName,
    @required this.nextScreenMessage,
  });

  @override
  _GameBodyState createState() => _GameBodyState(
        //Il demande playController
        playersList,
        currentPlayer,
        tour,
        gameDeck,
        card,
        currentCard,
        nextScreen,
        nextScreenBackground,
        firstBtnImageURL,
        secondBtnImageURL,
        nextScreenName,
        nextScreenMessage,
        currPlayer,
      );
}

class _GameBodyState extends State<GameBody> {
  PlayController playController;

  List<Player> playersList;
  Player currentPlayer;
  bool playerAnswer;

  int currPlayer;
  int tour;
  int nbPhase;

  bool nextScreen;
  bool isWinOrNot;

  GameDeck gameDeck;
  CardDeck card;

  String currentCard;
  String nextScreenBackground;
  String firstBtnImageURL;
  String secondBtnImageURL;
  String nextScreenName;
  String nextScreenMessage;

  _GameBodyState(
    List<Player> playersList,
    Player currentPlayer,
    int tour,
    GameDeck gameDeck,
    CardDeck card,
    String currentCard,
    bool nextScreen,
    String nextScreenBackground,
    String firstBtnImageURL,
    String secondBtnImageURL,
    String nextScreenName,
    String nextScreenMessage,
    int currPlayer,
  ) {
    this.playersList = playersList;
    this.currentPlayer = currentPlayer;
    this.tour = tour;
    this.currPlayer = currPlayer;
    this.gameDeck = gameDeck;
    this.card = card;
    this.currentCard = currentCard;
    this.nextScreen = nextScreen;
    this.nextScreenBackground = nextScreenBackground;
    this.firstBtnImageURL = firstBtnImageURL;
    this.secondBtnImageURL = secondBtnImageURL;
    this.nextScreenName = nextScreenName;
    this.nextScreenMessage = nextScreenMessage;
    this.playController = new PlayController(
      this.playersList,
      this.currentPlayer,
      this.gameDeck,
      this.card,
      this.currentCard,
      this.nextScreen,
      this.currPlayer,
    );
  }

  @override
  void initState() {
    super.initState();
    if (this.currPlayer >= this.playersList.length) {
      this.currPlayer = 0;
    }
    this.card = this.playersList[0].getRandCard();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Tour ${this.tour}",
            ),
            content: Text(
              "On ne peut plus retourner en arrière a partir de maintenant !",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("🍺"),
              ),
            ],
          ),
        );
      },
      child: Container(
        child: Column(
          children: [
            TopQuitButton(),
            displayCard(
              context,
              Image.asset("assets/backgrounds/components/cardBack.png"),
            ),
            Center(
              child: Text(
                "${this.playersList[this.currPlayer].name}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            answerButton(
              "red",
              "black",
              firstBtnImageURL,
              secondBtnImageURL,
            ),
            CheckMyDeck(
              playersList: this.playersList,
              currPlayer: this.currPlayer,
            )
          ],
        ),
      ),
    );
  }

  Expanded answerButton(
      String color, String color2, String assetUrl1, String assetUrl2) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  this.playerAnswer = this.playersList[this.currPlayer].play(
                        color,
                        this.tour,
                        this.card,
                        context,
                        this.nextScreenName,
                        this.nextScreenMessage,
                        this.currPlayer,
                      );
                  this.gameDeck.gameDeck.remove(card);
                  this.playController.isWinOrNot(
                        card,
                        "Yes Brothaaa \n Tu as gagné, distribue $tour a qui tu veux !!",
                        "Bruuh.. \n Vas-y prends $tour verre",
                        nextScreenMessage,
                        context,
                        nextScreenName,
                        tour,
                        playerAnswer,
                        currPlayer,
                      );
                  this.currPlayer++;
                  this.playController.setCurrPlayer(this.currPlayer);
                  if (this.currPlayer >= this.playersList.length - 1) {
                    this.currPlayer = 0;
                  }
                  this.currentPlayer = this.playersList[this.currPlayer];
                  this.card = this.currentPlayer.getRandCard();
                });
              },
              child: Image.asset(
                firstBtnImageURL,
                width: 120,
              ),
            ),
            TextButton(
              // color: Colors.yellow,
              onPressed: () {
                setState(() {
                  this.playerAnswer = this.playersList[this.currPlayer].play(
                        color2,
                        this.tour,
                        this.card,
                        context,
                        this.nextScreenName,
                        this.nextScreenMessage,
                        this.currPlayer,
                      );
                  this.gameDeck.gameDeck.remove(card);
                  this.playController.isWinOrNot(
                        card,
                        "Yes Brothaaa \n Tu as gagné, distribue $tour a qui tu veux !!",
                        "Bruuh.. \n Vas-y prends $tour verre",
                        nextScreenMessage,
                        context,
                        nextScreenName,
                        tour,
                        playerAnswer,
                        currPlayer,
                      );
                  // this.currentPlayer = playersList[currPlayer];
                  this.currPlayer++;
                  this.playController.setCurrPlayer(this.currPlayer);
                  if (this.currPlayer >= this.playersList.length - 1) {
                    this.currPlayer = 0;
                  }
                  this.currentPlayer = this.playersList[this.currPlayer];
                  this.card = this.currentPlayer.getRandCard();
                });
              },
              child: Image.asset(
                secondBtnImageURL,
                width: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded displayCard(BuildContext context, Image image) {
    return Expanded(
      child: Container(
        // color: Colors.green,
        margin: EdgeInsets.only(
          top: 50.0,
        ),
        padding: EdgeInsets.only(
          left: 5.0,
          right: 5.0,
        ),
        // color: Colors.green,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.height / 3,
        height: MediaQuery.of(context).size.height / 3,
        child: image,
      ),
    );
  }
}
