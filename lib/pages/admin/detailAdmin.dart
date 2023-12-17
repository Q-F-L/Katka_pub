import 'package:flutter/material.dart';
import 'package:katka/components/src/CityDropdownButtonFromField.dart';
// import 'package:katka/components/src/dropdownButtonFromField.dart';

class DetailAdmin extends StatefulWidget {
  const DetailAdmin({super.key});

  @override
  State<DetailAdmin> createState() => _DetailAdminState();
}

class _DetailAdminState extends State<DetailAdmin> {
  List<String> list = ['Список', 'Список1', 'Список2', 'Список3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Администратор'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Form(
        child: ListView(
          children: [
            SizedBox(
              height: 12,
            ),
            textFromFieldCustom("ФИО"),
            SizedBox(
              height: 12,
            ),
            textFromFieldCustom("Логин"),
            SizedBox(
              height: 12,
            ),
            textFromFieldCustom("Статус"),
            SizedBox(
              height: 12,
            ),
            textFromFieldCustom("Email"),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Color.fromARGB(255, 41, 42, 44),
                  hintText: "Мобильный телефон",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 164, 165, 167),
                    fontFamily: "Inter",
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            textFromFieldCustom("Город"),
            SizedBox(
              height: 24,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              child: Text(
                'Прошедшие игры',
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
            listPredGame1(),
            SizedBox(
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
            listPredGame2(),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  "Генерировать новый пароль",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 77, 31, 0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  "Сохранить",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 77, 31, 0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  "Отменить",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 77, 31, 0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  "Логи",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 77, 31, 0),
                  ),
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

  Widget listPredGame1() {
    var _scrollController = ScrollController();

    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      padding: EdgeInsets.only(right: 8, left: 24, top: 24, bottom: 24),
      height: 200,
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
                    PredGame1(),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(color: Colors.black),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                );
              }
              return PredGame1();
            },
            clipBehavior: Clip.antiAlias,
          ),
        ),
      ),
    );
  }

  Widget PredGame1() {
    return Container(
      child: Column(
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
      ),
    );
  }

  Widget listPredGame2() {
    var _scrollController = ScrollController();

    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      padding: EdgeInsets.only(right: 8, left: 24, top: 24, bottom: 24),
      height: 200,
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
                    PredGame2(),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(color: Colors.black),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                );
              }
              return PredGame2();
            },
            clipBehavior: Clip.antiAlias,
          ),
        ),
      ),
    );
  }

  Widget PredGame2() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Название',
                style: TextStyle(
                    color: Color(0xFFA4A5A7),
                    fontSize: 16,
                    fontFamily: "Inter"),
              ),
              const Text(
                'Дата',
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
      ),
    );
  }
}
