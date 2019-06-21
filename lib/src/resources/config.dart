final String pokemon_authority = 'pokeapi.co';
final String poke_api_base = '/api/v2';
String getPokemonImage (pokeId) => 'https://raw.githubusercontent.com/'
    'PokeAPI/pokeapi/master/data/v2/sprites/pokemon/$pokeId.png';

/*
String getPokemonImage (pokeId) => //TODO -- For Good Quality Image
    'https://www.serebii.net/pokemongo/pokemon/'
        '${pokeId.toString().padLeft(3, "0")}.png';*/
