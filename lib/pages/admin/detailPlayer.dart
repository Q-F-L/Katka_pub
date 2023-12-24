import 'package:flutter/material.dart';
import 'package:katka/pages/logs.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DetailPlayer extends StatefulWidget {
  const DetailPlayer({super.key});

  @override
  State<DetailPlayer> createState() => _DetailPlayerState();
}

class _DetailPlayerState extends State<DetailPlayer> {
  @override
  Widget build(BuildContext context) {
    bool width = MediaQuery.of(context).size.width > 420;

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
        centerTitle: width ? true : false,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text('Подробности игрока'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                textFromFieldCustom("Фамилия"),
                SizedBox(
                  height: 12,
                ),
                textFromFieldCustom("Имя"),
                SizedBox(
                  height: 12,
                ),
                textFromFieldCustom("Отчество (если есть)"),
                SizedBox(
                  height: 12,
                ),
                textFromFieldCustom("Email"),
                SizedBox(
                  height: 12,
                ),
                textFromFieldCustom("Фамилия"),
                SizedBox(
                  height: 12,
                ),
                textFromFieldCustom("Пароль"),
                SizedBox(
                  height: 12,
                ),
                textFromFieldCustom("Ник"),
                SizedBox(
                  height: 12,
                ),
                textFromFieldCustom("Рейтинг / 100"),
                SizedBox(
                  height: 12,
                ),
                textFromFieldCustom("Город"),
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
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    Container(
                      width: 76,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFF292A2C),
                      ),
                      child: Image.asset('assets/png/gun.png'),
                    ),
                    Container(
                      width: 76,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFF292A2C),
                      ),
                      child: Image.asset('assets/png/rifle.png'),
                    ),
                    Container(
                      width: 76,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFF292A2C),
                      ),
                      child: Image.asset('assets/png/granade.png'),
                    ),
                    Container(
                      width: 76,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFF292A2C),
                      ),
                      child: Image.asset('assets/png/first_aid_kit.png'),
                    ),
                    Container(
                      width: 76,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFF292A2C),
                      ),
                      child: Image.asset('assets/png/knife.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Logs()),
                    );
                  },
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
                  child: const Text(
                    "Логи",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 77, 31, 0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {},
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
                  child: const Text(
                    "Сохранить",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 77, 31, 0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Удалить',
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget textFromFieldCustom(String? hintText) {
    return Container(
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
