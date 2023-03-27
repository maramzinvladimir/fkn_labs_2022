import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'marvel_ hero.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.marvelHero,
  }) : super(key: key);

  final MarvelHero marvelHero;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: marvelHero.name,
      child: Card(
        margin: const EdgeInsets.all(25),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(
                path: marvelHero.imgPath,
                hero: marvelHero.name,
                description: marvelHero.description,
              );
            }));
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                marvelHero.imgPath,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 15,
                right: 15,
                left: 15,
                child: Text(
                  marvelHero.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
