import 'package:flutter/material.dart';

Widget demonstrationListElementGame(BuildContext context,
    {String nameGame = "Название игры",
    String price = "Цена",
    String date = 'Дата',
    String location = "Место проведения",
    String counterPlayer = "21/100",
    String mode = "Активные в игре режимы",
    String state = 'Статус'}) {
  return Row(
    children: [
      Flexible(
        flex: 4,
        fit: FlexFit.tight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$nameGame',
                  style: TextStyle(
                    color: Color(0xFFA4A5A7),
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                ),
                Text(
                  '$price',
                  style: TextStyle(
                    color: Color(0xFFA4A5A7),
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                ),
                Text(
                  '$date',
                  style: TextStyle(
                    color: Color(0xFFA4A5A7),
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$location',
                  style: TextStyle(
                    color: Color(0xFFA4A5A7),
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                ),
                Text(
                  '$counterPlayer',
                  style: TextStyle(
                    color: Color(0xFFA4A5A7),
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$mode',
                  style: TextStyle(
                    color: Color(0xFFA4A5A7),
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                ),
                Text(
                  '$state',
                  style: TextStyle(
                    color: Color(0xFFA4A5A7),
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
