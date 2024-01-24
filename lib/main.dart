import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:katka/firebase_stream.dart';
import 'package:katka/pages/TMP.dart';
import 'package:katka/pages/activeGame.dart';
import 'package:katka/pages/admin/activeGame.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:katka/pages/admin/createMap/createPointBatlle.dart';
import 'package:katka/pages/admin/createMap/createPointInterest.dart';
import 'package:katka/pages/admin/createMap/createRounds.dart';
import 'package:katka/pages/admin/createMap/createRoundsFix.dart';
import 'package:katka/pages/admin/createNewAdmin.dart';
import 'package:katka/pages/admin/detailAdmin.dart';
import 'package:katka/pages/admin/detailGame.dart';
import 'package:katka/pages/admin/detailPlayer.dart';
import 'package:katka/pages/admin/listAdmins.dart';
import 'package:katka/pages/admin/listComand.dart';
import 'package:katka/pages/admin/listGames.dart';
import 'package:katka/pages/admin/listPlayer.dart';
import 'package:katka/pages/admin/listRound.dart';
import 'package:katka/pages/admin/logs.dart';
import 'package:katka/pages/admin/qrCodeDownload.dart';
import 'package:katka/pages/admin/requestGame.dart';
import 'package:katka/pages/logs.dart';
import 'package:katka/pages/admin/menu.dart';
import 'package:katka/pages/auth.dart';
import 'package:katka/pages/comand.dart';
import 'package:katka/pages/comandCommander.dart';
import 'package:katka/pages/comandRequest.dart';
import 'package:katka/pages/createComand.dart';
import 'package:katka/pages/detailGame.dart';
import 'package:katka/pages/detailsLastGame.dart';
import 'package:katka/pages/detailsUpcomingGame.dart';
import 'package:katka/pages/editUser.dart';
import 'package:katka/pages/listGame.dart';
import 'package:katka/pages/listTeams.dart';
import 'package:katka/pages/personal_account.dart';
import 'package:katka/pages/qrCodeRead.dart';
import 'package:katka/pages/signIn.dart';
import 'package:katka/pages/signUp.dart';
import 'package:katka/pages/signUp.dart';
import 'package:permission_handler/permission_handler.dart';
import '../themes/theme.dart';
import 'components/src/map/map_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

// //ПОДКЛЮЧИТЬ БД
// //СОЗДАТЬ ТАБЛИЦ
// //АВТОРИЗАЦИЯ (РЕГИСТРАЦИЯ, ВХОД)
// //ВЫВОД ДАННЫХ (самое долгое)
// //СОЗДАНИЕ АДМИНА
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "Katka",
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBA8Adleke9bgUM3oGl0Cct5riy3FgnIwM',
        appId: '1:914974456145:android:2ce45dd53b5ec298473b70',
        messagingSenderId: '914974456145',
        projectId: 'katka-63f89',
        storageBucket: 'katka-63f89.appspot.com',
      ));
  runApp(const Katka());
}

class Katka extends StatelessWidget {
  const Katka({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      // home: ListTeams(),
      routes: {
        '/': (context) => const FirebaseStream(),
        '/home': (context) => const Auth(),
        '/login': (context) => const SignIn(),
        '/register': (context) => const SignUp(),
        '/account': (context) => const PersonalAccount(),
        '/command': (context) => const Comand(),
        '/listCommands': (context) => const ListComands(),
        // '/imageUploade': (context) => ImageUpload(),
      },
    );
  }
}

// class ImageUpload extends StatefulWidget {
//   @override
//   _ImageUploadState createState() => _ImageUploadState();
// }

// class _ImageUploadState extends State<ImageUpload> {
//   var image;
//   File? imageUrl;

//   @override
//   Widget build(BuildContext context) {
//     downloadImage();
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           'Upload Image',
//           style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         elevation: 0.0,
//         backgroundColor: Colors.white,
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Column(
//           children: <Widget>[
//             Container(
//                 margin: EdgeInsets.all(15),
//                 padding: EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(15),
//                   ),
//                   border: Border.all(color: Colors.white),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12,
//                       offset: Offset(2, 2),
//                       spreadRadius: 2,
//                       blurRadius: 1,
//                     ),
//                   ],
//                 ),
//                 child: (image != null)
//                     ? Image.network(image!)
//                     : Image.network('https://i.imgur.com/sUFH1Aq.png')),
//             SizedBox(
//               height: 20.0,
//             ),
//             ElevatedButton(
//               child: Text("Upload Image",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20)),
//               onPressed: () {
//                 downloadImage();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

  // var user = FirebaseAuth.instance.currentUser;

  // downloadImage() async {
  //   final _firebaseStorage = FirebaseStorage.instance;
  //   var snapshot = await _firebaseStorage.ref().child('images/${user!.uid}');
  //   var downloadUrl = await snapshot.getDownloadURL();
  //   setState(() {
  //     image = downloadUrl;
  //   });
  // }
  // uploadImage() async {
  //   // UserCredential user = FirebaseAuth.instance;
  //   final _firebaseStorage = FirebaseStorage.instance;
  //   final _imagePicker = ImagePicker();
  //   //Check Permissions

  //   if (Platform.isAndroid) {
  //     var s = await Permission.storage.request();

  //     final androidInfo = await DeviceInfoPlugin().androidInfo;
  //     if (androidInfo.version.sdkInt <= 32) {
  //       var permissionStatus = await Permission.storage.status;
  //       if (permissionStatus.isGranted) {
  //         //Select Image
  //         var image =
  //             await _imagePicker.pickImage(source: ImageSource.gallery);
  //         var file = File(image?.path ?? '');

  //         if (image != null) {
  //           //Upload to Firebase
  //           var snapshot = await _firebaseStorage
  //               .ref()
  //               .child('images/imageName')
  //               .putFile(file);
  //           var downloadUrl = await snapshot.ref.getDownloadURL();
  //           setState(() {
  //             imageUrl = downloadUrl;
  //           });
  //           setState(() {
  //             imageUrl = file;
  //           });
  //           print(
  //               "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!${imageUrl ?? ''}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
  //         } else {
  //           print('No Image Path Received');
  //         }
  //       } else {
  //         print('Permission not granted. Try Again with permission access');
  //       }
  //     } else {
  //       var s = await Permission.photos.request();
  //       var permissionStatus = await Permission.photos.status;
  //       if (permissionStatus.isGranted) {
  //         //Select Image
  //         var image =
  //             await _imagePicker.pickImage(source: ImageSource.gallery);
  //         var file = File(image?.path ?? '');

  //         if (image != null) {
  //           //Upload to Firebase
  //           // var snapshot = await _firebaseStorage
  //           //     .ref()
  //           //     .child('images/imageName')
  //           //     .putFile(file);
  //           // var downloadUrl = await snapshot.ref.getDownloadURL();
  //           // setState(() {
  //           //   imageUrl = downloadUrl;
  //           // });
  //           setState(() {
  //             imageUrl = file;
  //           });
  //           print(
  //               "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!${imageUrl ?? ''}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
  //         } else {
  //           print('No Image Path Received');
  //         }
  //       } else {
  //         print('Permission not granted. Try Again with permission access');
  //       }
  //     }
  //   }
  // }
  // }
// }
