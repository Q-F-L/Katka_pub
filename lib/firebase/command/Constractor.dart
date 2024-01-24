import 'dart:ffi';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:katka/firebase/command/firestore_constans.dart';
import 'package:katka/firebase/user/firestore_constans.dart';
import 'package:permission_handler/permission_handler.dart';

class CommandFireStore {
  //все поля юзера
  int? id;
  String? name;
  String? description;
  String? imageLogoPath;
  String? imageCommandPath;
  String? country;
  String? city;
  String? colorUniform;
  String? commander;
  String? rationgCommand;
  List<String> listPlayers;
  File? fileCommand, fileLogo;

  CommandFireStore(
      this.id,
      this.name,
      this.description,
      this.imageLogoPath,
      this.imageCommandPath,
      this.country,
      this.city,
      this.colorUniform,
      this.commander,
      this.listPlayers,
      this.rationgCommand);

  Future commandStream(int? id) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final QuerySnapshot result = await firebaseFirestore
        .collection(FirestoreConstantsCommand.pathCommandCollection)
        .where(FirestoreConstantsCommand.id, isEqualTo: id)
        .get();
    this..city = result.docs.first.get(FirestoreConstantsCommand.city);
    this..country = result.docs.first.get(FirestoreConstantsCommand.country);
    this
      ..colorUniform =
          result.docs.first.get(FirestoreConstantsCommand.colorUniform);
    this
      ..commander = result.docs.first.get(FirestoreConstantsCommand.commander);
    this
      ..description =
          result.docs.first.get(FirestoreConstantsCommand.description);
    this
      ..imageCommandPath =
          result.docs.first.get(FirestoreConstantsCommand.imageCommandPath);
    this
      ..imageLogoPath =
          result.docs.first.get(FirestoreConstantsCommand.imageLogoPath);
    this
      ..listPlayers =
          result.docs.first.get(FirestoreConstantsCommand.listPlayers);
    this..name = result.docs.first.get(FirestoreConstantsCommand.name);
    this
      ..rationgCommand =
          result.docs.first.get(FirestoreConstantsCommand.rationgCommand);
  }

  Future<DocumentSnapshot<Object?>> commanderStream() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    if (this.commander == null) {
      commandStream(this.id);
    }
    final QuerySnapshot result = await firebaseFirestore
        .collection(FirestoreConstants.pathUserCollection)
        .where(FirestoreConstants.uid, isEqualTo: this.commander)
        .get();

    return result.docs.first;
  }

  editCommanderStream(String newCommanderUid, String newCommanderName) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    if (this.commander == null) {
      commandStream(this.id);
    }
    try {
      await firebaseFirestore
          .collection(FirestoreConstantsCommand.pathCommandCollection)
          .doc("${this.id}")
          .update({
        FirestoreConstantsCommand.name: newCommanderName,
        FirestoreConstantsCommand.nameCommander: newCommanderName,
        FirestoreConstantsCommand.commander: newCommanderUid,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  deleteCommandStream(String newCommanderUid, String newCommanderName) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    if (this.commander == null) {
      commandStream(this.id);
    }
    try {
      await firebaseFirestore
          .collection(FirestoreConstantsCommand.pathCommandCollection)
          .doc("${this.id}")
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }

  deleteUser(String userUid) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    if (this.commander == null) {
      commandStream(this.id);
    }

    listPlayers.remove(userUid);

    try {
      await firebaseFirestore
          .collection(FirestoreConstantsCommand.pathCommandCollection)
          .doc("${this.id}")
          .update({FirestoreConstantsCommand.listPlayers: listPlayers});
    } catch (e) {
      print(e.toString());
    }
  }

  downloadImageLogo() async {
    final _firebaseStorage = FirebaseStorage.instance;
    var snapshot = await _firebaseStorage.ref().child(this.imageLogoPath ?? '');
    String? downloadUrl = await snapshot.getDownloadURL();
    this.imageLogoPath = downloadUrl;
  }

  downloadImageCommand() async {
    final _firebaseStorage = FirebaseStorage.instance;
    var snapshot =
        await _firebaseStorage.ref().child(this.imageCommandPath ?? '');
    String? downloadUrl = await snapshot.getDownloadURL();
    this.imageCommandPath = downloadUrl;
  }

  editLogoImage(String userUid) async {
    final _firebaseStorage = FirebaseStorage.instance;
    try {
      await _firebaseStorage.ref().child(this.imageLogoPath ?? '').delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
