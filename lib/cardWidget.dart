// ignore: file_names
import 'package:flutter/material.dart';
import 'detail_screen.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.path,
    required this.hero,
    required this.description,
  }) : super(key: key);

  final String path;
  final String hero;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: hero,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(
                path: path,
                hero: hero,
                description: description,
              );
            }));
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                path,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 15,
                right: 15,
                left: 15,
                child: Text(
                  hero,
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
