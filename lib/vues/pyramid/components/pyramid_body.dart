import 'package:flutter/material.dart';
import 'package:my_pyramid/controller/PlayGameMethod.dart';
import 'package:my_pyramid/controller/components/check_my_deck.dart';
import 'package:my_pyramid/model/CardDeck.dart';
import 'package:my_pyramid/model/GameDeck.dart';
import 'package:my_pyramid/model/Players.dart';
import 'package:my_pyramid/vues/intermediaire/inter.dart';

class SmoothPyramidBody extends StatefulWidget {
  List<Player?>? playersList;
  Player? currentPlayer;

  int tour;
  int? currPlayer;

  GameDeck? gameDeck;
  CardDeck? card;

  bool? nextScreen;

  String? currentCard;
  String nextScreenBackground;
  String firstBtnImageURL;
  String secondBtnImageURL;
  String nextScreenName;
  String nextScreenMessage;

  SmoothPyramidBody({
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
  _SmoothPyramidBodyState createState() => _SmoothPyramidBodyState(
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
      );
}

class _SmoothPyramidBodyState extends State<SmoothPyramidBody> {
  PlayController? playController;

  List<Player?>? playersList;
  Player? currentPlayer;
  bool? playerAnswer;

  int currPlayer = 0;
  int? tour;
  int? nbPhase;

  bool? nextScreen;
  bool? isWinOrNot;

  GameDeck? gameDeck;
  CardDeck? card;

  String? currentCard;
  String? nextScreenBackground;
  late String firstBtnImageURL;
  String? secondBtnImageURL;
  String? nextScreenName;
  String? nextScreenMessage;

  //ici les url des cartes a changer
  Image? url1 = Image.asset(
    "assets/backgrounds/components/cardBackBlack.png",
    width: 200.0,
    fit: BoxFit.contain,
  );
  Image? url2 = Image.asset(
    "assets/backgrounds/components/cardBackBlack.png",
    width: 200.0,
    fit: BoxFit.contain,
  );
  Image? url3 = Image.asset(
    "assets/backgrounds/components/cardBackBlack.png",
    width: 200.0,
    fit: BoxFit.contain,
  );
  Image? url4 = Image.asset(
    "assets/backgrounds/components/cardBackBlack.png",
    width: 200.0,
    fit: BoxFit.contain,
  );
  Image? url5 = Image.asset(
    "assets/backgrounds/components/cardBackBlack.png",
    width: 200.0,
    fit: BoxFit.contain,
  );
  Image? url6 = Image.asset(
    "assets/backgrounds/components/cardBackBlack.png",
    width: 200.0,
    fit: BoxFit.contain,
  );
  Image? url7 = Image.asset(
    "assets/backgrounds/components/cardBackBlack.png",
    width: 200.0,
    fit: BoxFit.contain,
  );
  Image? url8 = Image.asset(
    "assets/backgrounds/components/cardBackBlack.png",
    width: 200.0,
    fit: BoxFit.contain,
  );
  Image? url9 = Image.asset(
    "assets/backgrounds/components/cardBackBlack.png",
    width: 200.0,
    fit: BoxFit.contain,
  );
  Image? url10 = Image.asset(
    "assets/backgrounds/components/cardBackBlack.png",
    width: 200.0,
    fit: BoxFit.contain,
  );

  _SmoothPyramidBodyState(
    List<Player?>? playersList,
    Player? currentPlayer,
    int tour,
    GameDeck? gameDeck,
    CardDeck? card,
    String? currentCard,
    bool? nextScreen,
    String nextScreenBackground,
    String firstBtnImageURL,
    String secondBtnImageURL,
    String nextScreenName,
    String nextScreenMessage,
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
    if (this.currPlayer >= this.playersList!.length) {
      this.currPlayer = 0;
    }
    this.card = this.playersList![this.currPlayer]!.getRandCard();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.width / 5,
      ),
      child: Column(
        children: [
          /** Ici le block du bouton quitter */
          Container(
            // color: Colors.green,
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Inter(),
                  ),
                );
              },
              child: Icon(
                Icons.logout,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ),
          Container(
            // color: Colors.green,
            width: 75.0,
            padding: EdgeInsets.all(0),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      this.card =
                          this.playersList![this.currPlayer]!.getRandCard();
                      this.url1 = this.card!.img;
                      this
                          .playersList![currPlayer]!
                          .playController
                          .questionTime(this.card!, context);
                    });
                  },
                  child: Center(
                    child: url1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    this.card =
                        this.playersList![this.currPlayer]!.getRandCard();
                    this.url2 = this.card!.img;
                    this
                        .playersList![currPlayer]!
                        .playController
                        .questionTime(this.card!, context);
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 100),
                  width: 75.0,
                  child: url2, //image
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    this.card =
                        this.playersList![this.currPlayer]!.getRandCard();
                    this.url3 = this.card!.img;
                    this
                        .playersList![currPlayer]!
                        .playController
                        .questionTime(this.card!, context);
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 100),
                  width: 75.0,
                  child: url3, //image
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    this.card =
                        this.playersList![this.currPlayer]!.getRandCard();
                    this.url4 = this.card!.img;
                    this
                        .playersList![currPlayer]!
                        .playController
                        .questionTime(this.card!, context);
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 50.0),
                  width: 75.0,
                  child: url4, //image
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    this.card =
                        this.playersList![this.currPlayer]!.getRandCard();
                    this.url5 = this.card!.img;
                    this
                        .playersList![currPlayer]!
                        .playController
                        .questionTime(this.card!, context);
                  });
                },
                child: Container(
                  width: 75.0,
                  child: url5, //image
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    this.card =
                        this.playersList![this.currPlayer]!.getRandCard();
                    this.url6 = this.card!.img;
                    this
                        .playersList![currPlayer]!
                        .playController
                        .questionTime(this.card!, context);
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 50.0),
                  width: 75.0,
                  child: url6, //image
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    this.card =
                        this.playersList![this.currPlayer]!.getRandCard();
                    this.url7 = this.card!.img;
                    this
                        .playersList![currPlayer]!
                        .playController
                        .questionTime(this.card!, context);
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 2.5),
                  width: 75.0,
                  child: url7, //image
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    this.card =
                        this.playersList![this.currPlayer]!.getRandCard();
                    this.url8 = this.card!.img;
                    this
                        .playersList![currPlayer]!
                        .playController
                        .questionTime(this.card!, context);
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 1.0, right: 1.0),
                  width: 75.0,
                  child: url8, //image
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    this.card =
                        this.playersList![this.currPlayer]!.getRandCard();
                    this.url9 = this.card!.img;
                    this
                        .playersList![currPlayer]!
                        .playController
                        .questionTime(this.card!, context);
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 1.0, right: 1.0),
                  width: 75.0,
                  child: url9, //image
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    this.card =
                        this.playersList![this.currPlayer]!.getRandCard();
                    this.url10 = this.card!.img;
                    this
                        .playersList![currPlayer]!
                        .playController
                        .questionTime(this.card!, context);
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 2.5),
                  width: 75.0,
                  child: url10, //image
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
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
              // color: Colors.yellow,
              onPressed: () {
                setState(() {
                  this.playerAnswer = this.playersList![this.currPlayer]!.play(
                        color,
                        this.tour,
                        this.card,
                        context,
                        this.nextScreenName,
                        this.nextScreenMessage,
                        this.currPlayer,
                      );
                  this.gameDeck!.gameDeck.remove(card);
                  this.currPlayer += 1;
                  if (this.currPlayer == this.playersList!.length) {
                    this.currPlayer = 0;
                  }
                  this.currentPlayer = this.playersList![this.currPlayer];
                  this.card = this.currentPlayer!.getRandCard();
                });
              },
              child: Image.asset(
                firstBtnImageURL,
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
          top: 80.0,
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
