import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_pyramid/controller/PlayGameMethod.dart';

import 'CardDeck.dart';
import 'GameDeck.dart';

class Player {
  String name;
  PlayController playController;
  List<CardDeck> deck = new List();

  Player(
    String name,
    List<Player> playersList,
    Player currentPlayer,
    int currPlayer,
    GameDeck gameDeck,
    CardDeck card,
    String currentCard,
    bool nextScreen,
  ) {
    this.name = name;
    this.playController = new PlayController(
      playersList,
      currentPlayer,
      gameDeck,
      card,
      currentCard,
      nextScreen,
      currPlayer,
    );
  }

  void addCard(CardDeck card) {
    this.deck.add(card);
  }

  /**
   * Cett fonction retour le nombre de carte présent dans le deck
   */
  int getDeckLength() {
    return this.deck.length;
  }

  /**
   * Cette fonction réorganise les carte présente dans le deck
   * En allant du plus petit au plus grand
   */
  void organiseDeck() {
    CardDeck save;
    var i;
    if (this.getDeckLength() > 1) {
      for (i = 0; i < this.getDeckLength() - 1; i++) {
        if (this.deck[i].number != this.deck[i + 1].number &&
            this.deck[i].number > this.deck[i + 1].number) {
          save = this.deck[i];
          this.deck[i] = this.deck[i + 1];
          this.deck[i + 1] = save;
        }
      }
    }
  }

  /**
   * Cett fonction retourne une carte au hasard dans le Jeu de carte
   */
  CardDeck getRandCard() {
    GameDeck gameDeck = GameDeck();
    gameDeck.initDeck();
    Random random = Random();
    CardDeck randomCard =
        gameDeck.gameDeck[random.nextInt(gameDeck.gameDeck.length)];
    return randomCard;
  }

  /**
   * Cette fonction prend la réponse du joueur le tour et une carte en paramettre
   * Retourne une réponse boulean en fonction des phase de jeu ici "tour"
   */
  bool play(String choice, int tour, CardDeck cardDeck, BuildContext context,
      String nextScreenName, String nextScreenMessage, int currPlayer) {
    bool answer;
    switch (tour) {
      case 1:
        answer = this.rougeOuNoirPhase(choice, tour, cardDeck);
        break;
      case 2:
        answer = this.plusMinusPhase(choice, tour, cardDeck);
        break;
      case 3:
        answer = this.interExterPhase(choice, tour, cardDeck);
        break;
      case 4:
        answer = this.symboleChoice(choice, tour, cardDeck);
        break;
      default:
    }
    // this.playController.isWinOrNot(
    //       cardDeck,
    //       "Yes Brothaaa \n Tu as gagné, distribue $tour a qui tu veux !!",
    //       "Bruuh.. \n Vas-y prends $tour verre",
    //       nextScreenMessage,
    //       context,
    //       nextScreenName,
    //       tour,
    //       answer,
    //       currPlayer,
    //     );
    return answer;
  }

  /**
   * Cette fonction regarde si la réponse du jouer "choice" 
   * correspond a la carte au hasard généré
   */
  bool rougeOuNoirPhase(String choice, int tour, CardDeck cardDeck) {
    bool answer;
    switch (choice) {
      case "red":
        if (cardDeck.getCardColor() == "red") {
          {
            answer = true;
            this.addCard(cardDeck);
          }
        } else {
          answer = false;
          this.addCard(cardDeck);
        }
        break;
      case "black":
        if (cardDeck.getCardColor() == "black") {
          answer = true;
          this.addCard(cardDeck);
        } else {
          answer = false;
          this.addCard(cardDeck);
        }
        break;
      default:
    }
    return answer;
  }

  bool plusMinusPhase(String choice, int tour, CardDeck cardDeck) {
    bool answer;
    switch (choice) {
      case "red":
        if (cardDeck.getNumber() <= this.deck[0].number) {
          {
            answer = true;
            this.addCard(cardDeck);
          }
        } else {
          answer = false;
          this.addCard(cardDeck);
        }
        break;
      case "black":
        if (cardDeck.getNumber() >= this.deck[0].getNumber()) {
          answer = true;
          this.addCard(cardDeck);
        } else {
          answer = false;
          this.addCard(cardDeck);
        }
        break;
      default:
    }
    this.organiseDeck(); //Replace les cartes dans l'ordre des numeros
    return answer;
  }

  bool interExterPhase(String choice, int tour, CardDeck cardDeck) {
    bool answer;
    switch (choice) {
      case "red":
        if ((cardDeck.getNumber() > this.deck[0].number) &&
            (cardDeck.getNumber() <= this.deck[1].number)) {
          {
            answer = true;
            this.addCard(cardDeck);
          }
        } else {
          answer = false;
          this.addCard(cardDeck);
        }
        break;
      case "black":
        if ((cardDeck.getNumber() < this.deck[0].number) &&
            (cardDeck.getNumber() >= this.deck[1].number)) {
          answer = false;
          this.addCard(cardDeck);
        } else {
          answer = true;
          this.addCard(cardDeck);
        }
        break;
      default:
    }
    this.organiseDeck();
    return answer;
  }

  bool symboleChoice(String choice, int tour, CardDeck cardDeck) {
    bool answer;
    switch (choice) {
      case "pique":
        if (cardDeck.cardSymbole == "prique") {
          answer = true;
          this.addCard(cardDeck);
        } else {
          answer = false;
          this.addCard(cardDeck);
        }
        break;
      case "trefle":
        if (cardDeck.cardSymbole == "trefle") {
          answer = true;
          this.addCard(cardDeck);
        } else {
          answer = false;
          this.addCard(cardDeck);
        }
        break;
      case "coeur":
        if (cardDeck.cardSymbole == "coeur") {
          answer = true;
          this.addCard(cardDeck);
        } else {
          answer = false;
          this.addCard(cardDeck);
        }
        break;
      case "carreau":
        if (cardDeck.cardSymbole == "carreau") {
          answer = true;
          this.addCard(cardDeck);
        } else {
          answer = false;
          this.addCard(cardDeck);
        }
        break;
      default:
    }
    return answer;
  }
}

List<Player> playersLists = new List<Player>();
