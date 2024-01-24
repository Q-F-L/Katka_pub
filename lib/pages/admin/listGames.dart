import 'package:flutter/material.dart';
import 'package:katka/components/src/demonstrationListElementGame.dart';
import 'package:katka/pages/admin/activeGame.dart';
import 'package:katka/pages/admin/createMap/createPointBatlle.dart';
import 'package:katka/pages/admin/detailAdmin.dart';
import 'package:katka/pages/admin/detailGame.dart';
import 'package:katka/pages/detailsLastGame.dart';
import 'package:katka/pages/detailsUpcomingGame.dart';

class AdminListGames extends StatefulWidget {
  const AdminListGames({super.key});

  @override
  State<AdminListGames> createState() => _AdminListGames();
}

class _AdminListGames extends State<AdminListGames> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Color(0xFF292A2C),
        elevation: 0,
        child: Image.asset('assets/png/plus.png'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePointBatlle()),
          );
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 35,
          ),
        ),
        title: const Text('Игры'),
        backgroundColor: const Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(
              height: 8,
            ),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 4)),
              ),
              onPressed: () {},
              child: demonstrationListElementGame(context),
            ),
            const Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 4)),
              ),
              onPressed: () {},
              child: listElementGame(
                context,
                nameGame: 'Большая игра',
                location: 'г. Москва, ул. Новиков, д.10',
                mode: 'Аркада, Зомби',
                date: '10.10.2021',
                state: 'Прошла',
                counterPlayer: '67/100',
                price: '',
              ),
            ),
            const Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 4)),
              ),
              onPressed: () {},
              child: listElementGame(
                context,
                nameGame: 'Большая игра',
                location: 'г. Москва, ул. Новиков, д.10',
                mode: 'Аркада, Зомби',
                date: '09.11.2023',
                state: 'Активна',
                counterPlayer: '98/100',
                price: '',
              ),
            ),
            const Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 4)),
              ),
              onPressed: () {},
              child: listElementGame(
                context,
                nameGame: 'Большая игра',
                location: 'г. Москва, ул. Новиков, д.10',
                mode: 'Хардкор, Зомби',
                date: '12.11.2023',
                state: 'Запланирована',
                counterPlayer: '67/100',
                price: '',
              ),
            ),
            const Divider(color: Color(0xFFA4A5A7)),
          ],
        ),
      ),
    );
  }

  Widget listElementGame(BuildContext context,
      {String nameGame = "Название игры",
      String price = "Цена",
      String date = 'Дата',
      String location = "Место проведения",
      String counterPlayer = "21/100",
      String mode = "Хардкор, Одиночная",
      String state = "Статус"}) {
    List<String> arrayStr = counterPlayer.split('/');

    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => 'Прошла' == state
                  ? AdminDetailGame()
                  : ('Активна' == state
                      ? AdminActiveGame()
                      : 'Запланирована' == state
                          ? AdminDetailGame()
                          : AdminDetailGame()),
            ));
      },
      child: Row(
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
      ),
    );
  }
}
