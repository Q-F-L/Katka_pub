import 'package:flutter/material.dart';
import 'package:katka/pages/admin/activeGame.dart';
import 'package:katka/pages/admin/requestGame.dart';
import 'package:katka/pages/qrCodeRead.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AdminDetailGame extends StatefulWidget {
  const AdminDetailGame({super.key});

  @override
  State<AdminDetailGame> createState() => _AdminDetailGameState();
}

class _AdminDetailGameState extends State<AdminDetailGame> {
  List<String> list = ['Список', 'Список1', 'Список2', 'Список3'];

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
        title: const Text('Подробности игры'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                customTextField('Название игры'),
                const SizedBox(
                  height: 12,
                ),
                customTextField('Место проведения'),
                const SizedBox(
                  height: 12,
                ),
                dropButtonFromField(list, 'Режим зомби', 'Режим зомби', true),
                const SizedBox(
                  height: 12,
                ),
                customTextField('Время перерождения зомби'),
                const SizedBox(
                  height: 12,
                ),
                customTextField('Время использования аптечки'),
                const SizedBox(
                  height: 12,
                ),
                dropButtonFromField(list, 'Выберите тип игры', 'Тип игры'),
                const SizedBox(
                  height: 12,
                ),
                dropButtonFromField(list, 'Выберите статус', 'Статус'),
                const SizedBox(
                  height: 12,
                ),
                customTextField('Дата'),
                const SizedBox(
                  height: 12,
                ),
                customTextField('Время'),
                const SizedBox(
                  height: 12,
                ),
                customTextField('Частота обновлений'),
                const SizedBox(
                  height: 12,
                ),
                customTextField('Время запрета аптеки'),
                const SizedBox(
                  height: 12,
                ),
                customTextField('Ограничение по игрокам'),
                const SizedBox(
                  height: 12,
                ),
                customTextField('Полигон'),
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
                  height: 12,
                ),
                customTextField('Цена'),
                const SizedBox(
                  height: 12,
                ),
                customTextField('Цена за полигон'),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Text(
                    'Точки интереса',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                listPoitsInterest(),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Text(
                    'Количество игроков',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ListPalyers(),
                const SizedBox(
                  height: 24,
                ),
                equipment(),
                const SizedBox(
                  height: 24,
                ),
                dropButtonElevetedButton(list, "Обнуление снаряжения"),
                const SizedBox(
                  height: 24,
                ),
                const Center(
                  child: Text(
                    "Оружие зомби",
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
                equipment(),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminActiveGame()),
                    );
                  },
                  child: Text(
                    "Карта",
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
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RequestGame()),
                    );
                  },
                  child: Text(
                    "Заявки",
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
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const qrCodeRead()),
                    );
                  },
                  child: Text(
                    "Проверка игрока",
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
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Опубликовать",
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
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Сохранить",
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
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Удалить",
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
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Завершить игру",
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
        ],
      ),
    );
  }

  Widget equipment() {
    return SizedBox(
      height: 76,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 76,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFF292A2C),
            ),
            child: Image.asset('assets/png/gun.png'),
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            width: 76,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFF292A2C),
            ),
            child: Image.asset('assets/png/rifle.png'),
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            width: 76,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFF292A2C),
            ),
            child: Image.asset('assets/png/granade.png'),
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            width: 76,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFF292A2C),
            ),
            child: Image.asset('assets/png/first_aid_kit.png'),
          ),
          SizedBox(
            width: 12,
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
    );
  }

  Widget customButtom(String title) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "$title",
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
    );
  }

  Widget customTextField(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
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
        TextField(
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
      ],
    );
  }

  Widget dropButtonFromField(
      List<String> list, String defaultValue, String title,
      [bool accent = false]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
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
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 41, 42, 44),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton(
            underline: Container(),
            isDense: true,
            isExpanded: true,
            padding: EdgeInsets.only(right: 14, left: 14, top: 14, bottom: 14),
            icon: Icon(Icons.keyboard_arrow_down),
            iconDisabledColor: Colors.white,
            iconEnabledColor: Colors.white,
            menuMaxHeight: 200,
            elevation: 0,
            borderRadius: BorderRadius.circular(8),
            dropdownColor: Color(0xFF292A2C),
            hint: Text(
              '$title',
              style: TextStyle(
                color: accent ? Colors.white : Color(0xFFA4A5A7),
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            onChanged: (data) {
              print(data);
              setState(() {
                // selectedItem = data as String;
              });
            },
            // decoration: const InputDecoration(
            //   fillColor: Color.fromARGB(255, 41, 42, 44),
            //   border: OutlineInputBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(10)),
            //     borderSide: BorderSide.none,
            //   ),
            // ),
            items: list.map((e) {
              return DropdownMenuItem(
                child: Text(
                  e,
                  style: TextStyle(
                    color: accent ? Colors.white : Color(0xFFA4A5A7),
                    fontFamily: "Inter",
                    fontSize: 16,
                  ),
                ),
                value: e,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget dropButtonElevetedButton(List<String> list, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF6BD1D),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton(
        isDense: true,
        isExpanded: true,
        padding: EdgeInsets.only(right: 14, left: 14, top: 14, bottom: 14),
        icon: Icon(Icons.keyboard_arrow_down),
        iconDisabledColor: Color(0xFF4D1F00),
        iconEnabledColor: Color(0xFF4D1F00),
        menuMaxHeight: 200,
        elevation: 0,
        borderRadius: BorderRadius.circular(8),
        dropdownColor: Color(0xFFF6BD1D),
        hint: Text(
          '$title',
          style: TextStyle(
            color: Color(0xFF4D1F00),
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        onChanged: (data) {
          print(data);
          setState(() {
            // selectedItem = data as String;
          });
        },
        items: list.map((e) {
          return DropdownMenuItem(
            child: Text(
              e,
              style: TextStyle(
                color: Color(0xFF4D1F00),
                fontWeight: FontWeight.w600,
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

  Widget ListPalyers() {
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
            return elemntListPlayer();
          },
        ),
      ),
    );
  }

  Widget elemntListPlayer() {
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

    return Row(
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
            ],
          ),
        ),
      ],
    );
  }

  Widget listPoitsInterest() {
    var _scrollController = ScrollController();

    return Container(
      padding: EdgeInsets.only(right: 8, left: 24, top: 24, bottom: 24),
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
        child: Container(
          padding: EdgeInsets.only(right: 16),
          height: 200,
          decoration: BoxDecoration(
              color: Color(0xFF292A2C), borderRadius: BorderRadius.circular(8)),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              if (index + 1 != 10) {
                return Column(
                  children: [
                    elementPointIntest(),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(color: Color(0xFFA4A5A7)),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                );
              }
              return elementPointIntest();
            },
            clipBehavior: Clip.antiAlias,
          ),
        ),
      ),
    );
  }

  Widget elementPointIntest() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Название',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 16,
              ),
            ),
            const Text(
              'Координаты',
              style: TextStyle(
                color: Color(0xFFA4A5A7),
                fontSize: 16,
                fontFamily: "Inter",
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Уникальный код',
              style: TextStyle(
                color: Color(0xFFA4A5A7),
                fontSize: 16,
                fontFamily: "Inter",
              ),
            ),
          ],
        )
      ],
    );
  }
}
