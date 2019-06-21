import 'package:flutter_svg/svg.dart';
import '../screens/who_is_that_pokemon.dart';
import 'unicorndial.dart';
import 'package:flutter/material.dart';

class PokeBall extends StatelessWidget {
  var childButtons = List<UnicornButton>();

  @override
  Widget build(BuildContext context) {
    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Who is that Pokemon",
        currentButton: FloatingActionButton(
          heroTag: "train",
          backgroundColor: Colors.red,
          mini: true,
          child: Icon(Icons.videogame_asset),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WhothatPokemon()));
          },
        )));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: 'Search',
        currentButton: FloatingActionButton(
            heroTag: "airplane",
            backgroundColor: Colors.green,
            mini: true,
            child: Icon(Icons.search))));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: 'Filter',
        currentButton: FloatingActionButton(
            heroTag: "directions",
            backgroundColor: Colors.blue,
            mini: true,
            child: Icon(Icons.filter_list))));

    return UnicornDialer(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
        parentButtonBackground: Colors.red,
        orientation: UnicornOrientation.VERTICAL,
        parentButton: Icon(Icons.add),
        background: SvgPicture.asset('assets/icons/pokeball.svg'),
        childButtons: childButtons);
  }
}
