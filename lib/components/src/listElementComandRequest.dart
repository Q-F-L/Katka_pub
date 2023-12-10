import 'package:flutter/material.dart';
import 'package:katka/components/src/rating.dart';

Widget listElementComandRequest(BuildContext context) {
  return Row(
    children: [
      const Flexible(
        flex: 4,
        fit: FlexFit.tight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ник',
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
              'ФИО',
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
        flex: 3,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: 16,
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
              Text(
                ' рейтинг 100',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
