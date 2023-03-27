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
      "https://avatars.mds.yandex.net/i?id=c164f9da1e7fc10fc485025088a32bc0-5225010-images-thumbs&n=13",
      "https://avatars.dzeninfra.ru/get-zen_doc/1578824/pub_5fc633c26d4e6a5c3f278bbf_5fc633c94fa3013b2306b59c/scale_1200",
      "https://avatars.mds.yandex.net/i?id=7ae31210d495313ca8a9f7aac57ac540-5660573-images-thumbs&n=13",
      "https://img1.goodfon.ru/wallpaper/nbig/3/fc/the-amazing-spider-man-spider-698.jpg",
      "https://avatars.dzeninfra.ru/get-zen_doc/2455156/pub_5f3335fee3b49663014a4bde_5f3338096dfb3a749c2b6a8f/scale_1200",
      "https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/ffd54804-7a46-4761-b007-8ace80460bd3/3840x",
      "https://avatars.mds.yandex.net/i?id=57d92307fc042a1904ee1af50e8756ac9bf914f6-5303267-images-thumbs&n=13"
    ];
    var description = [
      "Deadpool description",
      "Iron Man description",
      "Captain America description",
      "Spiderman description",
      "Doctor Strange description",
      "Thor description",
      "Thanos description",
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
                          description: description[index],
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
