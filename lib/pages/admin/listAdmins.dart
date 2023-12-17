import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';
import 'package:katka/components/src/listElement.dart';

class ListAdmins extends StatefulWidget {
  const ListAdmins({super.key});

  @override
  State<ListAdmins> createState() => _ListAdmins();
}

class _DoubleTapChecker<T> {
  T? _lastSelectedItem;
  DateTime _lastTimestamp = DateTime.now();

  bool isDoubleTap(T item) {
    if (_lastSelectedItem == null || _lastSelectedItem != item) {
      _lastSelectedItem = item;
      _lastTimestamp = DateTime.now();
      return false;
    }

    final currentTimestamp = DateTime.now();
    final duration = currentTimestamp.difference(_lastTimestamp).inMilliseconds;
    _lastTimestamp = DateTime.now();
    print(
        "last: $_lastTimestamp, current: $currentTimestamp, duration: $duration");
    return duration < 400;
  }
}

class _ListAdmins extends State<ListAdmins> {
  List<ListGamesData> data = [];
  final doubleTapChecker = _DoubleTapChecker<ListGamesData>();
  String doubleTapText = "double tap result here";

  void _initializeData() {
    data = [
      ListGamesData(
        name: "Имамбек Владимир О.",
        city: "Москва",
        state: "Системный",
      ),
      ListGamesData(
        name: "Имамбек Владимир О.",
        city: "Москва",
        state: "Игровой",
      ),
    ];
  }

  @override
  void initState() {
    _initializeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Color(0xFF292A2C),
        elevation: 0,
        child: Image.asset('assets/png/plus.png'),
        onPressed: () {},
      ),
      appBar: AppBar(
        title: Text('Список команд'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
        child: ListView(
          children: [
            DataTable(
              dataRowMaxHeight: 64,
              dataRowMinHeight: 60,
              headingRowHeight: 64,
              dataTextStyle: TextStyle(
                fontFamily: "Inter",
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              showCheckboxColumn: false,
              horizontalMargin: 0,
              columnSpacing: MediaQuery.of(context).size.width * 0.13,
              border: const TableBorder(
                bottom: BorderSide(width: 1, color: Color(0xFFA4A5A7)),
                horizontalInside:
                    BorderSide(width: 1, color: Color(0xFFA4A5A7)),
              ),
              columns: [
                DataColumn(
                  label: Text(
                    'ФИО',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFA4A5A7),
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Город',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFA4A5A7),
                    ),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: MediaQuery.of(context).size.width * 0.24,
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Статус',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFA4A5A7),
                      ),
                    ),
                  ),
                ),
              ],
              rows: data
                  .map(
                    (e) => DataRow(
                      onSelectChanged: ((selected) {
                        setState(() {
                          if (doubleTapChecker.isDoubleTap(e)) {
                            doubleTapText = "1 ${e.name}";
                            return;
                          }
                          doubleTapText = "2 ${e.city}";
                        });
                      }),
                      cells: [
                        DataCell(
                          Text(
                            e.name,
                          ),
                        ),
                        DataCell(
                          Center(
                            child: Text(
                              e.city,
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            width: MediaQuery.of(context).size.width * 0.24,
                            alignment: Alignment.centerRight,
                            child: Text(
                              e.state,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

class ListGamesData {
  final String name;
  final String city;
  final String state;

  ListGamesData({
    required this.name,
    required this.city,
    required this.state,
  });

  @override
  bool operator ==(Object other) {
    return other is ListGamesData && other.hashCode == hashCode;
  }

  @override
  int get hashCode => Object.hash(name, city, state);
}
