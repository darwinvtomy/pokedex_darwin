import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'bordered_text.dart';

class PokemonCard extends StatelessWidget {
  String id;
  String image;
  Color color;
  Function onTap;
  ValueKey key;
  String name;

  PokemonCard(
      {
      @required this.name,
      @required this.id,
      @required this.image,
      @required this.color,
      @required this.onTap,
      this.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
        clipBehavior: Clip.antiAlias,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
            bottomLeft: Radius.circular(2.0),
            bottomRight: Radius.circular(2.0),
          ),
        ),
        elevation: 1.0,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: color
                ),
                height: double.infinity,
                width: double.infinity,
              child: Image.asset(
                  'assets/images/rays.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Hero(
                    tag: 'pokemon-$id',
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(image),
                    ),
                  ),
                ),
              ),
/*              Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                  height: 30.0,
                  width: 40.0,
                  color: Colors.white,
                  child: Text(
                    '#$id',
                    style: TextStyle(color: Colors.black),
                  ),
                  alignment: Alignment.center,
                ),
              ),*/
              Positioned(
                bottom: 0.0,
                child: Container(
                  height: 30.0,
                  child: BorderedText(
                    strokeCap: StrokeCap.round,
                    strokeWidth: 1.8,
                    strokeColor: Colors.blue.shade900,
                    child: Text(
                      '${name[0].toUpperCase() + name.substring(1)}',
                      style: TextStyle(
                        fontFamily: 'Pokifont',
                        color: Colors.yellow,
                        fontSize: 18.0,
                        decoration: TextDecoration.none,
                        decorationColor: Colors.white,
                      ),
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
