// ignore: file_names
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.path,
    required this.hero,
  }) : super(key: key);

  final String path;
  final String hero;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
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
    );
  }
}
