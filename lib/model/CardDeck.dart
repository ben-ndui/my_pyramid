import 'package:flutter/material.dart';

class CardDeck {
  int number;
  int name;
  String color;
  String cardSymbole;
  Image img;

  CardDeck({
    this.number,
    this.name,
    this.color,
    this.cardSymbole,
    this.img,
  });

  int getNumber() {
    return this.number;
  }

  int getName() {
    return this.name;
  }

  String getCardColor() {
    return this.color;
  }
}
