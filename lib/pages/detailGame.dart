import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DetailGame extends StatefulWidget {
  const DetailGame({super.key});

  @override
  State<DetailGame> createState() => _DetailGameState();
}

class _DetailGameState extends State<DetailGame> {
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
        title: const Text('Название игры'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Название игры",
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
                  "Место проведения (Регион/Город)",
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
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.23),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color: Color.fromARGB(255, 246, 188, 29),
                    ),
                  ),
                  child: const Text(
                    'Статус',
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "21/100",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Цена: ",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFA4A5A7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "500 ₽",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const Text(
                  "(за полигон 700 ₽)",
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
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Активные в игре режимы",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 164, 165, 167),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const TextField(
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
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Дата",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 164, 165, 167),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const TextField(
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
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Время",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 164, 165, 167),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const TextField(
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
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Частота обновлений",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 164, 165, 167),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const TextField(
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
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Время запрета аптеки",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 164, 165, 167),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const TextField(
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
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Время перерождения зомби",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 164, 165, 167),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const TextField(
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
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Время использования аптечки",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 164, 165, 167),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const TextField(
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
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Описание игры",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 164, 165, 167),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const TextField(
                  style: TextStyle(
                        color: Color.fromARGB(255, 164, 165, 167),
                        fontFamily: "Inter",
                        fontSize: 16,
                      ),
                  maxLines: 9,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Color.fromARGB(255, 41, 42, 44),
                  ),
                ),
                const SizedBox(
                  height: 24,
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
                    "Список игроков",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 77, 31, 0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Center(
                  child: Text(
                    "Предметы на старте игры",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
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
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 1.33,
            height: MediaQuery.of(context).size.height * 0.397,
            child: YandexMap(),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 24),
            child: ElevatedButton(
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
                "Подать заявку",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 77, 31, 0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
