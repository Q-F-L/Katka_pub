import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:katka/components/src/CityDropdownButtonFromField.dart';
import 'package:katka/firebase/command/firestore_constans.dart';
import 'package:katka/global_value.dart';
import 'package:katka/pages/comand.dart';
import 'package:katka/pages/comandCommander.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod/riverpod.dart';

class CreateComand extends StatefulWidget {
  const CreateComand({super.key});

  @override
  State<CreateComand> createState() => _CreateComandState();
}

class _CreateComandState extends State<CreateComand> {
  List<String> list = ['Список', 'Список1', 'Список2', 'Список3'];
  File? imageLogoPathPhone;
  File? imageCommandPathPhone;
  String? city, country, color, imageUrlCommand, imageUrlLogo;
  TextEditingController commandTextInputController = TextEditingController();
  TextEditingController descriptionTextInputController =
      TextEditingController();
  final fromKey = GlobalKey<FormState>();
  var random = Random().nextInt(4294967290);
  bool _isLoading = false;

  Future<void> createCommand() async {
    _isLoading = true;
    final navigator = Navigator.of(context);
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final QuerySnapshot result = await firebaseFirestore
        .collection(FirestoreConstantsCommand.pathCommandCollection)
        .where(FirestoreConstantsCommand.id, isEqualTo: random)
        .get();

    final List<DocumentSnapshot> document = result.docs;
    print(document.length);
    if (document.length == 0) {
      //Загрузка в Хранилище изображений
      uploadImageCommand();
      uploadImageLogo();
      commandGlobal.id = random;
      //Загрузка в БД данныз
      await firebaseFirestore
          .collection(FirestoreConstantsCommand.pathCommandCollection)
          .doc("$random")
          .set({
        FirestoreConstantsCommand.imageLogoPath: 'images/Logo$random',
        FirestoreConstantsCommand.imageCommandPath: 'images/Command$random',
        FirestoreConstantsCommand.city: city,
        FirestoreConstantsCommand.colorUniform: color,
        FirestoreConstantsCommand.country: country,
        FirestoreConstantsCommand.name: commandTextInputController.text.trim(),
        FirestoreConstantsCommand.type: "command",
        FirestoreConstantsCommand.nameCommander: userGlobal.nickname,
        FirestoreConstantsCommand.description:
            descriptionTextInputController.text.trim(),
        FirestoreConstantsCommand.id: random,
        FirestoreConstantsCommand.listPlayers: [
          FirebaseAuth.instance.currentUser!.uid
        ],
        FirestoreConstantsCommand.commander:
            FirebaseAuth.instance.currentUser!.uid,
        FirestoreConstantsCommand.rationgCommand: 0,
        "createAt": DateTime.now().millisecondsSinceEpoch.toString(),
      });

      CollectionReference commandF = FirebaseFirestore.instance
          .collection(FirestoreConstantsCommand.pathCommandCollection);

      // Future<void> commandA = commandF
      //     .doc("$random")
      //     .update({'company': 'Stokes and Sons'})
      //     .then((value) => print("Command Updated"))
      //     .catchError((error) => print("Failed to update command: $error"));
    }

    navigator.pushNamedAndRemoveUntil('/command', (route) => false);
  }

  uploadImagePhoneLogo() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    //Check Permissions

