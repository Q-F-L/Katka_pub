import 'dart:convert';
import 'dart:io';

class JsonCoder {
  Future<ListCity> decoder() async {
    try {
      File file = File("russia.json");
      final data = await file.readAsString(); // считываем файл как строку
      final decoded = json.decode(data); // преобразуем в словарь Map
      final ListCity list =
          ListCity.fromJson(decoded); // создаем объект ListCity
      return list;
    } catch (e) {
      return ListCity(list: [City(region: null, city: null)]);
    }
  }

  void encoder(ListCity list) async {
    try {
      var encoded = json.encode(list.toJson()); // преобразуем в json
      File file = File("russia.json");
      await file.writeAsString(encoded); // запись в файл
    } catch (e) {
      print('error');
    }
  }
}

class ListCity {
  List<City>? _list;

  ListCity({List<City>? list});

  List<City>? get list => _list;
  set region(List<City>? region) => _list = list;

  ListCity.fromJson(Map<String, dynamic> json) {
    _list = (json['list'] as List<dynamic>)
        .map((dynamic e) => City.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list'] = this._list;
    return data;
  }
}

class City {
  String? _region;
  String? _city;

  City({String? region, String? city}) {
    if (region != null) {
      this._region = region;
    }
    if (city != null) {
      this._city = city;
    }
  }

  String? get region => _region;
  set region(String? region) => _region = region;
  String? get city => _city;
  set city(String? city) => _city = city;

  City.fromJson(Map<String, dynamic> json) {
    _region = json['region'];
    _city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['region'] = this._region;
    data['city'] = this._city;
    return data;
  }
}
