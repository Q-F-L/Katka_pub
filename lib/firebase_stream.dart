import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:katka/global_value.dart';
import 'package:katka/pages/auth.dart';
import 'package:katka/pages/personal_account.dart';

class FirebaseStream extends StatelessWidget {
  const FirebaseStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error ${snapshot.error}"),
            ),
          );
        } else if (snapshot.hasData) {
          // if (!snapshot.data!.emailVerified) { // Провека Почты
          //   return const PageVerifiedEmail
          // }
          final user = FirebaseAuth.instance.currentUser;
          if (user == null) {
            return const Auth();
          } else {
            return const PersonalAccount();
          }
        } else {
          return const Auth();
        }
      },
    );
  }
}
