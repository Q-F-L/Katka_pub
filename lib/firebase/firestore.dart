// import 'dart:io';
// import 'dart:math';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';

// class Firestore {
//   UploadTask uploadFile(File image, String fileName) {
//     FirebaseStorage firebaseStorage = FirebaseStorage.instance;
//     Reference reference = firebaseStorage.ref().child(fileName);
//     UploadTask uploadTask = reference.putFile(image);
//     return uploadTask;
//   }

//   Future fileUpload(
//       int typeUser, File imageFile, String currentUserId, String preeId) async {
//     String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//     UploadTask uploadTask = uploadFile(imageFile, fileName);

//     try {
//       TaskSnapshot snapshot = await uploadTask;
//       String imageUrl = await snapshot.ref.getDownloadURL();

//       print("fileUpload !!!!!!!!!!!!!!!!!!!!! ");
//     } on FirebaseException catch (e) {
//       Fluttertoast.showToast(msg: e.message ?? e.toString());
//     }
//   }

//   Future getImage(int typeUser, String currentUserId, String preeId) async {
//     ImagePicker imagePicker = ImagePicker();
//     XFile? pickedFile;

//     pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       File imageFile = File(pickedFile.path);
//       if (imageFile != null) {
//         fileUpload(typeUser, imageFile, currentUserId, preeId);
//       }
//     }
//   }

//   Future uploadFileUser(File image, String fileName, String userId) async {
//     UploadTask uploadTask = uploadFile(image, fileName);
//     String photoUrl = '';
//     try {
//       TaskSnapshot snapshot = await uploadTask;
//       photoUrl = await snapshot.ref.getDownloadURL();
//       print('uploadFileUser !!!!!!!!!!!!!!!!');
//     } on FirebaseException catch (e) {
//       Fluttertoast.showToast(msg: e.message ?? e.toString());
//     }
//   }

//   Future getImageUser(String userId) async {
//     ImagePicker imagePicker = ImagePicker();
//     XFile? pickerFile;

//     pickerFile = await imagePicker
//         .pickImage(source: ImageSource.gallery)
//         .catchError((err) {
//       Fluttertoast.showToast(msg: err.toString());
//     });
//     File? image;
//     if (pickerFile != null) {
//       image = File(pickerFile.path);
//     }
//     if (image != null) {
//       String fileName = DateTime.now().microsecondsSinceEpoch.toString();
//       return (image, fileName, userId);
//     }
//     return;
//   }
// }
