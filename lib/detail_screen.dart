import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.path,
    required this.hero,
    required this.description,
  });

  final String path;
  final String hero;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: hero,
      child: Scaffold(
        body: Stack(fit: StackFit.expand, children: [
          Image.network(
            path,
            fit: BoxFit.cover,
          ),
          Positioned(
              top: 45,
              child: BackButton(
                key: key,
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          Positioned(
              bottom: 45,
              right: 15,
              left: 15,
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hero,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Text(
                    description,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 247, 246, 246),
                      fontSize: 25,
                    ),
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}
