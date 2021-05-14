import 'package:flutter/material.dart';

import 'CardDeck.dart';

class GameDeck {
  List<CardDeck> gameDeck = new List();

  void init() {
    initDeck();
  }

  void initDeck() {
    this.gameDeck.add(
          new CardDeck(
            number: 12,
            name: 3,
            color: "red",
            cardSymbole: "coeur",
            img: Image.asset("assets/cards/dame-coeur-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 12,
            name: 4,
            color: "red",
            cardSymbole: "carreau",
            img: Image.asset("assets/cards/dame-carreau-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 12,
            name: 1,
            color: "black",
            cardSymbole: "pique",
            img: Image.asset("assets/cards/dame-pique-black.png"),
          ),
        );
    this.gameDeck.add(
          new CardDeck(
            number: 12,
            name: 2,
            color: "black",
            cardSymbole: "trefle",
            img: Image.asset("assets/cards/dame-trefle-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 11,
            name: 6,
            color: "black",
            cardSymbole: "trefle",
            img: Image.asset("assets/cards/valet-trefle-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 11,
            name: 7,
            color: "red",
            cardSymbole: "coeur",
            img: Image.asset("assets/cards/valet-coeur-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 11,
            name: 8,
            color: "red",
            cardSymbole: "carreau",
            img: Image.asset("assets/cards/valet-carreau-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 11,
            name: 5,
            color: "black",
            cardSymbole: "pique",
            img: Image.asset("assets/cards/valet-pique-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 13,
            name: 9,
            color: "black",
            cardSymbole: "pique",
            img: Image.asset("assets/cards/king-pique-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 13,
            name: 10,
            color: "black",
            cardSymbole: "trefle",
            img: Image.asset("assets/cards/king-trefle-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 13,
            name: 11,
            color: "red",
            cardSymbole: "coeur",
            img: Image.asset("assets/cards/king-coeur-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 13,
            name: 12,
            color: "red",
            cardSymbole: "carreau",
            img: Image.asset("assets/cards/king-carreau-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 1,
            name: 13,
            color: "black",
            cardSymbole: "pique",
            img: Image.asset("assets/cards/ace-pique-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 1,
            name: 14,
            color: "black",
            cardSymbole: "trefle",
            img: Image.asset("assets/cards/ace-trefle-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 1,
            name: 15,
            color: "red",
            cardSymbole: "coeur",
            img: Image.asset("assets/cards/ace-coeur-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 1,
            name: 16,
            color: "red",
            cardSymbole: "carreau",
            img: Image.asset("assets/cards/ace-carreau-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 2,
            name: 17,
            color: "black",
            cardSymbole: "pique",
            img: Image.asset("assets/cards/2-pique-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 2,
            name: 18,
            color: "black",
            cardSymbole: "trefle",
            img: Image.asset("assets/cards/2-trefle-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 2,
            name: 19,
            color: "red",
            cardSymbole: "coeur",
            img: Image.asset("assets/cards/2-coeur-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 2,
            name: 20,
            color: "red",
            cardSymbole: "carreau",
            img: Image.asset("assets/cards/2-carreau-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 3,
            name: 21,
            color: "black",
            cardSymbole: "pique",
            img: Image.asset("assets/cards/3-pique-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 3,
            name: 22,
            color: "black",
            cardSymbole: "trefle",
            img: Image.asset("assets/cards/3-trefle-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 3,
            name: 23,
            color: "red",
            cardSymbole: "coeur",
            img: Image.asset("assets/cards/3-coeur-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 3,
            name: 24,
            color: "red",
            cardSymbole: "carreau",
            img: Image.asset("assets/cards/3-carreau-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 4,
            name: 25,
            color: "black",
            cardSymbole: "pique",
            img: Image.asset("assets/cards/4-pique-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 4,
            name: 26,
            color: "black",
            cardSymbole: "trefle",
            img: Image.asset("assets/cards/4-trefle-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 4,
            name: 27,
            color: "red",
            cardSymbole: "coeur",
            img: Image.asset("assets/cards/4-coeur-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 4,
            name: 28,
            color: "red",
            cardSymbole: "carreau",
            img: Image.asset("assets/cards/4-carreau-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 5,
            name: 29,
            color: "black",
            cardSymbole: "pique",
            img: Image.asset("assets/cards/5-pique-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 5,
            name: 30,
            color: "black",
            cardSymbole: "trefle",
            img: Image.asset("assets/cards/5-trefle-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 5,
            name: 31,
            color: "red",
            cardSymbole: "coeur",
            img: Image.asset("assets/cards/5-coeur-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 5,
            name: 32,
            color: "red",
            cardSymbole: "carreau",
            img: Image.asset("assets/cards/5-carreau-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 6,
            name: 33,
            color: "black",
            cardSymbole: "pique",
            img: Image.asset("assets/cards/6-pique-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 6,
            name: 34,
            color: "black",
            cardSymbole: "trefle",
            img: Image.asset("assets/cards/6-trefle-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 6,
            name: 35,
            color: "red",
            cardSymbole: "coeur",
            img: Image.asset("assets/cards/6-coeur-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 6,
            name: 36,
            color: "red",
            cardSymbole: "carreau",
            img: Image.asset("assets/cards/6-carreau-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 7,
            name: 37,
            color: "black",
            cardSymbole: "pique",
            img: Image.asset("assets/cards/7-pique-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 7,
            name: 38,
            color: "black",
            cardSymbole: "trefle",
            img: Image.asset("assets/cards/7-trefle-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 7,
            name: 39,
            color: "red",
            cardSymbole: "coeur",
            img: Image.asset("assets/cards/7-coeur-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 7,
            name: 40,
            color: "red",
            cardSymbole: "carreau",
            img: Image.asset("assets/cards/7-carreau-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 8,
            name: 41,
            color: "black",
            cardSymbole: "pique",
            img: Image.asset("assets/cards/8-pique-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 8,
            name: 42,
            color: "black",
            cardSymbole: "trefle",
            img: Image.asset("assets/cards/8-trefle-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 8,
            name: 43,
            color: "red",
            cardSymbole: "coeur",
            img: Image.asset("assets/cards/8-coeur-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 8,
            name: 44,
            color: "red",
            cardSymbole: "carreau",
            img: Image.asset("assets/cards/8-carreau-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 9,
            name: 45,
            color: "black",
            cardSymbole: "pique",
            img: Image.asset("assets/cards/9-pique-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 9,
            name: 46,
            color: "black",
            cardSymbole: "trefle",
            img: Image.asset("assets/cards/9-trefle-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 9,
            name: 47,
            color: "red",
            cardSymbole: "coeur",
            img: Image.asset("assets/cards/9-coeur-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 9,
            name: 48,
            color: "red",
            cardSymbole: "carreau",
            img: Image.asset("assets/cards/9-carreau-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 10,
            name: 49,
            color: "black",
            cardSymbole: "pique",
            img: Image.asset("assets/cards/10-pique-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 10,
            name: 50,
            color: "black",
            cardSymbole: "trefle",
            img: Image.asset("assets/cards/10-trefle-black.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 10,
            name: 51,
            color: "red",
            cardSymbole: "coeur",
            img: Image.asset("assets/cards/10-coeur-red.png"),
          ),
        );

    this.gameDeck.add(
          new CardDeck(
            number: 10,
            name: 52,
            color: "red",
            cardSymbole: "carreau",
            img: Image.asset("assets/cards/10-carreau-red.png"),
          ),
        );
  }
}
