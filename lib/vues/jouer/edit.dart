import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  List<String> menuName = ['Liar Mode', 'Caliente', 'Zoulette'];
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SwitchListTile(
            title: Text("Liar Mode"),
            subtitle: Text("On pimente le jeu ?"),
            value: this.isSwitched,
            onChanged: (bool value) {
              setState(() {
                this.isSwitched = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
