import 'package:flutter/material.dart';
import 'package:pokedex_darwin/src/widgets/bordered_text.dart';
import 'package:pokedex_darwin/src/widgets/base_status_widget.dart';
import '../models/pokedetail.dart';
import '../resources/pokeapi.dart';

class Detail extends StatefulWidget {
  String id;
  String name;
  String image;
  Color color;

  Detail({this.id, this.name, this.image, this.color});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  PokeDetail pokemonDetail;

  @override
  void initState() {
    super.initState();
    _getPokemonDetail();
  }

  _getPokemonDetail() async {
    debugPrint('PokeDetail');
    final PokeDetail pokemonResult =
        await pokeApi.getPokemonDetail(widget.name);
    setState(() {
      pokemonDetail = pokemonResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.color,
        appBar: AppBar(
          backgroundColor: widget.color,
          elevation: 0.0,
          title: Text(widget.name),
        ),
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: new BorderRadius.only(
                                bottomRight: const Radius.circular(45.0),
                                topRight: const Radius.circular(45.0)),
                          ),
                          child: Hero(
                            tag: 'pokemon-${widget.id}',
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.image),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: BorderedText(
                          strokeCap: StrokeCap.round,
                          strokeWidth: 8.0,
                          strokeColor: Colors.blue.shade900,
                          child: Text(
                            '${widget.name[0].toUpperCase() + widget.name.substring(1)}',
                            style: TextStyle(
                              fontFamily: 'Pokifont',
                              color: Colors.yellow,
                              fontSize: 40.0,
                              decoration: TextDecoration.none,
                              decorationColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        alignment: Alignment.topRight,
                        child: Text(
                          '#${widget.id}',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w300),
                        ),
                      ),
                      if (pokemonDetail != null)
                        _pokimonPhysicalDetailsWidget(pokemonDetail.height,
                            pokemonDetail.weight, pokemonDetail.species),
                      if (pokemonDetail != null)
                        _pokimonDetailsWidget(pokemonDetail.types),
                    ],
                  ),
                ),
              ),
              if (pokemonDetail != null) _DeatilsWidget(pokemonDetail.stats),
            ],
          ),
        ));
  }

  Widget _DeatilsWidget(List<Stats> stats) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BasestatsCard(status: stats, color: widget.color),
        ),
      ),
    );
  }

  Widget _pokimonDetailsWidget(List<Types> types) {
    return Container(
      padding: EdgeInsets.only(left: 16.0),
      height: 70,
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Text('Type',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200))),
          Expanded(
            flex: 3,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: types
                  .map((type) => Container(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: FilterChip(
                            label: new Text(type.type.name),
                            backgroundColor: widget.color,
                            onSelected: (boo) {},
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pokimonPhysicalDetailsWidget(
      int height, int weight, Species species) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Text(
                    'Species',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                  )),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${species.name[0].toUpperCase() + species.name.substring(1)}',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
                    ),
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Text(
                    'Height',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                  )),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$height',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
                    ),
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Text(
                    'Weight',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                  )),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$weight',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
