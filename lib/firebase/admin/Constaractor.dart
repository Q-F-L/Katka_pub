import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:katka/firebase/user/firestore_constans.dart';
import 'package:permission_handler/permission_handler.dart';

class UserFirebase {
  //все поля юзера
  String? uid;
  bool? emailVerified;
  String? city;
  String? email;
  String? name;
  String? surname;
  String? createAt;
  String? patronymic;

  UserFirebase(this.uid, this.city, this.email, this.name, this.surname,
      this.createAt, this.patronymic);
}
