import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';
import 'package:katka/components/src/demonstrationListElementGame.dart';
import 'package:katka/components/src/listElement.dart';
import 'package:katka/components/src/listElementComandRequest.dart';
import 'package:katka/components/src/listElementGame.dart';
import 'package:katka/pages/activeGame.dart';
import 'package:katka/pages/detailGame.dart';
import 'package:katka/pages/detailsLastGame.dart';
import 'package:katka/pages/detailsUpcomingGame.dart';

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
      key: scaffoldKey,
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
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
                ? DetailsLastGame()
                : ('Активна' == state
                    ? ActiveGame()
                    : 'Запланирована' == state
                        ? DetailGame()
                        : DetailsUpcomingGame()),
          ),
        );
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
        style: TextStyle(
                        color: Color.fromARGB(255, 164, 165, 167),
                        fontFamily: "Inter",
                        fontSize: 16,
                      ),
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