    if (Platform.isAndroid) {
      await Permission.storage.request();
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        var permissionStatus = await Permission.storage.status;
        if (permissionStatus.isGranted) {
          //Select Image
          var image = await _imagePicker.pickImage(source: ImageSource.gallery);
          var file = File(image?.path ?? '');

          if (image != null) {
            setState(() {
              imageLogoPathPhone = file;
            });
          } else {
            print('No Image Path Received');
          }
        } else {
          print('Permission not granted. Try Again with permission access');
        }
      } else {
        await Permission.photos.request();
        var permissionStatus = await Permission.photos.status;
        if (permissionStatus.isGranted) {
          //Select Image
          var image = await _imagePicker.pickImage(source: ImageSource.gallery);
          var file = File(image?.path ?? '');

          if (image != null) {
            setState(() {
              imageLogoPathPhone = file;
            });
          } else {
            print('No Image Path Received');
          }
        } else {
          print('Permission not granted. Try Again with permission access');
        }
      }
    }
  }

  uploadImagePhoneCommand() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    //Check Permissions

    if (Platform.isAndroid) {
      await Permission.storage.request();
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        var permissionStatus = await Permission.storage.status;
        if (permissionStatus.isGranted) {
          //Select Image
          var image = await _imagePicker.pickImage(source: ImageSource.gallery);
          var file = File(image?.path ?? '');

          if (image != null) {
            setState(() {
              imageCommandPathPhone = file;
            });
          } else {
            print('No Image Path Received');
          }
        } else {
          print('Permission not granted. Try Again with permission access');
        }
      } else {
        await Permission.photos.request();
        var permissionStatus = await Permission.photos.status;
        if (permissionStatus.isGranted) {
          //Select Image
          var image = await _imagePicker.pickImage(source: ImageSource.gallery);
          var file = File(image?.path ?? '');

          if (image != null) {
            setState(() {
              imageCommandPathPhone = file;
            });
          } else {
            print('No Image Path Received');
          }
        } else {
          print('Permission not granted. Try Again with permission access');
        }
      }
    }
  }

  uploadImageCommand() async {
    final _firebaseStorage = FirebaseStorage.instance;
    //Check Permissions

    try {
      var snapshot = await _firebaseStorage
          .ref()
          .child('images/Command$random')
          .putFile(File(imageCommandPathPhone?.path ?? ''));
      var downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        imageUrlCommand = downloadUrl;
      });
    } on AssertionError catch (e) {
      print(e.message);
      // Fluttertoast.showToast(
      //     child: Text(
      //   '${e.message}',
      //   style: const TextStyle(color: Colors.red),
      // ));
    }
  }

  uploadImageLogo() async {
    final _firebaseStorage = FirebaseStorage.instance;
    //Check Permissions

    try {
      var snapshot = await _firebaseStorage
          .ref()
          .child('images/Logo$random')
          .putFile(File(imageLogoPathPhone?.path ?? ''));
      var downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        imageUrlLogo = downloadUrl;
      });
    } on AssertionError catch (e) {
      print(e.message);
      // Fluttertoast().showToast(
      //   msg: e.message.toString(),
      // );
    }
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
                onPressed: () {
                  uploadImagePhoneLogo();
                },
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
              decoration: imageLogoPathPhone != null
                  ? BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(imageLogoPathPhone!),
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color.fromRGBO(41, 42, 44, 1),
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color.fromRGBO(41, 42, 44, 1),
                    ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              child: IconButton(
                  onPressed: () {
                    uploadImagePhoneCommand();
                  },
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
              decoration: imageCommandPathPhone != null
                  ? BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(imageCommandPathPhone!),
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color.fromRGBO(41, 42, 44, 1),
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color.fromRGBO(41, 42, 44, 1),
                    ),
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: commandTextInputController,
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
            dropCityButtonFromField(list, "Страна"),
            SizedBox(
              height: 12,
            ),
            dropCountryButtonFromField(list, "Город"),
            SizedBox(
              height: 12,
            ),
            dropColorButtonFromField(list, "Цвета формы"),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: descriptionTextInputController,
              style: TextStyle(
                color: Color.fromARGB(255, 164, 165, 167),
                fontFamily: "Inter",
                fontSize: 16,
              ),
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
            // ElevatedButton.icon(
            //   onPressed: () {
            //     _isLoading ? null : createCommand();
            //   },
            //   style:
            //       ElevatedButton.styleFrom(padding: const EdgeInsets.all(16.0)),
            //   icon: _isLoading
            //       ? Container(
            //           width: 24,
            //           height: 24,
            //           padding: const EdgeInsets.all(2.0),
            //           child: const CircularProgressIndicator(
            //             color: Colors.white,
            //             strokeWidth: 3,
            //           ),
            //         )
            //       : const Icon(Icons.feedback),
            //   label: const Text('SUBMIT'),
            // ),
            ElevatedButton.icon(
              onPressed: () {
                _isLoading ? null : createCommand();
              },
              icon: _isLoading
                  ? Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.all(2.0),
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                  : const Text(
                      "",
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
              label: const Text(
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
              onPressed: () {
                Navigator.pop(context);
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

  Widget dropCountryButtonFromField(List<String> list, String defaultValue) {
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
          country = data;
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

  Widget dropColorButtonFromField(List<String> list, String defaultValue) {
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
          color = data;
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

  Widget dropCityButtonFromField(List<String> list, String defaultValue) {
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
}
