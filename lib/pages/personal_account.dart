import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';

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
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.83,
              height: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.grey),
              child: Image.asset(
                'assets/png/avatar.png',
              ),
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
                onPressed: () {},
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
                onPressed: () {},
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              height: 200,
              decoration: BoxDecoration(
                  color: Color(0xFF292A2C),
                  borderRadius: BorderRadius.circular(8)),
              child: ListView(
                clipBehavior: Clip.antiAlias,
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
                  Divider(color: Colors.black),
                  SizedBox(
                    height: 12,
                  ),
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
            ),
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              height: 200,
              decoration: BoxDecoration(
                  color: Color(0xFF292A2C),
                  borderRadius: BorderRadius.circular(8)),
              child: ListView(
                clipBehavior: Clip.antiAlias,
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
                  Divider(color: Colors.black),
                  SizedBox(
                    height: 12,
                  ),
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
            ),
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              height: 200,
              decoration: BoxDecoration(
                  color: Color(0xFF292A2C),
                  borderRadius: BorderRadius.circular(8)),
              child: ListView(
                clipBehavior: Clip.antiAlias,
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
                  Divider(color: Colors.black),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Flexible(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {},
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
                onPressed: () {},
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
}
