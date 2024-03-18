import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:katka/firebase/command/Constractor.dart';
import 'package:katka/firebase/user/Constaractor.dart';

UserFirebase userGlobal =
    UserFirebase('', '', '', null ,'', File(''), '', '', '', '', '', '', '');
CommandFireStore commandGlobal =
    CommandFireStore(null, '', '', '', '', '', '', '', '', [], '');
