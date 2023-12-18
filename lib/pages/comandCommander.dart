import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';
import 'package:katka/components/src/rating.dart';
import 'package:katka/pages/admin/detailPlayer.dart';
import 'package:katka/pages/admin/requestGame.dart';
import 'package:katka/pages/createComand.dart';
import 'package:katka/pages/detailsLastGame.dart';
import 'package:katka/pages/detailsUpcomingGame.dart';
import 'package:katka/pages/listGame.dart';
import 'package:katka/pages/personal_account.dart';

class ComandCommander extends StatefulWidget {
  const ComandCommander({super.key});

  @override
  State<ComandCommander> createState() => _ComandCommanderState();
}

class _ComandCommanderState extends State<ComandCommander> {
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
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text('Подробности команды'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: ListView(
          children: [
            const SizedBox(
              height: 12,
            ),
            Image.asset(
              'assets/png/logo_team.png',
              width: MediaQuery.of(context).size.width * 0.83,
              height: MediaQuery.of(context).size.width * 0.6,
            ),
            const SizedBox(
              height: 12,
            ),
            Image.asset(
              'assets/png/img_team.png',
              width: MediaQuery.of(context).size.width * 0.83,
              height: MediaQuery.of(context).size.width * 0.6,
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Название",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 6,
            ),
            const Text(
              "Город",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 164, 165, 167),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            rating('рейтинг 100', context),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Количество',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24,
            ),
            const TextField(
              maxLines: 9,
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                filled: true,
                fillColor: Color(0xFF292A2C),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.all(14),
                hintText: 'Описание команды',
                hintStyle: TextStyle(
                    color: Color(0xFFA4A5A7),
                    fontFamily: 'Inter',
                    fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            List(),
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RequestGame()),
                );
              },
              child: Text(
                "Заявки на вступление",
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
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
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
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateComand()),
                );
              },
              child: Text(
                "Изменить",
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
          ],
        ),
      ),
    );
  }

  Widget List() {
    var _scrollController = ScrollController();

    return Container(
      padding: EdgeInsets.only(right: 8, left: 16, top: 10, bottom: 10),
      height: 200,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.001),
      decoration: BoxDecoration(
        color: Color(0xFF292A2C),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.topCenter,
      child: Scrollbar(
        controller: _scrollController,
        thickness: 3,
        thumbVisibility: true,
        trackVisibility: true,
        radius: Radius.circular(10),
        child: ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.only(right: 16),
          itemCount: 10,
          itemBuilder: (context, index) {
            return elemntListComandPlauer();
          },
        ),
      ),
    );
  }

  Widget elemntListComandPlauer() {
    const stringList = ['Выгнать из команды', 'Сделать командиром'];
    String selectedMenu = '';
    final menu = [
      Text(
        stringList[0],
        style: TextStyle(
          color: Color(0xFF4D1F00),
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        stringList[1],
        style: TextStyle(
          color: Color(0xFF4D1F00),
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
        ),
      ),
    ];

    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PersonalAccount()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 35,
            alignment: Alignment.center,
            child: Text(
              'Ник участника',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            height: 35,
            alignment: Alignment.center,
            // decoration: BoxDecoration(
            //   color: Color.fromARGB(255, 246, 188, 29),
            //   borderRadius: BorderRadius.circular(8),
            //   border: Border.all(
            //     width: 1,
            //     color: Color.fromARGB(255, 246, 188, 29),
            //   ),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.stars,
                  color: Color.fromARGB(255, 246, 188, 29),
                ),
                Text(
                  ' рейтинг 100',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 10,
                ),
                MenuAnchor(
                  style: MenuStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFF6BD1D)),
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          left: 24, right: 24, top: 12, bottom: 12))),
                  builder: (BuildContext context, MenuController controller,
                      Widget? child) {
                    return IconButton(
                      splashRadius: 1,
                      onPressed: () {
                        if (controller.isOpen) {
                          controller.close();
                        } else {
                          controller.open();
                        }
                      },
                      icon: Image.asset(
                        'assets/png/menu.png',
                        scale: 1.5,
                      ),
                      tooltip: 'Show menu',
                    );
                  },
                  menuChildren: menu,
                ),
              ],
            ),
          ),
        ],
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
                  PredGame2(),
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
}
