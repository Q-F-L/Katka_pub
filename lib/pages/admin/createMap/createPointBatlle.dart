import 'package:flutter/material.dart';
import 'package:katka/pages/admin/createMap/createRoundsFix.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class CreatePointBatlle extends StatefulWidget {
  const CreatePointBatlle({super.key});

  @override
  State<CreatePointBatlle> createState() => _CreatePointBatlleState();
}

class _CreatePointBatlleState extends State<CreatePointBatlle> {
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
        title: const Text('Точка поединка'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1.33,
            height: MediaQuery.of(context).size.height * 0.6,
            child: const YandexMap(
              logoAlignment: MapAlignment(
                horizontal: HorizontalAlignment.right,
                vertical: VerticalAlignment.top,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  elevation: 0,
                  actionsPadding: EdgeInsets.all(24),
                  backgroundColor: Color(0xFF292A2C),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, 'Принять'),
                      child: Text(
                        "Принять",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 77, 31, 0),
                        ),
                      ),
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(Size.fromHeight(50)),
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
                      onPressed: () => Navigator.pop(context, 'Принять'),
                      child: Text(
                        "Отказать",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 77, 31, 0),
                        ),
                      ),
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(Size.fromHeight(50)),
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
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  elevation: 0,
                  actionsPadding: EdgeInsets.all(24),
                  backgroundColor: Color(0xFF292A2C),
                  actions: <Widget>[
                    textFromFieldCustom('Время начала'),
                    SizedBox(
                      height: 12,
                    ),
                    textFromFieldCustom('Время завершения'),
                    SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.pop(context, 'Редактировать поединок'),
                      child: Text(
                        "Редактировать поединок",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 77, 31, 0),
                        ),
                      ),
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(Size.fromHeight(50)),
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
              child: Text(
                "Редактировать",
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  elevation: 0,
                  actionsPadding: EdgeInsets.all(24),
                  backgroundColor: Color(0xFF292A2C),
                  actions: <Widget>[
                    textFromFieldCustom('Время начала'),
                    SizedBox(
                      height: 12,
                    ),
                    textFromFieldCustom('Время завершения'),
                    SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.pop(context, 'Добавить поединок'),
                      child: Text(
                        "Добавить поединок",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 77, 31, 0),
                        ),
                      ),
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(Size.fromHeight(50)),
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
              child: Text(
                "Добавить",
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  elevation: 0,
                  actionsPadding: EdgeInsets.all(24),
                  backgroundColor: Color(0xFF292A2C),
                  actions: <Widget>[
                    textFromFieldCustom('Количество раундов'),
                    SizedBox(
                      height: 12,
                    ),
                    textFromFieldCustom('Время раундов'),
                    SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, 'Сохранить'),
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
                        minimumSize:
                            MaterialStateProperty.all(Size.fromHeight(50)),
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
              child: Text(
                "Генерация раундов",
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateRoundsFix()),
                );
              },
              child: Text(
                "Фиксированные раунды",
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
          )
        ],
      ),
    );
  }

  Widget textFromFieldCustom(String? hintText) {
    return TextFormField(
      style: TextStyle(
                        color: Color.fromARGB(255, 164, 165, 167),
                        fontFamily: "Inter",
                        fontSize: 16,
                      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Color(0xFFA4A5A7)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Color(0xFFA4A5A7)), //<-- SEE HERE
        ),
        // filled: true,
        // fillColor: Color.fromARGB(255, 41, 42, 44),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
          fontFamily: "Inter",
          fontSize: 16,
        ),
      ),
    );
  }

  Widget dropButtonElevetedButton(List<String> list, String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xFFA4A5A7),
        ),
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
            color: Colors.white,
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
                color: Colors.white,
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
}
