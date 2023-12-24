import 'package:flutter/material.dart';
import 'package:katka/components/src/CityDropdownButtonFromField.dart';
import 'package:katka/pages/admin/detailAdmin.dart';
// import 'package:katka/components/src/dropdownButtonFromField.dart';

class CreateNewAdmin extends StatefulWidget {
  const CreateNewAdmin({super.key});

  @override
  State<CreateNewAdmin> createState() => _CreateNewAdminState();
}

class _CreateNewAdminState extends State<CreateNewAdmin> {
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
        title: Text('Добавление администратора'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                textFromFieldCustom("Фамилия"),
                SizedBox(
                  height: 12,
                ),
                textFromFieldCustom("Имя"),
                SizedBox(
                  height: 12,
                ),
                textFromFieldCustom("Отчество (если есть)"),
                SizedBox(
                  height: 12,
                ),
                textFromFieldCustom("Email"),
                SizedBox(
                  height: 12,
                ),
                dropButtonFromField(list, "Город"),
                SizedBox(
                  height: 12,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    style: TextStyle(
                        color: Color.fromARGB(255, 164, 165, 167),
                        fontFamily: "Inter",
                        fontSize: 16,
                      ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Color.fromARGB(255, 41, 42, 44),
                      hintText: "Пароль",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 164, 165, 167),
                        fontFamily: "Inter",
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    style: TextStyle(
                        color: Color.fromARGB(255, 164, 165, 167),
                        fontFamily: "Inter",
                        fontSize: 16,
                      ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Color.fromARGB(255, 41, 42, 44),
                      hintText: "Мобильный телефон",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 164, 165, 167),
                        fontFamily: "Inter",
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 24),
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailAdmin()),
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
                  "Создать администратора",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 77, 31, 0),
                  ),
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
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
        },
        decoration: InputDecoration(
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

  Widget textFromFieldCustom(String? hintText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        style: TextStyle(
                        color: Color.fromARGB(255, 164, 165, 167),
                        fontFamily: "Inter",
                        fontSize: 16,
                      ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Color.fromARGB(255, 41, 42, 44),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 164, 165, 167),
            fontFamily: "Inter",
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
