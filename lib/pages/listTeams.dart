import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';
import 'package:katka/components/src/listElement.dart';

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
}
