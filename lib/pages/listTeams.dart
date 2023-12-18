import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';
import 'package:katka/pages/comand.dart';

class ListTeams extends StatefulWidget {
  const ListTeams({super.key});

  @override
  State<ListTeams> createState() => _ListTeams();
}

class _ListTeams extends State<ListTeams> {
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
        title: Text('Список команд'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: ListView(
          children: [
            listElement(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            listElement(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            listElement(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            listElement(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            listElement(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            listElement(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            listElement(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            listElement(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            listElement(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            listElement(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            listElement(),
            SizedBox(
              height: 4,
            ),
            Divider(color: Colors.black),
            SizedBox(
              height: 4,
            ),
            listElement(),
            SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget listElement() {
    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Comand()),
        );
      },
      child: Row(
        children: [
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Название',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
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
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Text(
              'кол-во',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
