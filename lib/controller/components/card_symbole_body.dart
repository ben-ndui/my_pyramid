import 'package:flutter/material.dart';
import 'package:my_pyramid/model/CardDeck.dart';
import 'package:my_pyramid/model/GameDeck.dart';
import 'package:my_pyramid/model/Players.dart';
import 'package:my_pyramid/vues/components/top_quit_btn.dart';

import '../PlayGameMethod.dart';
import 'check_my_deck.dart';

class SymboleBody extends StatefulWidget {
  List<Player?>? playersList;
  Player? currentPlayer;

  int? tour;
  int? currPlayer;

  GameDeck? gameDeck;
  CardDeck? card;

  bool? nextScreen;

  String? currentCard;
  String? nextScreenBackground;
  String? firstBtnImageURL;
  String? secondBtnImageURL;
  String? nextScreenName;
  String? nextScreenMessage;

  SymboleBody({
    Key? key,
    required this.playersList,
    required this.currentPlayer,
    required this.tour,
    required this.currPlayer,
    required this.gameDeck,
    required this.card,
    required this.nextScreen,
    required this.currentCard,
    required this.nextScreenBackground,
    required this.firstBtnImageURL,
    required this.secondBtnImageURL,
    required this.nextScreenName,
    required this.nextScreenMessage,
  });

  @override
  _SymboleBodyState createState() => _SymboleBodyState(
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

class _SymboleBodyState extends State<SymboleBody> {
  late PlayController playController;

  List<Player?>? playersList;
  Player? currentPlayer;
  bool? playerAnswer;

  int? currPlayer;
  int? tour;
  int? nbPhase;

  bool? nextScreen;
  bool? isWinOrNot;

  GameDeck? gameDeck;
  CardDeck? card;

  String? currentCard;
  String? nextScreenBackground;
  String? firstBtnImageURL;
  String? secondBtnImageURL;
  String? nextScreenName;
  String? nextScreenMessage;

  _SymboleBodyState(
    List<Player?>? playersList,
    Player? currentPlayer,
    int? tour,
    GameDeck? gameDeck,
    CardDeck? card,
    String? currentCard,
    bool? nextScreen,
    String? nextScreenBackground,
    String? firstBtnImageURL,
    String? secondBtnImageURL,
    String? nextScreenName,
    String? nextScreenMessage,
    int? currPlayer,
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
    if (this.currPlayer! >= this.playersList!.length) {
      this.currPlayer = 0;
    }
    this.card = this.playersList![0]!.getRandCard();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TopQuitButton(),
          displayCard(context,
              Image.asset("assets/backgrounds/components/cardBack.png")),
          Center(
            child: Text(
              "${this.playersList![this.currPlayer!]!.name}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          answerButton(
            "pique",
            "trefle",
            "assets/backgrounds/components/piqueButton.png",
            "assets/backgrounds/components/treffleButton.png",
          ),
          answerButton(
            "coeur",
            "carreau",
            "assets/backgrounds/components/coeurButton.png",
            "assets/backgrounds/components/carreauButton.png",
          ),
          CheckMyDeck(
            playersList: this.playersList,
            currPlayer: this.currPlayer,
          )
        ],
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
                  this.playerAnswer = this.playersList![this.currPlayer!]!.play(
                        color,
                        this.tour,
                        this.card,
                        context,
                        this.nextScreenName,
                        this.nextScreenMessage,
                        this.currPlayer,
                      );
                  this.gameDeck!.gameDeck.remove(card);
                  this.playController.isWinOrNot(
                        card,
                        "Yes Brothaaa \n Tu as gagn??, distribue $tour a qui tu veux !!",
                        "Bruuh.. \n Vas-y prends $tour verre",
                        nextScreenMessage,
                        context,
                        nextScreenName,
                        tour,
                        playerAnswer,
                        currPlayer,
                      );
                  if(currPlayer != null){
                    currPlayer = currPlayer! + 1;
                  }
                  this.playController.setCurrPlayer(this.currPlayer);
                  if (this.currPlayer! >= this.playersList!.length - 1) {
                    this.currPlayer = 0;
                  }
                  this.currentPlayer = this.playersList![this.currPlayer!];
                  this.card = this.currentPlayer!.getRandCard();
                });
              },
              child: Image.asset(
                assetUrl1,
                width: 120,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  this.playerAnswer = this.playersList![this.currPlayer!]!.play(
                        color2,
                        this.tour,
                        this.card,
                        context,
                        this.nextScreenName,
                        this.nextScreenMessage,
                        this.currPlayer,
                      );
                  this.gameDeck!.gameDeck.remove(card);
                  this.playController.isWinOrNot(
                        card,
                        "Oui !!! \n C'est gagn??, distribue $tour a qui tu veux !!",
                        "Bruuh.. \n Vas-y prends $tour verre",
                        nextScreenMessage,
                        context,
                        nextScreenName,
                        tour,
                        playerAnswer,
                        currPlayer,
                      );
                  if(currPlayer != null){
                    currPlayer = currPlayer! + 1;
                  }
                  this.playController.setCurrPlayer(this.currPlayer);
                  if (this.currPlayer! >= this.playersList!.length - 1) {
                    this.currPlayer = 0;
                  }
                  this.currentPlayer = this.playersList![this.currPlayer!];
                  this.card = this.currentPlayer!.getRandCard();
                });
              },
              child: Image.asset(
                assetUrl2,
                width: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded displayCard(BuildContext context, Image image) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        // color: Colors.green,
        margin: EdgeInsets.only(
          top: 80.0,
        ),
        padding: EdgeInsets.only(
          left: 5.0,
          right: 5.0,
        ),
        // color: Colors.green,
        alignment: Alignment.center,
        width: size.height / 3,
        height: size.height / 3,
        child: image,
      ),
    );
  }
}
