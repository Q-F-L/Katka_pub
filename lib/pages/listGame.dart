import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';
import 'package:katka/components/src/demonstrationListElementGame.dart';
import 'package:katka/components/src/listElement.dart';
import 'package:katka/components/src/listElementComandRequest.dart';
import 'package:katka/components/src/listElementGame.dart';

class ListGame extends StatefulWidget {
  const ListGame({super.key});

  @override
  State<ListGame> createState() => _ListGame();
}

class _ListGame extends State<ListGame> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> list = ['Список', 'Список1', 'Список2', 'Список3'];
  String selectedItem = 'Список';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Color(0xFF1F2022),
          appBar: AppBar(
            backgroundColor: Color(0xFF292A2C),
            actions: [
              IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.closeEndDrawer();
                },
                icon: Image.asset(
                  'assets/png/close.png',
                  scale: 0.9,
                ),
              ),
            ],
          ),
          body: Form(
              child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              dropButtonFromField(list, 'Город'),
              SizedBox(
                height: 12,
              ),
              dropButtonFromField(list, 'Город'),
              SizedBox(
                height: 12,
              ),
              dropButtonFromField(list, 'Город'),
              SizedBox(
                height: 12,
              ),
              textFromFieldCustom('Дата'),
              SizedBox(
                height: 12,
              ),
              textFromFieldCustom('Время'),
            ],
          )),
        ),
      ),
      appBar: AppBar(
        title: const Text('Игры'),
        backgroundColor: const Color.fromARGB(255, 41, 42, 44),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset('assets/png/menu.png'),
                onPressed: () {
                  scaffoldKey.currentState!.openEndDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          const SizedBox(
            width: 5,
          )
        ],
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

  Widget dropButtonFromField(List<String> list, String defaultValue) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 41, 42, 44),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField(
        alignment: Alignment.center,
        iconDisabledColor: Colors.white,
        iconEnabledColor: Colors.white,
        menuMaxHeight: 200,
        elevation: 0,
        borderRadius: BorderRadius.circular(8),
        dropdownColor: Color.fromARGB(255, 41, 42, 44),
        hint: Text(
          '$defaultValue',
          style: TextStyle(
            color: Color.fromARGB(255, 164, 165, 167),
            fontFamily: "Inter",
            fontSize: 16,
          ),
        ),
        onChanged: (data) {
          print(data);
          setState(() {
            selectedItem = data as String;
          });
        },
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 41, 42, 44),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
        ),
        items: list.map((e) {
          return DropdownMenuItem(
            child: Text(
              e,
              style: TextStyle(
                color: Color.fromARGB(255, 164, 165, 167),
                fontFamily: "Inter",
                fontSize: 16,
              ),
            ),
            value: e,
          );
        }).toList(),
      ),
    );
  }

  Widget textFromFieldCustom(String? hintText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Color.fromARGB(255, 41, 42, 44),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 164, 165, 167),
            fontFamily: "Inter",
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
