import 'package:flutter/material.dart';

Widget rating(String pretext, BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.23),
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(
      vertical: 16,
      horizontal: 24,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        width: 1,
        color: Color.fromARGB(255, 246, 188, 29),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.stars,
          color: Color.fromARGB(255, 246, 188, 29),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            '$pretext',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}
