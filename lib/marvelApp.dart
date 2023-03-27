import 'package:flutter/material.dart';
import 'cardWidget.dart';
import 'marvel_ hero.dart';
import 'api_marvel.dart';

class MarvelApp extends StatelessWidget {
  const MarvelApp({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.80);

    ApiMarvel apiMarvel = ApiMarvel();
    List<int> heroesId;
    Future<List<MarvelHero>> getHeroesList() async {
      heroesId = await apiMarvel.getHeroesId();
      List<MarvelHero> marvelHeroes = [];

      for (var element in heroesId) {
        var marvelHero = await apiMarvel.getHeroInfo(element);

        marvelHeroes.add(marvelHero);
      }

      return marvelHeroes;
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 44, 42, 42),
        body: Center(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(30.0),
              ),
              Image.asset(
                "assets/images/marvel.png",
                height: 40,
                fit: BoxFit.fitHeight,
              ),
              const Padding(padding: EdgeInsets.all(15.0)),
              const Text(
                "Choose your hero",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(30.0),
              ),
              Expanded(
                  child: FutureBuilder(
                future: getHeroesList(),
                builder: (context, marvelHeroes) {
                  if (marvelHeroes.hasData) {
                    return PageView.builder(
                      controller: controller,
                      itemCount: marvelHeroes.data!.length,
                      itemBuilder: (context, index) {
                        return CardWidget(
                            marvelHero: marvelHeroes.data![index]);
                      },
                    );
                  }

                  if (marvelHeroes.hasError) {
                    return Padding(
                        padding: const EdgeInsets.all(10),
                        child:
                            Center(child: Text(marvelHeroes.error.toString())));
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
