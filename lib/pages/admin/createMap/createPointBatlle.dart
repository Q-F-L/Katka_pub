import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class CreatePointBatlle extends StatefulWidget {
  @override
  _CreatePointBatlleState createState() => _CreatePointBatlleState();
}

class _CreatePointBatlleState extends State<CreatePointBatlle> {
  YandexMapController? _mapController;
  final List<MapObject> mapObjects = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yandex Map'),
      ),
      body: YandexMap(
        onMapCreated: (YandexMapController controller) {
          _mapController = controller;
          drawCircleOnMap();
          controller.moveCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: Point(latitude: 43.0243, longitude: 44.6826),
                zoom: 100,
              ),
            ),
          );
        },
      ),
    );
  }

  void drawCircleOnMap() {
    if (_mapController != null) {
      // Координаты Владикавказа
      final double lat = 43.0243;
      final double long = 44.6826;
      // Добавляем круг с центром в Владикавказе и радиусом 1 км
      // _mapController!.addCircle();
      Circle circle = Circle(
        center: Point(latitude: lat, longitude: long),
        radius: 1000, // Радиус в метрах (1000 м = 1 км)
      );
      CircleMapObject circll = CircleMapObject(
        zIndex: 1000,
        mapId: MapObjectId('selPoint'),
        circle: circle,
        isGeodesic: true,
        isVisible: true,
        fillColor: Colors.red,
        strokeColor: Colors.red,
        strokeWidth: 100,
      );
      _mapController!.getPoint(ScreenPoint(x: lat, y: long));
      mapObjects.add(circll);
    }
  }
}
