import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';
import 'package:katka/components/src/listElement.dart';

class ListComands extends StatefulWidget {
  const ListComands({super.key});

  @override
  State<ListComands> createState() => _ListComands();
}

class _ListComands extends State<ListComands> {
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
        title: Text('Команды'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: ListView(
          children: [
            ElementList(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            ElementList(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            ElementList(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            ElementList(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            ElementList(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            ElementList(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            ElementList(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            ElementList(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            ElementList(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            ElementList(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            ElementList(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            ElementList(),
            SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget ElementList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Название команды',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Город',
              style: TextStyle(
                color: Color.fromARGB(255, 164, 165, 167),
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
                Icon(
                  Icons.stars,
                  color: Color.fromARGB(255, 246, 188, 29),
                ),
                Text(
                  '  рейтинг 100',
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
            SizedBox(
              height: 5,
            ),
            Text(
              'Ник командира',
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFFA4A5A7),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
