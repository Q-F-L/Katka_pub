import 'package:flutter/material.dart';
import 'package:katka/components/src/CityDropdownButtonFromField.dart';
// import 'package:katka/components/src/dropdownButtonFromField.dart';

class Logs extends StatefulWidget {
  const Logs({super.key});

  @override
  State<Logs> createState() => _LogsState();
}

class _LogsState extends State<Logs> {
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
        title: Text('Логи игрока'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        children: [
          logView(),
          logElement('', 'Местонахождение', date: '20.01.2023 / 20:00'),
          logElement(
            'Сканирование qr-кода',
            '231232342',
          ),
        ],
      ),
    );
  }

  Widget logView({String date = 'Дата время', String action = "Действие"}) {
    return Container(
      margin: EdgeInsets.only(bottom: 12, left: 16, right: 16, top: 12),
      padding: EdgeInsets.all(14),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xFF292A2C),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            date,
            style: TextStyle(
              color: Color.fromARGB(255, 164, 165, 167),
              fontFamily: "Inter",
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Действие',
            style: TextStyle(
              color: Color.fromARGB(255, 164, 165, 167),
              fontFamily: "Inter",
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Где / с чем',
            style: TextStyle(
              color: Color.fromARGB(255, 164, 165, 167),
              fontFamily: "Inter",
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget logElement(String action, String where, {String date = 'Дата время'}) {
    return Container(
      margin: EdgeInsets.only(bottom: 12, left: 16, right: 16),
      padding: EdgeInsets.all(14),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xFF292A2C),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            date,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Inter",
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: action.isNotEmpty ? 8 : 0,
          ),
          action.isNotEmpty
              ? Text(
                  action,
                  style: TextStyle(
                    color: Color.fromARGB(255, 164, 165, 167),
                    fontFamily: "Inter",
                    fontSize: 16,
                  ),
                )
              : Container(),
          SizedBox(
            height: where.isNotEmpty ? 8 : 0,
          ),
          where.isNotEmpty
              ? Text(
                  where,
                  style: TextStyle(
                    color: Color.fromARGB(255, 164, 165, 167),
                    fontFamily: "Inter",
                    fontSize: 16,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
