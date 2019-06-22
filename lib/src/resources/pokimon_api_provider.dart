import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/pokemon.dart';
import '../models/pokedetail.dart';

const String _root = 'https://pokeapi.co/api/v2/pokemon';

class PokimonApiProvider {
  Client client = Client();

  Future<List<Pokemon>> fetchPokimonsList() async {
    final respnse = await client.get('$_root/?offset=0&limit=964');
    final parsedJson = json.decode(respnse.body);
    final results = parsedJson['results'];
    return results.map<Pokemon>((json) => Pokemon.fromJson(json)).toList();
  }

  Future<PokeDetail> fetchPokemonDetails(String pokemonname) async {
    final response = await client.get('$_root/$pokemonname');
    final parsedJson = json.decode(response.body);
    return PokeDetail.fromJson(parsedJson);
  }
}
