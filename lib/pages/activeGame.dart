import 'dart:math';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

// class ActiveGame extends StatefulWidget {
//   const ActiveGame({super.key});

//   @override
//   State<ActiveGame> createState() => _ActiveGameState();
// }

// class _ActiveGameState extends State<ActiveGame> {
//   @override
//   Widget build(BuildContext context) {
//     var expandexWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Stack(
//         children: [
//           YandexMap(),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.fromLTRB(
//                     MediaQuery.of(context).size.height * 0.016,
//                     MediaQuery.of(context).size.height * 0.05,
//                     0,
//                     0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     IconButton(
//                       style: ButtonStyle(
//                         padding: MaterialStateProperty.all(EdgeInsets.zero),
//                       ),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: Icon(
//                         Icons.arrow_back_ios,
//                         color: Color(0xFF1F2022),
//                         size: expandexWidth > 550 ? 35 : 25,
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Flexible(
//                           flex: 1,
//                           child: Container(
//                             margin: EdgeInsets.only(
//                                 top: MediaQuery.of(context).size.height * 0.01),
//                             padding: EdgeInsets.symmetric(
//                               horizontal:
//                                   MediaQuery.of(context).size.height > 550
//                                       ? 20
//                                       : 5,
//                               vertical: MediaQuery.of(context).size.height > 550
//                                   ? 20
//                                   : 10,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 41, 42, 44),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Text(
//                               'Таймер поединка',
//                               style: TextStyle(
//                                 fontFamily: "Inter",
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Flexible(
//                           flex: 1,
//                           child: Container(
//                             margin: EdgeInsets.only(
//                                 top: MediaQuery.of(context).size.height * 0.01),
//                             padding: EdgeInsets.symmetric(
//                               horizontal:
//                                   MediaQuery.of(context).size.height > 550
//                                       ? 20
//                                       : 5,
//                               vertical: MediaQuery.of(context).size.height > 550
//                                   ? 20
//                                   : 10,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 41, 42, 44),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Text(
//                               'Таймер поединка',
//                               style: TextStyle(
//                                 fontFamily: "Inter",
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 // crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   GestureDetector(
//                     onTap: () => showDialog(
//                       context: context,
//                       builder: (BuildContext context) =>
//                           CustomAlerDialogStatus(),
//                     ),
//                     child: Container(
//                       margin: EdgeInsets.fromLTRB(
//                           MediaQuery.of(context).size.width * 0.05, 0, 0, 0),
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(31, 32, 34, 0.5),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       alignment: Alignment.center,
//                       width:
//                           MediaQuery.of(context).size.height > 550 ? 100 : 70,
//                       height:
//                           MediaQuery.of(context).size.height > 550 ? 100 : 70,
//                       child: Text(
//                         'Статус',
//                         style: TextStyle(
//                           fontFamily: "Inter",
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.015,
//                   ),
//                   Container(
//                     margin: EdgeInsets.fromLTRB(
//                         MediaQuery.of(context).size.width * 0.05, 0, 0, 0),
//                     decoration: BoxDecoration(
//                       color: Color.fromRGBO(31, 32, 34, 0.5),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     alignment: Alignment.center,
//                     width: MediaQuery.of(context).size.height > 550 ? 100 : 70,
//                     height: MediaQuery.of(context).size.height > 550 ? 100 : 70,
//                     child: Text(
//                       'Старт',
//                       style: TextStyle(
//                         fontFamily: "Inter",
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.015,
//                   ),
//                 ],
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget CustomAlerDialogStatus() {
//     return AlertDialog(
//       title: Text(
//         'Выберите статус',
//         style: TextStyle(
//           fontFamily: "Inter",
//           fontSize: 20,
//           fontWeight: FontWeight.w600,
//           color: Colors.white,
//         ),
//         textAlign: TextAlign.center,
//       ),
//       insetPadding: EdgeInsets.zero,
//       actionsAlignment: MainAxisAlignment.start,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(8.0))),
//       elevation: 0,
//       actionsPadding: EdgeInsets.all(24),
//       backgroundColor: Color(0xFF292A2C),
//       actions: <Widget>[
//         Wrap(
//           runSpacing: 12,
//           alignment: WrapAlignment.start,
//           children: [
//             Container(
//               height: 65,
//               width: 65,
//               child: Image.asset('assets/png/first_aid_kit.png'),
//               decoration: BoxDecoration(
//                   color: Color(0xFF1F2022),
//                   borderRadius: BorderRadius.circular(8)),
//             ),
//             SizedBox(
//               width: 12,
//             ),
//             Container(
//               height: 65,
//               width: 65,
//               child: Image.asset('assets/png/gun.png'),
//               decoration: BoxDecoration(
//                   color: Color(0xFF1F2022),
//                   borderRadius: BorderRadius.circular(8)),
//             ),
//             SizedBox(
//               width: 12,
//             ),
//             Container(
//               height: 65,
//               width: 65,
//               child: Image.asset('assets/png/arena.png'),
//               decoration: BoxDecoration(
//                   color: Color(0xFF1F2022),
//                   borderRadius: BorderRadius.circular(8)),
//             ),
//             SizedBox(
//               width: 12,
//             ),
//             Container(
//               height: 65,
//               width: 65,
//               child: Image.asset('assets/png/death.png'),
//               decoration: BoxDecoration(
//                   color: Color(0xFF1F2022),
//                   borderRadius: BorderRadius.circular(8)),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget CustomAlerDialogQrCode() {
//     return AlertDialog(
//       iconPadding: EdgeInsets.zero,
//       titlePadding: EdgeInsets.zero,
//       buttonPadding: EdgeInsets.zero,
//       contentPadding: EdgeInsets.zero,
//       alignment: Alignment.center,
//       insetPadding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.145),
//       actionsAlignment: MainAxisAlignment.start,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(8.0))),
//       elevation: 0,
//       actionsPadding: EdgeInsets.only(top: 24, right: 24, bottom: 24, left: 24),
//       backgroundColor: Color(0xFF292A2C),
//       actions: <Widget>[
//         Image.asset('assets/png/qr_code.png'),
//         Container(
//           margin: EdgeInsets.only(top: 24),
//           width: 300,
//           child: const TextField(
//             style: TextStyle(
//               color: Color.fromARGB(255, 164, 165, 167),
//               fontFamily: "Inter",
//               fontSize: 16,
//             ),
//             decoration: InputDecoration(
//               hintText: "Введите код",
//               hintStyle: TextStyle(
//                 color: Color(0xFFA4A5A7),
//                 fontFamily: 'Inter',
//                 fontSize: 16,
//               ),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   borderSide: BorderSide.none),
//               filled: true,
//               fillColor: Color(0xFF1F2022),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget CustomAlerDialogTextMessage(String title, String subtitle) {
//     return AlertDialog(
//       title: Text(
//         title,
//         style: TextStyle(
//           color: Colors.white,
//           fontFamily: 'Inter',
//           fontSize: 20,
//         ),
//         textAlign: TextAlign.center,
//       ),
//       content: subtitle.isNotEmpty
//           ? Text(
//               subtitle,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'Inter',
//                 fontSize: 16,
//               ),
//               textAlign: TextAlign.center,
//             )
//           : Container(
//               height: 0,
//             ),
//       insetPadding: EdgeInsets.only(left: 24, right: 24),
//       actionsAlignment: MainAxisAlignment.start,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(8.0))),
//       elevation: 0,
//       actionsPadding: EdgeInsets.all(24),
//       backgroundColor: Color(0xFF292A2C),
//     );
//   }
// }

class ActiveGame extends StatefulWidget {
  @override
  _ActiveGameState createState() => _ActiveGameState();
}

class _ActiveGameState extends State<ActiveGame> {
  static const double earthRadius = 6371000;
  late YandexMapController controller;
  final List<MapObject> mapObjects = [];
  YandexMapController? _mapController;
  int _counterPlacemark = 0;
  double _counter = 0;
  double _startlatitude = 0;
  double _startlongitude = 0;
  double _newlatitude = 0;
  double _newlongitude = 0;
  var _userLocation;
  double radius = 5000;
  double radiusDistanse = 5000;

  /// Метод, который включает слой местоположения пользователя на карте
  /// Выполняется проверка на доступ к местоположению, в случае отсутствия
  /// разрешения - выводит сообщение
  Future<void> _initLocationLayer() async {
    final locationPermissionIsGranted =
        await Permission.location.request().isGranted;
    _userLocation = locationPermissionIsGranted;
    if (locationPermissionIsGranted) {
      await _mapController!.toggleUserLayer(visible: true);
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Нет доступа к местоположению пользователя'),
          ),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  // Конвертация из градусов в радианы
  double degToRad(double degrees) {
    return degrees * (pi / 180.0);
  }

// Вычисление расстояния Haversine между двумя точками на Земле
  double haversineDistance(double lat1, double lon1, double lat2, double lon2) {
    double dLat = degToRad(lat2 - lat1);
    double dLon = degToRad(lon2 - lon1);

    double a = pow(sin(dLat / 2), 2) +
        cos(degToRad(lat1)) * cos(degToRad(lat2)) * pow(sin(dLon / 2), 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yandex $_counter'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () async {
                  if (mapObjects.isNotEmpty) {
                    setState(() {
                      mapObjects.removeLast();
                    });
                  }
                },
                icon: const Icon(Icons.delete_outline),
              ),
              Slider(
                value: radius,
                min: 100,
                max: 5000,
                onChanged: (double value) {
                  //by default value will be range from 0-1
                  setState(() {
                    radius = value;
                  });
                },
              ),
              IconButton(
                onPressed: () async {
                  setState(() {
                    if (_counter == 0) {
                      radiusDistanse = radius;
                    }
                    _mapController!.getUserCameraPosition();
                    mapObjects.add(CircleMapObject(
                        isGeodesic: true,
                        mapId: MapObjectId('circle$_counter'),
                        circle: Circle(
                          center: Point(
                              latitude:
                                  _counter == 0 ? _startlatitude : _newlatitude,
                              longitude: _counter == 0
                                  ? _startlongitude
                                  : _newlongitude),
                          radius: radius,
                        ),
                        fillColor: randomColor()));
                    _counter++;
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
      body: YandexMap(
        onMapCreated: (controller) async {
          _mapController = controller;
          await _initLocationLayer();
          await _mapController!.moveCamera(
            CameraUpdate.newCameraPosition(
              const CameraPosition(
                target: Point(
                  latitude: 50,
                  longitude: 20,
                ),
                zoom: 10,
              ),
            ),
          );
        },
        onUserLocationAdded: (view) async {
          // получаем местоположение пользователя
          _userLocation = await _mapController!.getUserCameraPosition();
          // если местоположение найдено, центрируем карту относительно этой точки
          if (_userLocation != null) {
            setState(() {
              _mapController!.moveCamera(CameraUpdate.newCameraPosition(
                _userLocation,
              ));
            });
          }

          // меняем внешний вид маркера
          return view.copyWith(
            arrow: PlacemarkMapObject(
              mapId: const MapObjectId("arrowUser"),
              point: view.pin.point,
              opacity: 1,
              icon: PlacemarkIcon.single(
                PlacemarkIconStyle(
                    image: BitmapDescriptor.fromAssetImage("assets/png/vk.png"),
                    scale: 4),
              ),
              text: PlacemarkText(
                text: "YOU",
                style: PlacemarkTextStyle(size: 15, color: Colors.red),
              ),
            ),
            accuracyCircle: null,
            pin: PlacemarkMapObject(
              mapId: const MapObjectId("userLocation"),
              point: view.pin.point,
              icon: PlacemarkIcon.single(
                PlacemarkIconStyle(
                  image: BitmapDescriptor.fromAssetImage("assets/png/vk.png"),
                ),
              ),
              text: PlacemarkText(
                text: "YOU",
                style: PlacemarkTextStyle(size: 15, color: Colors.red),
              ),
            ),
          );
        },
        onMapTap: (point) {
          setState(() {
            // Вычисляем расстояние
            if (_startlatitude * _startlongitude == 0) {
              // Проверяем, находится ли точка в пределах круга
              _counterPlacemark++;
              _startlatitude = point.latitude;
              _startlongitude = point.longitude;
              mapObjects.add(
                PlacemarkMapObject(
                  mapId: MapObjectId('PlacemarkMapObject$_counterPlacemark'),
                  point: Point(
                      latitude: point.latitude, longitude: point.longitude),
                  opacity: 1,
                  icon: PlacemarkIcon.single(
                    PlacemarkIconStyle(
                      image: BitmapDescriptor.fromAssetImage(
                        'assets/png/avatar.png',
                      ),
                      scale: 1,
                    ),
                  ),
                ),
              );
            } else {
              double distance = haversineDistance(point.latitude,
                  point.longitude, _startlatitude, _startlongitude);

              // Проверяем, находится ли точка в пределах круга
              if (distance <= radiusDistanse) {
                _counterPlacemark++;
                _newlatitude = point.latitude;
                _newlongitude = point.longitude;
                mapObjects.add(
                  PlacemarkMapObject(
                    mapId: MapObjectId('PlacemarkMapObject$_counterPlacemark'),
                    point: Point(
                        latitude: point.latitude, longitude: point.longitude),
                    opacity: 1,
                    icon: PlacemarkIcon.single(
                      PlacemarkIconStyle(
                        image: BitmapDescriptor.fromAssetImage(
                          'assets/png/avatar.png',
                        ),
                        scale: 1,
                      ),
                    ),
                  ),
                );
              }
            }
          });
        },
        mapObjects: mapObjects,
      ),
    );
  }
}

Color randomColor() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}

// Функция конвертации градусов в радианы
double _degreesToRadians(double degrees) {
  return degrees * pi / 180.0;
}
