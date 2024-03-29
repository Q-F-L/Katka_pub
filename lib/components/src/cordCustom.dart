import 'package:flutter/material.dart';

Widget cardCustomButton(
    String subtext, String pretext, BuildContext context, String commandId) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextButton(
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/command");
        },
        child: Text(
          subtext,
          style: const TextStyle(
            color: Color.fromARGB(255, 164, 165, 167),
            fontSize: 16,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(
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
          children: [
            const Icon(
              Icons.stars,
              color: Color.fromARGB(255, 246, 188, 29),
            ),
            Text(
              ' $pretext',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget cardCustom(String subtext, String pretext) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        '$subtext',
        style: TextStyle(
          color: Color.fromARGB(255, 164, 165, 167),
          fontSize: 16,
        ),
      ),
      Container(
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
          children: [
            Icon(
              Icons.stars,
              color: Color.fromARGB(255, 246, 188, 29),
            ),
            Text(
              ' $pretext',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
