import 'package:flutter/material.dart';
import 'package:katka/components/src/cordCustom.dart';
import 'package:katka/components/src/listElement.dart';
import 'package:katka/components/src/listElementComandRequest.dart';

class listComandRequest extends StatefulWidget {
  const listComandRequest({super.key});

  @override
  State<listComandRequest> createState() => _listComandRequest();
}

class _listComandRequest extends State<listComandRequest> {
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
        title: const Text('Заявки на вступление в команду'),
        backgroundColor: const Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(
              height: 8,
            ),
            elementList(),
            const Divider(color: Color(0xFFA4A5A7)),
            const SizedBox(
              height: 8,
            ),
            elementList(),
            const Divider(color: Color(0xFFA4A5A7)),
            const SizedBox(
              height: 8,
            ),
            elementList(),
            const Divider(color: Color(0xFFA4A5A7)),
            const SizedBox(
              height: 8,
            ),
            elementList(),
            const Divider(color: Color(0xFFA4A5A7)),
            const SizedBox(
              height: 8,
            ),
            elementList(),
            const Divider(color: Color(0xFFA4A5A7)),
            const SizedBox(
              height: 8,
            ),
            elementList(),
            const Divider(color: Color(0xFFA4A5A7)),
          ],
        ),
      ),
    );
  }

  Widget elementList() {
    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 4)),
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
      child: listElementComandRequest(context),
    );
  }
}
