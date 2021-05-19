import 'package:flutter/material.dart';
import 'package:my_pyramid/controller/PlayGameMethod.dart';
import 'package:my_pyramid/model/CardDeck.dart';
import 'package:my_pyramid/model/GameDeck.dart';
import 'package:my_pyramid/model/Players.dart';
import 'package:my_pyramid/vues/components/background.dart';

import 'components/pyramid_body.dart';

class SmoothPyramid extends StatefulWidget {
  final List<Player?>? playersList;
  final Player? currentPlayer;

  final int tour;
  final int? currPlayer;

  final CardDeck? card;
  final bool? nextScreen;
  final String? currentCard;
  final String nextScreenBackground;
  final String firstBtnImageURL;
  final String secondBtnImageURL;
  final String nextScreenName;
  final String nextScreenMessage;

  final GameDeck? gameDeck;

  const SmoothPyramid({
    Key? key,
    required this.playersList,
    this.currentPlayer,
    required this.tour,
    required this.currPlayer,
    this.card,
    required this.nextScreen,
    this.currentCard,
    required this.nextScreenBackground,
    required this.firstBtnImageURL,
    required this.secondBtnImageURL,
    required this.nextScreenName,
    required this.nextScreenMessage,
    required this.gameDeck,
  }) : super(key: key);

  @override
  _SmoothPyramidState createState() => _SmoothPyramidState(
        playersList,
        currentPlayer,
        tour,
        card,
        nextScreen,
        currentCard,
        nextScreenBackground,
        firstBtnImageURL,
        secondBtnImageURL,
        nextScreenName,
        nextScreenMessage,
        gameDeck,
        currPlayer,
      );
}

class _SmoothPyramidState extends State<SmoothPyramid> {
  List<Player?>? playersList = [];
  Player? currentPlayer;

  int tour = 1;
  int? currPlayer = 0;
  bool? nextScreen = false;

  String? currentCard = "";
  String nextScreenBackground = "";
  String firstBtnImageURL = "";
  String secondBtnImageURL = "";
  String nextScreenName = "";
  String nextScreenMessage = "";

  CardDeck? card = CardDeck();
  GameDeck? gameDeck = GameDeck();
  PlayController? playController;

  _SmoothPyramidState(
    List<Player?>? playersList,
    Player? currentPlayer,
    int tour,
    CardDeck? card,
    bool? nextScreen,
    String? currentCard,
    String nextScreenBackground,
    String firstBtnImageURL,
    String secondBtnImageURL,
    String nextScreenName,
    String nextScreenMessage,
    GameDeck? gameDeck,
    int? currPlayer,
  ) {
    this.playersList = playersList;
    this.currentPlayer = currentPlayer;
    this.tour = tour;
    this.currPlayer = currPlayer;
    this.card = card;
    this.nextScreen = nextScreen;
    this.currentCard = currentCard;
    this.nextScreenBackground = nextScreenBackground;
    this.firstBtnImageURL = firstBtnImageURL;
    this.secondBtnImageURL = secondBtnImageURL;
    this.nextScreenName = nextScreenName;
    this.nextScreenMessage = nextScreenMessage;
    this.gameDeck = gameDeck;
    this.playController = PlayController(
      playersList,
      currentPlayer,
      gameDeck,
      card,
      currentCard,
      nextScreen,
      currPlayer,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print("Current player number dans GAMESCREEN : ${this.currPlayer}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomeBackground(homeBackURL: nextScreenBackground),
          SmoothPyramidBody(
            playersList: this.playersList,
            currentPlayer: this.currentPlayer,
            tour: this.tour,
            gameDeck: this.gameDeck,
            card: this.card,
            currentCard: this.currentCard,
            nextScreen: this.nextScreen,
            nextScreenBackground: this.nextScreenBackground,
            firstBtnImageURL: this.firstBtnImageURL,
            secondBtnImageURL: this.secondBtnImageURL,
            nextScreenName: this.nextScreenName,
            nextScreenMessage: this.nextScreenMessage,
            currPlayer: this.currPlayer,
          ),
        ],
      ),
    );
  }
}
