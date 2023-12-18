import 'package:flutter/material.dart';
import 'package:katka/components/src/CityDropdownButtonFromField.dart';
import 'package:katka/pages/comand.dart';
import 'package:katka/pages/comandCommander.dart';

class CreateComand extends StatefulWidget {
  const CreateComand({super.key});

  @override
  State<CreateComand> createState() => _CreateComandState();
}

class _CreateComandState extends State<CreateComand> {
  List<String> list = ['Список', 'Список1', 'Список2', 'Список3'];

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
        title: Text('Создание команды'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Form(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: IconButton(
                onPressed: () {},
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      size: 50,
                      color: Color.fromRGBO(246, 189, 29, 1),
                    ),
                    Text(
                      'Загрузить лого шиврона',
                      style: TextStyle(
                        color: Color(0xFFA4A5A7),
                      ),
                    ),
                  ],
                ),
              ),
              width: 343,
              height: 248,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color.fromRGBO(41, 42, 44, 1),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              child: IconButton(
                  onPressed: () {},
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        size: 50,
                        color: Color.fromRGBO(246, 189, 29, 1),
                      ),
                      Text(
                        'Загрузить фото команды',
                        style: TextStyle(
                          color: Color(0xFFA4A5A7),
                        ),
                      ),
                    ],
                  )),
              width: 343,
              height: 248,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color.fromRGBO(41, 42, 44, 1),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Color.fromARGB(255, 41, 42, 44),
                hintText: "Название команды",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 164, 165, 167),
                  fontFamily: "Inter",
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            dropButtonFromField(list, "Страна"),
            SizedBox(
              height: 12,
            ),
            dropButtonFromField(list, "Город"),
            SizedBox(
              height: 12,
            ),
            dropButtonFromField(list, "Цвета формы"),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              maxLines: 9,
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                filled: true,
                fillColor: Color(0xFF292A2C),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.all(14),
                hintText: 'Описание команды',
                hintStyle: TextStyle(
                    color: Color(0xFFA4A5A7),
                    fontFamily: 'Inter',
                    fontSize: 16),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ComandCommander()),
                );
              },
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
              child: const Text(
                "Сохранить",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 77, 31, 0),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {},
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
              child: const Text(
                "Отменить",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 77, 31, 0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dropButtonFromField(List<String> list, String defaultValue) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 41, 42, 44),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField(
        menuMaxHeight: 200,
        elevation: 0,
        borderRadius: BorderRadius.circular(8),
        dropdownColor: Color.fromARGB(255, 41, 42, 44),
        hint: Text(
          '$defaultValue',
          style: TextStyle(
            color: Color.fromARGB(255, 164, 165, 167),
            fontFamily: "Inter",
            fontSize: 16,
          ),
        ),
        onChanged: (data) {
          print(data);
          setState(() {
            // selectedItem = data as String;
          });
        },
        decoration: const InputDecoration(
          fillColor: Color.fromARGB(255, 41, 42, 44),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
        ),
        items: list.map((e) {
          return DropdownMenuItem(
            child: Text(
              e,
              style: TextStyle(
                color: Color.fromARGB(255, 164, 165, 167),
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
