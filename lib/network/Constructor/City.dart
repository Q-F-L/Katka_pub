class Citys {
  String? region;
  String? city;

  Citys({this.region, this.city});

  Citys.fromJson(Map<String, dynamic> json) {
    region = json['region'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['region'] = this.region;
    data['city'] = this.city;
    return data;
  }
}
