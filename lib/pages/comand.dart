import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';
import 'package:katka/components/src/rating.dart';
import 'package:katka/pages/detailsLastGame.dart';
import 'package:katka/pages/detailsUpcomingGame.dart';

class Comand extends StatefulWidget {
  const Comand({super.key});

  @override
  State<Comand> createState() => _ComandState();
}

class _ComandState extends State<Comand> {
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
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              decoration: BoxDecoration(
                color: Color(0xFF292A2C),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      'Ник командира',
                      style: TextStyle(
                        color: Color(0xFFA4A5A7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 246, 188, 29),
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
                          color: Color(0xFF4D1F00),
                        ),
                        Text(
                          ' рейтинг 100',
                          style: TextStyle(
                              color: Color(0xFF4D1F00),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
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
            const Text(
              'Количество',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            listPlayer(),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Прошедшие игры',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
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
              onPressed: () {},
              child: Text(
                "Покинуть",
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

  Widget listPlayer() {
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
            return elementPlayer();
          },
        ),
      ),
    );
  }

  Widget elementPlayer() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: const Text(
              'Ник участника',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 16,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 2,
            child: const Row(
              children: [
                Icon(
                  Icons.stars,
                  color: Color.fromARGB(255, 246, 188, 29),
                ),
                Text(
                  ' рейтинг 100',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
