import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:katka/firebase/command/firestore_constans.dart';
import 'package:katka/firebase/user/firestore_constans.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:katka/components/src/dropdownButtonFromField.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? imageUrl;
  File? imagePathPhone;
  List<String> list = ['Список', 'Список1', 'Список2', 'Список3'];
  TextEditingController nicknameTextInputController = TextEditingController();
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  TextEditingController passwordRepeatTextInputController =
      TextEditingController();
  TextEditingController surnameTextInputController = TextEditingController();
  TextEditingController nameTextInputController = TextEditingController();
  TextEditingController patronymicTextInputController = TextEditingController();
  String? city = '';
  String? command = '';
  TextEditingController typeTextInputController = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  String text = "";
  String commandId = "";

  @override
  void dispose() {
    // TODO: implement dispose
    emailTextInputController.dispose();
    passwordTextInputController.dispose();
    passwordRepeatTextInputController.dispose();

    super.dispose();
  }

  permissionRequest() async {
    final _imagePicker = ImagePicker();
    //Check Permissions

    if (Platform.isAndroid) {
      await Permission.storage.request();
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        var permissionStatus = await Permission.storage.status;
      } else {
        await Permission.photos.request();
      }
    }
  }

  uploadImagePhone() async {
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
              imagePathPhone = file;
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
              imagePathPhone = file;
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

  uploadImage(String uid) async {
    final _firebaseStorage = FirebaseStorage.instance;
    //Check Permissions

    var snapshot = await _firebaseStorage
        .ref()
        .child('images/$uid')
        .putFile(File(imagePathPhone?.path ?? ''));
    var downloadUrl = await snapshot.ref.getDownloadURL();
    setState(() {
      imageUrl = downloadUrl;
    });
  }

  Future<List<DocumentSnapshot<Object?>>> commandStream() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final QuerySnapshot result = await firebaseFirestore
        .collection(FirestoreConstantsCommand.pathCommandCollection)
        .get();
    return result.docs;
  }

  Future<void> signUp() async {
    final navigator = Navigator.of(context);
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final isValid = fromKey.currentState!.validate();
    if (!isValid) return;

    if (passwordRepeatTextInputController.text !=
        passwordTextInputController.text) {
      setState(() {
        text = "Пароли должны совпадать!";
      });
    }

    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailTextInputController.text.trim(),
              password: passwordTextInputController.text.trim());

      if (user.user != null) {
        final QuerySnapshot result = await firebaseFirestore
            .collection(FirestoreConstants.pathUserCollection)
            .where(FirestoreConstants.uid, isEqualTo: user.user!.uid)
            .get();

        final List<DocumentSnapshot> document = result.docs;

        if (document.length == 0) {
          if (imagePathPhone!.path.isNotEmpty) {
            uploadImage(user.user!.uid);
            firebaseFirestore
                .collection(FirestoreConstants.pathUserCollection)
                .doc(user.user!.uid)
                .set({
              FirestoreConstants.photoUrl: imageUrl.toString(),
              FirestoreConstants.nickname:
                  nicknameTextInputController.text.trim(),
              FirestoreConstants.rationgUser: '0',
              FirestoreConstants.surname:
                  surnameTextInputController.text.trim(),
              FirestoreConstants.name: nameTextInputController.text.trim(),
              FirestoreConstants.email: emailTextInputController.text.trim(),
              FirestoreConstants.patronymic:
                  patronymicTextInputController.text.trim(),
              FirestoreConstants.city: city.toString().trim(),
              FirestoreConstants.command: command.toString().trim(),
              FirestoreConstants.commandId: commandId,
              FirestoreConstants.type: FirestoreConstants.type,
              FirestoreConstants.uid: user.user!.uid,
              "createAt": DateTime.now().millisecondsSinceEpoch.toString(),
            });
          } else {
            firebaseFirestore
                .collection(FirestoreConstants.pathUserCollection)
                .doc(user.user!.uid)
                .set({
              FirestoreConstants.nickname:
                  nicknameTextInputController.text.trim(),
              FirestoreConstants.rationgUser: '0',
              FirestoreConstants.surname:
                  surnameTextInputController.text.trim(),
              FirestoreConstants.name: nameTextInputController.text.trim(),
              FirestoreConstants.patronymic:
                  patronymicTextInputController.text.trim(),
              FirestoreConstants.city: city.toString().trim(),
              FirestoreConstants.command: command.toString().trim(),
              FirestoreConstants.type: FirestoreConstants.type,
              FirestoreConstants.uid: user.user!.uid,
              "createAt": DateTime.now().millisecondsSinceEpoch.toString(),
            });
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() {
          text = "Такой email уже используется!";
        });
        return;
      } else {
        setState(() {
          text =
              "Не известная ошибка! Попробуйте ещё раз позде или обратитесь в техподдержку.";
        });
        return;
      }
    }

    navigator.pushNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 35,
          ),
        ),
        title: const Text('Регистрация'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Form(
        key: fromKey,
        child: ListView(
          children: [
            SizedBox(
              height: text != "" ? 12 : 0,
            ),
            text != ""
                ? Text(
                    text,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  )
                : SizedBox(),
            const SizedBox(
              height: 12,
            ),
            addImage(),
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
            dropCityButtonFromField(list, "Город"),
            const SizedBox(
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                autocorrect: false,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < 6
                    ? "Минимум 6 символов"
                    : null,
                controller: passwordTextInputController,
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
                autocorrect: false,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: passwordRepeatTextInputController,
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
            dropCommandButtonFromField(list, "Команды"),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  signUp();
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
                  "Зарегистрироваться",
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

  Widget addImage() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: 343,
      height: 248,
      decoration: imagePathPhone != null
          ? BoxDecoration(
              image: DecorationImage(
                image: FileImage(imagePathPhone!),
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Color.fromRGBO(41, 42, 44, 1),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Color.fromRGBO(41, 42, 44, 1),
            ),
      child: IconButton(
          onPressed: () {
            setState(() {
              uploadImagePhone();
            });
          },
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/png/plus.png',
                scale: 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Загрузить фото',
                style: TextStyle(
                  color: Color(0xFFA4A5A7),
                ),
              ),
            ],
          )),
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
          print(data);
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
      child: FutureBuilder(
          future: commandStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return DropButtonFromField('Загрузка...', []);
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return DropButtonFromField(defaultValue, snapshot.data);
              } else {
                return DropButtonFromField('${snapshot.error}', []);
              }
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Text('${snapshot.connectionState}');
            } else {
              return Text('${snapshot.connectionState}');
            }
          }),
    );
  }

  Widget DropButtonFromField(String defaultValue,
      [List<DocumentSnapshot<Object?>>? list]) {
    return DropdownButtonFormField(
      menuMaxHeight: 200,
      elevation: 0,
      borderRadius: BorderRadius.circular(8),
      dropdownColor: Color.fromARGB(255, 41, 42, 44),
      hint: Text(
        defaultValue,
        style: const TextStyle(
          color: Color.fromARGB(255, 164, 165, 167),
          fontFamily: "Inter",
          fontSize: 16,
        ),
      ),
      onChanged: (data) {
        command = data!.get(FirestoreConstantsCommand.name).toString();
        commandId = data.get(FirestoreConstantsCommand.id).toString();
      },
      decoration: const InputDecoration(
        fillColor: Color.fromARGB(255, 41, 42, 44),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
      ),
      items: list!.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(
            e.get(FirestoreConstantsCommand.name).toString(),
            style: const TextStyle(
              color: Color.fromARGB(255, 164, 165, 167),
              fontFamily: "Inter",
              fontSize: 16,
            ),
          ),
        );
      }).toList(),
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
