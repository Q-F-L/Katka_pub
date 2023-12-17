import 'package:flutter/material.dart';
import 'package:katka/components/src/CityDropdownButtonFromField.dart';
// import 'package:katka/components/src/dropdownButtonFromField.dart';

class EditUser extends StatefulWidget {
  const EditUser({super.key});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  List<String> list = ['Список', 'Список1', 'Список2', 'Список3'];
  String selectedItem = 'Список';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Form(
        child: ListView(
          children: [
            SizedBox(
              height: 12,
            ),
            editImage(),
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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Color.fromARGB(255, 41, 42, 44),
                  hintText: "Повторите пароль",
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
            dropButtonFromField(list, "Команды"),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
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
                  "Сохранить",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 77, 31, 0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
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
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget editImage() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.83,
        height: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.grey),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.83,
              height: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.grey),
              child: Image.asset(
                'assets/png/avatar.png',
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Изменить фото",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ));
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
          setState(() {
            selectedItem = data as String;
          });
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
