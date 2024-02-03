import 'dart:io';

import 'package:flutter/material.dart';
import 'package:katka/components/src/CityDropdownButtonFromField.dart';
import 'package:katka/global_value.dart';
// import 'package:katka/components/src/dropdownButtonFromField.dart';

class EditUser extends StatefulWidget {
  const EditUser({super.key});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  String selectedItem = 'Список';
  String? imageUrl;
  File? imagePathPhone;
  List<String> list = ['Список', 'Список1', 'Список2', 'Список3'];
  TextEditingController nicknameTextInputController = TextEditingController();
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController surnameTextInputController = TextEditingController();
  TextEditingController nameTextInputController = TextEditingController();
  TextEditingController patronymicTextInputController = TextEditingController();
  String? city = '';
  String? command = '';
  TextEditingController typeTextInputController = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  String text = "";

  @override
  void initState() {
    // TODO: implement initState
    nicknameTextInputController.text = userGlobal.nickname ?? '';
    nameTextInputController.text = userGlobal.name ?? '';
    emailTextInputController.text = userGlobal.email ?? '';
    imageUrl = userGlobal.photoUrl ?? '';
    surnameTextInputController.text = userGlobal.surname ?? '';
    patronymicTextInputController.text = userGlobal.patronymic ?? '';
    city = userGlobal.city ?? '';
    super.initState();
  }

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
        title: Text('Изменение личных данных пользателем'),
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
            const SizedBox(
              height: 12,
            ),
            textFromFieldCustom("Ник", nicknameTextInputController),
            const SizedBox(
              height: 12,
            ),
            textFromFieldCustom("Фамилия", surnameTextInputController),
            const SizedBox(
              height: 12,
            ),
            textFromFieldCustom("Имя", nameTextInputController),
            const SizedBox(
              height: 12,
            ),
            textFromFieldCustom(
                "Отчество (если есть)", patronymicTextInputController),
            const SizedBox(
              height: 12,
            ),
            textFromFieldCustom("Email", emailTextInputController),
            const SizedBox(
              height: 12,
            ),
            dropCityButtonFromField(list, city ?? 'Город'),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  // userGlobal.editUser();
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
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/png/avatar.png',
          width: MediaQuery.of(context).size.width * 0.83,
          height: MediaQuery.of(context).size.width * 0.6,
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
    );
  }

  Widget dropCityButtonFromField(List<String> list, String defaultValue) {
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
          city = data;
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

  Widget dropCommandButtonFromField(List<String> list, String defaultValue) {
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
          command = data;
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

  Widget textEmailFromFieldCustom(
      String? hintText, TextEditingController? emailTextInputController) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        autocorrect: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        controller: emailTextInputController,
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

  Widget textFromFieldCustom(String? hintText,
      [TextEditingController? TextInputController]) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        autocorrect: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: TextInputController,
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
