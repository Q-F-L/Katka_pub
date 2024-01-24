import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:katka/global_value.dart';
import 'package:katka/pages/personal_account.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  String text = "";

  @override
  void dispose() {
    // TODO: implement dispose
    emailTextInputController.dispose();
    passwordTextInputController.dispose();

    super.dispose();
  }

  Future<void> login() async {
    final navigator = Navigator.of(context);

    final isValid = fromKey.currentState!.validate();
    if (!isValid) return;

    try {
      var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextInputController.text.trim(),
          password: passwordTextInputController.text.trim());
      userGlobal.uid = user.user!.uid;
      userGlobal.email = user.user!.email;
      userGlobal.emailVerified = user.user!.emailVerified;
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        setState(() {
          text = "Вы ввели недействительные данные";
        });
        return;
      } else {
        setState(() {
          text =
              "Не известная ошибка! Попробуйте ещё раз позде или обратитесь в техподдержку.";
        });
        return;
      }
    }

    navigator.pushNamedAndRemoveUntil(
        '/account', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context)
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 35,
                ),
              )
            : null,
        title: Text('Вход'),
        backgroundColor: Color.fromARGB(255, 41, 42, 44),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Form(
          key: fromKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text != ""
                  ? Text(
                      text,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : SizedBox(),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailTextInputController,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Введите правильную почту'
                              : null,
                      style: TextStyle(
                        color: Color.fromARGB(255, 164, 165, 167),
                        fontFamily: "Inter",
                        fontSize: 16,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Color.fromARGB(255, 41, 42, 44),
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 164, 165, 167),
                          fontFamily: "Inter",
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordTextInputController,
                      autocorrect: false,
                      validator: (value) => value != null && value.length < 6
                          ? "Минимум 6 символов"
                          : null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: TextStyle(
                        color: Color.fromARGB(255, 164, 165, 167),
                        fontFamily: "Inter",
                        fontSize: 16,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Color.fromARGB(255, 41, 42, 44),
                        hintText: "Пароль",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 164, 165, 167),
                          fontFamily: "Inter",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  login();
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size.fromHeight(50)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Color.fromARGB(255, 246, 188, 29)),
                ),
                child: const Text(
                  "Авторизоваться",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 77, 31, 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
