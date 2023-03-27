// ignore: file_names
import 'package:flutter/material.dart';
import 'cardWidget.dart';

class MarvelApp extends StatelessWidget {
  const MarvelApp({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.80);

    var heroes = [
      "Deadpool",
      "Iron Man",
      "Captain America",
      "Spiderman",
      "Doctor Strange",
      "Thot",
      "Tanos"
    ];
    var paths = [
      "assets/images/1.jpg",
      "assets/images/2.jpg",
      "assets/images/3.jpg",
      "assets/images/4.jpg",
      "assets/images/5.jpg",
      "assets/images/6.jpg",
      "assets/images/7.jpg"
    ];

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
                child: PageView.builder(
                  controller: controller,
                  itemCount: heroes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: CardWidget(
                          path: paths[index],
                          hero: heroes[index],
                        ));
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(30.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
