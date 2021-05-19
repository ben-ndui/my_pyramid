

import 'GameDeck.dart';
import 'Players.dart';

class Jouer {
  List<Player> pList = [];

  var isFirst = false;
  var tour = 0;
  var nbPhase = 5;
  var nbDrink = 1;
  var currentPlayer = 0;
  var currentPhase = 0;

  GameDeck gameDeck = GameDeck();

  Jouer() {
    this.pList = [];
    initDeck();
  }

  void initDeck() {
    this.gameDeck.initDeck();
  }
}
