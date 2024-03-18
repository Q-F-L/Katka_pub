
class AdminFirebase {
  //все поля юзера
  String? uid;
  bool? emailVerified;
  String? city;
  String? email;
  String? name;
  String? surname;
  String? createAt;
  String? patronymic;

  AdminFirebase(this.uid, this.city, this.email, this.name, this.surname,
      this.createAt, this.patronymic);
}
