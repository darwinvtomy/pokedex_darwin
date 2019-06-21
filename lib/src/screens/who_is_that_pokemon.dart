import 'package:flutter/material.dart';
import 'dart:math';

class WhothatPokemon extends StatefulWidget {
  @override
  _WhothatPokemonState createState() => _WhothatPokemonState();
}

class _WhothatPokemonState extends State<WhothatPokemon> {
  Color pokicolor = Colors.blue.shade900;
  String pokiImage =
      'https://www.serebii.net/pokemongo/pokemon/${Random().nextInt(800).toString().padLeft(3, "0")}.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Who is That Pokemon ?'),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/who.png',
                  fit: BoxFit.fitWidth,
                ),
                /*     Positioned(
                  top: 50,
                  left: 50,
                  child: Image.network(
                    'https://www.serebii.net/pokemongo/pokemon/002.png',
                    color: Colors.blue.shade900,
                  ),
                ),*/
                Positioned(
                  top: 50,
                  left: 50,
                  child: Image.network(
                    pokiImage,
                    color: pokicolor,
                  ),
                )
              ],
            ),
            FlatButton(
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    pokicolor = null;
                  });
                },
                child: Text(
                  'Reveal',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
