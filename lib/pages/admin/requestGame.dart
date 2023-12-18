import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';
import 'package:katka/components/src/listElement.dart';

class RequestGame extends StatefulWidget {
  const RequestGame({super.key});

  @override
  State<RequestGame> createState() => _RequestGameStatus();
}

class _RequestGameStatus extends State<RequestGame> {
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
        title: Text('Команды'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(
              height: 4,
            ),
            ElementList(width),
            SizedBox(
              height: 4,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 4,
            ),
            ElementList(width),
            SizedBox(
              height: 4,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 4,
            ),
            ElementList(width),
            SizedBox(
              height: 4,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 4,
            ),
            ElementList(width),
            SizedBox(
              height: 4,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 4,
            ),
            ElementList(width),
            SizedBox(
              height: 4,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 4,
            ),
            ElementList(width),
            SizedBox(
              height: 4,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 4,
            ),
            ElementList(width),
            SizedBox(
              height: 4,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 4,
            ),
            ElementList(width),
            SizedBox(
              height: 4,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 4,
            ),
            ElementList(width),
            SizedBox(
              height: 4,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 4,
            ),
            ElementList(width),
            SizedBox(
              height: 4,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 4,
            ),
            ElementList(width),
            SizedBox(
              height: 4,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 4,
            ),
            ElementList(width),
            SizedBox(
              height: 4,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget ElementList(bool width) {
    List<String> list = ['Список', 'Список1', 'Список2', 'Список3'];

    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        elevation: MaterialStateProperty.all(0),
      ),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          elevation: 0,
          actionsPadding: EdgeInsets.all(24),
          backgroundColor: Color(0xFF292A2C),
          actions: <Widget>[
            dropButtonElevetedButton(list, "Изменить статус"),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'Принять'),
              child: Text(
                "Принята",
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
      child: !width
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ник',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Статус',
                          style: TextStyle(
                            fontFamily: "Inter",
                            color: Color(0xFFA4A5A7),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Icon(
                          Icons.stars,
                          color: Color.fromARGB(255, 246, 188, 29),
                        ),
                        Text(
                          ' рейтинг 100',
                          style: TextStyle(
                            fontFamily: "Inter",
                            color: Color(0xFFF6BD1D),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ник',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Статус',
                  style: TextStyle(
                    fontFamily: "Inter",
                    color: Color(0xFFA4A5A7),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.end,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.stars,
                      color: Color.fromARGB(255, 246, 188, 29),
                    ),
                    Text(
                      ' рейтинг 100',
                      style: TextStyle(
                        fontFamily: "Inter",
                        color: Color(0xFFF6BD1D),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
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
