import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:katka/firebase/user/firestore_constans.dart';
import 'package:permission_handler/permission_handler.dart';

class UserFirebase {
  //все поля юзера
  String? uid;
  bool? emailVerified;
  String? city;
  String? command;
  String? email;
  File? imageFile;
  String? name;
  String? surname;
  String? createAt;
  String? patronymic;
  String? photoUrl;
  String? nickname;
  String? rationgUser;

  UserFirebase(
      this.uid,
      this.city,
      this.command,
      this.email,
      this.imageFile,
      this.name,
      this.surname,
      this.createAt,
      this.patronymic,
      this.nickname,
      this.rationgUser,
      this.photoUrl);
  
  

  //метод для регистрации
  // Future<String> signUp(
  //     String password,
  //     GlobalKey<FormState> fromKey,
  //     String passwordRepeat,
  //     String email,
  //     String city,
  //     String surname,
  //     String name,
  //     String nickname,
  //     String patronymic) async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   final isValid = fromKey.currentState!.validate();
  //   if (!isValid) return 'Error valid';

  //   if (passwordRepeat != password) {
  //     return "Пароли должны совпадать!";
  //   }

  //   try {
  //     UserCredential user =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );

  //     if (user.user != null) {
  //       final QuerySnapshot result = await firebaseFirestore
  //           .collection(FirestoreConstants.pathUserCollection)
  //           .where(FirestoreConstants.uid, isEqualTo: user.user!.uid)
  //           .get();

  //       final List<DocumentSnapshot> document = result.docs;

  //       if (document.length == 0) {
  //         if (imageFile!.path.isNotEmpty) {
  //           uploadImage(user.user!.uid, imageFile);
  //           firebaseFirestore
  //               .collection(FirestoreConstants.pathUserCollection)
  //               .doc(user.user!.uid)
  //               .set({
  //             FirestoreConstants.photoUrl: imageFile!.path.toString(),
  //             FirestoreConstants.city: this.city,
  //             FirestoreConstants.surname: this.surname,
  //             FirestoreConstants.name: this.name,
  //             FirestoreConstants.patronymic: this.patronymic,
  //             FirestoreConstants.command: command.toString().trim(),
  //             FirestoreConstants.type: FirestoreConstants.type,
  //             FirestoreConstants.uid: user.user!.uid,
  //             "createAt": DateTime.now().millisecondsSinceEpoch.toString(),
  //           });
  //         }
  //       }
  //     }

  //     return '1';
  //   } on FirebaseAuthException catch (e) {
  //     print("ERROR !!! " + e.code);

  //     if (e.code == 'email-already-in-use') {
  //       return "Такой email уже используется!";
  //     } else {
  //       return "Не известная ошибка! Попробуйте ещё раз позде или обратитесь в техподдержку. ${e.message}";
  //     }
  //   }
  // }

  //Выбор изображения из галереи
  // uploadImagePhone() async {
  //   final _firebaseStorage = FirebaseStorage.instance;
  //   final _imagePicker = ImagePicker();
  //   //Check Permissions

  //   await Permission.storage.request();
  //   final androidInfo = await DeviceInfoPlugin().androidInfo;
  //   if (androidInfo.version.sdkInt <= 32) {
  //     var permissionStatus = await Permission.storage.status;
  //     if (permissionStatus.isGranted) {
  //       //Select Image
  //       var image = await _imagePicker.pickImage(source: ImageSource.gallery);
  //       var file = File(image?.path ?? '');

  //       if (image != null) {
  //         imageFile = file;
  //       } else {
  //         print('No Image Path Received');
  //       }
  //     } else {
  //       print('Permission not granted. Try Again with permission access');
  //     }
  //   } else {
  //     await Permission.photos.request();
  //     var permissionStatus = await Permission.photos.status;
  //     if (permissionStatus.isGranted) {
  //       //Select Image
  //       var image = await _imagePicker.pickImage(source: ImageSource.gallery);
  //       var file = File(image?.path ?? '');

  //       if (image != null) {
  //         return file;
  //       } else {
  //         print('No Image Path Received');
  //       }
  //     } else {
  //       print('Permission not granted. Try Again with permission access');
  //     }
  //   }
  // }

  //Загрузка изображения в firestore
  uploadImage(String uid, File? imagePathPhone) async {
    final _firebaseStorage = FirebaseStorage.instance;
    //Check Permissions

    var snapshot = await _firebaseStorage
        .ref()
        .child('images/$uid')
        .putFile(File(imagePathPhone!.path));
    var downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  //метод запрос серверу , вввод полей пользователя
  requestUser() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final QuerySnapshot result = await firebaseFirestore
        .collection(FirestoreConstants.pathUserCollection)
        .where(FirestoreConstants.uid, isEqualTo: this.uid)
        .get();

    this.city = result.docs.first.get(FirestoreConstants.city);
    this.command = result.docs.first.get(FirestoreConstants.command);
    this.name = result.docs.first.get(FirestoreConstants.name);
    this.patronymic = result.docs.first.get(FirestoreConstants.patronymic);
    this.photoUrl = result.docs.first.get(FirestoreConstants.photoUrl);
    this.rationgUser = result.docs.first.get(FirestoreConstants.rationgUser);
    this.surname = result.docs.first.get(FirestoreConstants.surname);
    this.nickname = result.docs.first.get(FirestoreConstants.nickname);
  }

  //метод для входа
  Future<String> login(
      String email, String password, GlobalKey<FormState> fromKey) async {
    final isValid = fromKey.currentState!.validate();
    if (!isValid) return 'Error validation';

    // bool? isEmailVerified = FirebaseAuth.instance.currentUser?.emailVerified;
    // if (isEmailVerified != null) {
    //   setState(() {
    //     return 'Вам необходимо подтвердить свою почту!';
    //   });
    //   return 'Error validation';
    // }

    try {
      var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      this.email = email;
      this.emailVerified = user.user!.emailVerified;
      this.uid = user.user!.uid;
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return "Вы ввели недействительные данные";
      } else {
        return "Не известная ошибка! Попробуйте ещё раз позде или обратитесь в техподдержку. ${e.message}";
      }
    }

    return 'Error';
  }

  //метод для выхода
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  getImageFile() {
    return imageFile;
  }
}
