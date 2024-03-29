import 'dart:convert';
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
import 'package:path_provider/path_provider.dart';

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
      // home: Json(),
      routes: {
        '/': (context) => const FirebaseStream(),
        '/home': (context) => const Auth(),
        '/login': (context) => const SignIn(),
        '/register': (context) => const SignUp(),
        '/account': (context) => const PersonalAccount(),
        '/command': (context) => const Comand(),
        '/listCommands': (context) => const ListTeams(),
        // '/imageUploade': (context) => ImageUpload(),
      },
    );
  }
}



// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   late final YandexMapController _mapController;
//   var _mapZoom = 0.0;

//   @override
//   void dispose() {
//     _mapController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Yandex Mapkit Demo')),
//       body: YandexMap(
//         onMapCreated: (controller) async {
//           _mapController = controller;
//           // приближаем вид карты ближе к Европе
//           await _mapController.moveCamera(
//             CameraUpdate.newCameraPosition(
//               const CameraPosition(
//                 target: Point(
//                   latitude: 50,
//                   longitude: 20,
//                 ),
//                 zoom: 3,
//               ),
//             ),
//           );
//         },
//         onCameraPositionChanged: (cameraPosition, _, __) {
//           setState(() {
//             _mapZoom = cameraPosition.zoom;
//           });
//         },
//         mapObjects: [
//           _getClusterizedCollection(
//             placemarks: _getPlacemarkObjects(context),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Метод для получения коллекции кластеризованных маркеров
//   ClusterizedPlacemarkCollection _getClusterizedCollection({
//     required List<PlacemarkMapObject> placemarks,
//   }) {
//     return ClusterizedPlacemarkCollection(
//         mapId: const MapObjectId('clusterized-1'),
//         placemarks: placemarks,
//         radius: 50,
//         minZoom: 15,
//         onClusterAdded: (self, cluster) async {
//           return cluster.copyWith(
//             appearance: cluster.appearance.copyWith(
//               opacity: 1.0,
//               icon: PlacemarkIcon.single(
//                 PlacemarkIconStyle(
//                     image: BitmapDescriptor.fromAssetImage(
//                         'assets/png/avatar.png')),
//               ),
//             ),
//           );
//         },
//         onClusterTap: (self, cluster) async {
//           await _mapController.moveCamera(
//             animation: const MapAnimation(
//                 type: MapAnimationType.linear, duration: 0.3),
//             CameraUpdate.newCameraPosition(
//               CameraPosition(
//                 target: cluster.placemarks.first.point,
//                 zoom: _mapZoom + 1,
//               ),
//             ),
//           );
//         });
//   }
// }

// /// Метод для генерации точек на карте
// List<MapPoint> _getMapPoints() {
//   return [
//     MapPoint(name: 'Москва', latitude: 55.755864, longitude: 37.617698),
//     MapPoint(name: 'Лондон', latitude: 51.507351, longitude: -0.127696),
//     MapPoint(name: 'Рим', latitude: 41.887064, longitude: 12.504809),
//     MapPoint(name: 'Париж', latitude: 48.856663, longitude: 2.351556),
//     MapPoint(name: 'Стокгольм', latitude: 59.347360, longitude: 18.341573),
//   ];
// }

// class MapPoint {
//   String? name;
//   double? latitude;
//   double? longitude;

//   MapPoint({String? name, double? latitude, double? longitude});
// }

// /// Метод для генерации объектов маркеров для отображения на карте
// List<PlacemarkMapObject> _getPlacemarkObjects(BuildContext context) {
//   print('_getPlacemarkObjects ');
//   return _getMapPoints().map(
//     (point) {
//       return PlacemarkMapObject(
//         mapId: MapObjectId('MapObject $point'),
//         point: Point(latitude: 55.755864, longitude: 37.617698),
//         opacity: 1,
//         icon: PlacemarkIcon.single(
//           PlacemarkIconStyle(
//             image: BitmapDescriptor.fromAssetImage(
//               'assets/png/avatar.png',
//             ),
//             scale: 2,
//           ),
//         ),
//         // onTap: (_, __) => showModalBottomSheet(
//         //   context: context,
//         //   builder: (context) => _ModalBodyView(
//         //     point: point,
//         //   ),
//         // ),
//       );
//     },
//   ).toList();
// }

// /// Содержимое модального окна с информацией о точке на карте
// class _ModalBodyView extends StatelessWidget {
//   const _ModalBodyView({required this.point});

//   final MapPoint point;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 40),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(point.name ?? '', style: const TextStyle(fontSize: 20)),
//           const SizedBox(height: 20),
//           Text(
//             '${point.latitude}, ${point.longitude}',
//             style: const TextStyle(
//               fontSize: 16,
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
