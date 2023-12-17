import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';
import 'package:katka/components/src/demonstrationListElementGame.dart';
import 'package:katka/components/src/listElement.dart';
import 'package:katka/components/src/listElementComandRequest.dart';
import 'package:katka/components/src/listElementGame.dart';

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
        onPressed: () {},
      ),
      appBar: AppBar(
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
}
