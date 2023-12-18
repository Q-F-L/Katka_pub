import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';
import 'package:katka/components/src/listElement.dart';
import 'package:katka/pages/admin/detailPlayer.dart';

class ListPlayers extends StatefulWidget {
  const ListPlayers({super.key});

  @override
  State<ListPlayers> createState() => _ListPlayers();
}

class _ListPlayers extends State<ListPlayers> {
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
        title: Text('Игроки'),
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
    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailPlayer()),
        );
      },
      child: Row(
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
              SizedBox(
                height: 8,
              ),
              Text(
                'ФИО',
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
                'Название команды',
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
      ),
    );
  }
}
