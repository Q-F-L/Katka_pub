import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';
import 'package:katka/pages/admin/listComand.dart';
import 'package:katka/pages/createComand.dart';
import 'package:katka/pages/detailsLastGame.dart';
import 'package:katka/pages/detailsUpcomingGame.dart';
import 'package:katka/pages/editUser.dart';
import 'package:katka/pages/listGame.dart';
import 'package:katka/pages/listTeams.dart';

class PersonalAccount extends StatefulWidget {
  const PersonalAccount({super.key});

  @override
  State<PersonalAccount> createState() => _PersonalAccount();
}

class _PersonalAccount extends State<PersonalAccount> {
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
        title: Text('Личный кабинет'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(
              height: 12,
            ),
            Image.asset(
              'assets/png/avatar.png',
              width: MediaQuery.of(context).size.width * 0.83,
              height: MediaQuery.of(context).size.width * 0.6,
            ),
            SizedBox(
              height: 12,
            ),
            cardCustom('Ник игрока', 'рейтинг 100'),
            SizedBox(
              height: 12,
            ),
            cardCustom('Название команды', 'рейтинг 100'),
            SizedBox(
              height: 24,
            ),
            Flexible(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListTeams()),
                  );
                },
                child: Text(
                  "Найти команду",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 77, 31, 0),
                  ),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size.fromHeight(50)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Color.fromARGB(255, 246, 188, 29)),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Flexible(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateComand()),
                  );
                },
                child: Text(
                  "Создать команду",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 77, 31, 0),
                  ),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size.fromHeight(50)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Color.fromARGB(255, 246, 188, 29)),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Прошедшие игры',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 12,
            ),
            listPredGame1(),
            SizedBox(
              height: 24,
            ),
            Text(
              'Предстоящие игры',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 12,
            ),
            listPredGame2(),
            SizedBox(
              height: 24,
            ),
            Text(
              'Бонусы',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 12,
            ),
            listPredGame3(),
            SizedBox(
              height: 24,
            ),
            Flexible(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListGame()),
                  );
                },
                child: Text(
                  "Игры",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 77, 31, 0),
                  ),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size.fromHeight(50)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Color.fromARGB(255, 246, 188, 29)),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Flexible(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditUser()),
                  );
                },
                child: Text(
                  "Изменить личные данные",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 77, 31, 0),
                  ),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size.fromHeight(50)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Color.fromARGB(255, 246, 188, 29)),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget listPredGame1() {
    var _scrollController = ScrollController();

    return Container(
      padding: EdgeInsets.only(right: 8, left: 24, top: 24, bottom: 24),
      height: 200,
      decoration: BoxDecoration(
          color: Color(0xFF292A2C), borderRadius: BorderRadius.circular(8)),
      child: Scrollbar(
        controller: _scrollController,
        thickness: 3,
        thumbVisibility: true,
        trackVisibility: true,
        radius: Radius.circular(10),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 10,
          padding: EdgeInsets.only(right: 16),
          clipBehavior: Clip.antiAlias,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Название игры',
                        style: TextStyle(
                          color: Color(0xFFA4A5A7),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Дата',
                        style: TextStyle(
                          color: Color(0xFFA4A5A7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Активные в игре режимы',
                        style: TextStyle(
                          color: Color(0xFFA4A5A7),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Статус',
                        style: TextStyle(
                          color: Color(0xFFA4A5A7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(color: Color(0xFFA4A5A7)),
                  SizedBox(
                    height: 12,
                  ),
                ],
              );
            }
            if (10 != index) {
              return Column(
                children: [
                  PredGame1(),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(color: Color(0xFFA4A5A7)),
                  SizedBox(
                    height: 12,
                  ),
                ],
              );
            }
            return PredGame1();
          },
        ),
      ),
    );
  }

  Widget PredGame1() {
    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailsLastGame()),
        );
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Катка 1',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                ),
              ),
              Text(
                '21.06.2024',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Аркада, Зомби',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                ),
              ),
              Text(
                '1',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listPredGame2() {
    var _scrollController = ScrollController();

    return Container(
      padding: EdgeInsets.only(right: 8, left: 24, top: 24, bottom: 24),
      height: 200,
      decoration: BoxDecoration(
          color: Color(0xFF292A2C), borderRadius: BorderRadius.circular(8)),
      child: Scrollbar(
        controller: _scrollController,
        thickness: 3,
        thumbVisibility: true,
        trackVisibility: true,
        radius: Radius.circular(10),
        child: ListView.builder(
          itemCount: 10,
          controller: _scrollController,
          padding: EdgeInsets.only(right: 16),
          clipBehavior: Clip.antiAlias,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Название игры',
                        style: TextStyle(
                          color: Color(0xFFA4A5A7),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Дата',
                        style: TextStyle(
                          color: Color(0xFFA4A5A7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Активные в игре режимы',
                        style: TextStyle(
                          color: Color(0xFFA4A5A7),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Статус',
                        style: TextStyle(
                          color: Color(0xFFA4A5A7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(color: Color(0xFFA4A5A7)),
                  SizedBox(
                    height: 12,
                  ),
                ],
              );
            }
            if (10 != index) {
              return Column(
                children: [
                  PredGame1(),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(color: Color(0xFFA4A5A7)),
                  SizedBox(
                    height: 12,
                  ),
                ],
              );
            }
            return PredGame1();
          },
        ),
      ),
    );
  }

  Widget PredGame2() {
    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailsUpcomingGame()),
        );
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Катка 1',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              Text(
                '21.06.2024',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Аркада, Зомби',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              Text(
                '1',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listPredGame3() {
    var _scrollController = ScrollController();

    return Container(
      padding: EdgeInsets.only(right: 8, left: 24, top: 24, bottom: 24),
      height: 200,
      decoration: BoxDecoration(
          color: Color(0xFF292A2C), borderRadius: BorderRadius.circular(8)),
      child: Scrollbar(
        controller: _scrollController,
        thickness: 3,
        thumbVisibility: true,
        trackVisibility: true,
        radius: Radius.circular(10),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 10,
          padding: EdgeInsets.only(right: 16),
          clipBehavior: Clip.antiAlias,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Название игры',
                      style: TextStyle(
                        color: Color(0xFFA4A5A7),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Дата',
                      style: TextStyle(
                        color: Color(0xFFA4A5A7),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Описание',
                      style: TextStyle(
                        color: Color(0xFFA4A5A7),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Кем выдан',
                      style: TextStyle(
                        color: Color(0xFFA4A5A7),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(color: Color(0xFFA4A5A7)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget PredGame3() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Катка 1',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 16,
              ),
            ),
            Text(
              '21.06.2024',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Аркада, Зомби',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 16,
              ),
            ),
            Text(
              '1',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
