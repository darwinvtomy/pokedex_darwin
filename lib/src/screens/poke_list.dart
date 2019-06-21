import 'package:flutter/material.dart';
import '../widgets/floating_button.dart';
import 'package:kt_dart/collection.dart';
import '../models/pokemon.dart';
import '../resources/pokeapi.dart';
import '../widgets/pokemon_card.dart';
import '../resources/config.dart';

class PokeList extends StatefulWidget {
  PokeList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PokeListState createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  KtList<Pokemon> _pokemonList = emptyList();
  bool _isLoading = false;

//  String svgString;

  final ScrollController _scrollController =
      ScrollController(debugLabel: 'pokemonSc');

  @override
  void initState() {
    super.initState();
    debugPrint('Something');

    //svgString = loadAsset();
    // print(svgString);

    _fetchPokemonList();

    _scrollController.addListener(() {
      if (!_isLoading && _scrollController.position.extentAfter == 0.0) {
        _fetchPokemonList();
      }
    });
  }

  _fetchPokemonList() async {
    setState(() {
      _isLoading = true;
    });
    final pokemonList = await pokeApi.getPokemonList(_pokemonList.size);
    setState(() {
      _pokemonList = _pokemonList.plus(pokemonList);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          const SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Poke dex'),
            ),
          ),
          SliverGrid(

            delegate: SliverChildBuilderDelegate((ctx, index) {
              var item = _pokemonList[index];

              return PokemonCard(
                  name: item.name,
                  id: item.id,
                  image: getPokemonImage(item.id),
                  color: item.color,
                  key: ValueKey(item.id),
                  onTap: () {
                    Navigator.pushNamed(context, '/detail', arguments: {
                      'id': item.id,
                      'name': item.name,
                      'image': getPokemonImage(item.id),
                      'color': item.color,
                    });
                  });
            }, childCount: _pokemonList.size),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          ),
          SliverToBoxAdapter(
              child: _isLoading
                  ? Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox())
        ],
      ),

      floatingActionButton: PokeBall(),
    );
  }
}
