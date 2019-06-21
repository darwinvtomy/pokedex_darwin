import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/poke_list.dart';
import 'screens/detail.dart';

class PokemonApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
      title: 'PokeDex',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(builder: (context) {
            // final storiesBLoc = StoriesProvider.of(context);
            // storiesBLoc.fetchTopIds();

            return PokeList(title: 'Pokemon Dex');
          });
        }
        break;
      case '/detail':
        {
          Map params = settings.arguments;

          return MaterialPageRoute(
              builder: (context) => Detail(
                  id: params['id'],
                  name: params['name'],
                  image: params['image'],
                  color: params['color']));
        }
      default:
        {
          return MaterialPageRoute(builder: (context) {
            // final storiesBLoc = StoriesProvider.of(context);
            // storiesBLoc.fetchTopIds();

            return PokeList(title: 'Pokemon Dex');
          });
        }
    }
  }
}
