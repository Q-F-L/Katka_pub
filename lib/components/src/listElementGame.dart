import 'package:flutter/material.dart';

Widget listElementGame(BuildContext context,
    {String nameGame = "Название игры",
    String price = "Цена",
    String date = 'Дата',
    String location = "Место проведения",
    String counterPlayer = "21/100",
    String mode = "Хардкор, Одиночная",
    String state = "Статус"}) {
  List<String> arrayStr = counterPlayer.split('/');

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
                    color: Colors.white,
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
                    color: Colors.white,
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
                Row(
                  children: [
                    Text(
                      '${arrayStr[0]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '/${arrayStr[1]}',
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
                    color: 'Прошла' == state
                        ? Color(0xFFFF4646)
                        : ('Активна' == state
                            ? Color(0xFF5DE846)
                            : 'Запланирована' == state
                                ? Color(0xFFF6BD1D)
                                : Color(0xFFA4A5A7)),
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
