import 'package:flutter/material.dart';
import 'package:katka/components/src/CityDropdownButtonFromField.dart';
// import 'package:katka/components/src/dropdownButtonFromField.dart';

class adminLogs extends StatefulWidget {
  const adminLogs({super.key});

  @override
  State<adminLogs> createState() => _adminLogsState();
}

class _adminLogsState extends State<adminLogs> {
  List<String> list = ['Список', 'Список1', 'Список2', 'Список3'];

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
        title: Text('Логи игрока'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        children: [
          logView(),
          logElement('Удаление пользователя', 'id 3424',
              date: '20.01.2023 / 20:00'),
          logElement('Действие', 'Где / с чем', date: '20.01.2023 / 20:00'),
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
