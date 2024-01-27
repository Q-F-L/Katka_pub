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

//ПОДКЛЮЧИТЬ БД
//СОЗДАТЬ ТАБЛИЦ
//АВТОРИЗАЦИЯ (РЕГИСТРАЦИЯ, ВХОД)
//ВЫВОД ДАННЫХ (самое долгое)
//СОЗДАНИЕ АДМИНА
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