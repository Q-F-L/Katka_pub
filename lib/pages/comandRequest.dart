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
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 0, 0, 4)),
              ),
              onPressed: () {},
              child: listElementComandRequest(context),
            ),
            const Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 8, 0, 4)),
              ),
              onPressed: () {},
              child: listElementComandRequest(context),
            ),
            Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 8, 0, 4)),
              ),
              onPressed: () {},
              child: listElementComandRequest(context),
            ),
            Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 8, 0, 4)),
              ),
              onPressed: () {},
              child: listElementComandRequest(context),
            ),
            Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 8, 0, 4)),
              ),
              onPressed: () {},
              child: listElementComandRequest(context),
            ),
            Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 8, 0, 4)),
              ),
              onPressed: () {},
              child: listElementComandRequest(context),
            ),
            Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 8, 0, 4)),
              ),
              onPressed: () {},
              child: listElementComandRequest(context),
            ),
            Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 8, 0, 4)),
              ),
              onPressed: () {},
              child: listElementComandRequest(context),
            ),
            Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 8, 0, 4)),
              ),
              onPressed: () {},
              child: listElementComandRequest(context),
            ),
            Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 8, 0, 4)),
              ),
              onPressed: () {},
              child: listElementComandRequest(context),
            ),
            Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 8, 0, 4)),
              ),
              onPressed: () {},
              child: listElementComandRequest(context),
            ),
            Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 8, 0, 4)),
              ),
              onPressed: () {},
              child: listElementComandRequest(context),
            ),
            Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 8, 0, 4)),
              ),
              onPressed: () {},
              child: listElementComandRequest(context),
            ),
            Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 8, 0, 4)),
              ),
              onPressed: () {},
              child: listElementComandRequest(context),
            ),
            Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 8, 0, 4)),
              ),
              onPressed: () {},
              child: listElementComandRequest(context),
            ),
            Divider(color: Color(0xFFA4A5A7)),
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding:
                    MaterialStateProperty.all(EdgeInsets.fromLTRB(0, 8, 0, 4)),
              ),
              onPressed: () {},
              child: listElementComandRequest(context),
            ),
            Divider(color: Color(0xFFA4A5A7)),
          ],
        ),
      ),
    );
  }
}
