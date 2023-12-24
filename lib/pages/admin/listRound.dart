import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';
import 'package:katka/components/src/listElement.dart';

class ListRound extends StatefulWidget {
  const ListRound({super.key});

  @override
  State<ListRound> createState() => _ListRoundStatus();
}

class _ListRoundStatus extends State<ListRound> {
  @override
  Widget build(BuildContext context) {
    bool width = MediaQuery.of(context).size.width > 420;

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
              height: 8,
            ),
            ElementList(),
            SizedBox(
              height: 8,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 8,
            ),
            ElementList(),
            SizedBox(
              height: 8,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 8,
            ),
            ElementList(),
            SizedBox(
              height: 8,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 8,
            ),
            ElementList(),
            SizedBox(
              height: 8,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 8,
            ),
            ElementList(),
            SizedBox(
              height: 8,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 8,
            ),
            ElementList(),
            SizedBox(
              height: 8,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 8,
            ),
            ElementList(),
            SizedBox(
              height: 8,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 8,
            ),
            ElementList(),
            SizedBox(
              height: 8,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 8,
            ),
            ElementList(),
            SizedBox(
              height: 8,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 8,
            ),
            ElementList(),
            SizedBox(
              height: 8,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 8,
            ),
            ElementList(),
            SizedBox(
              height: 8,
            ),
            Divider(color: Color(0xFFA4A5A7)),
            SizedBox(
              height: 8,
            ),
            ElementList(),
            SizedBox(
              height: 8,
            ),
            Divider(color: Color(0xFFA4A5A7)),
          ],
        ),
      ),
    );
  }

  Widget ElementList() {
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
            textFromFieldCustom("Время раунда"),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'Принять'),
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
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '10:00',
                style: TextStyle(
                  color: Color(0xFFA4A5A7),
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            '#1',
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
}
