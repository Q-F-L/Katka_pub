import 'package:flutter/material.dart';

Widget listElement() {
  return Row(
    children: [
      Flexible(
        flex: 5,
        fit: FlexFit.tight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Название',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Город',
              style: TextStyle(
                color: Color.fromARGB(255, 164, 165, 167),
                fontFamily: 'Inter',
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      Flexible(
        child: Text(
          'кол-во',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}
