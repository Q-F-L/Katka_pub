part of '../theme.dart';

const headline1 = TextStyle(fontWeight: FontWeight.w400, fontSize: 16);
const headline2 = TextStyle(fontWeight: FontWeight.w400, fontSize: 14);

abstract class AppColors {
  // LightTheme
  static const white = Colors.white;
  static const greyD0 = Color.fromRGBO(208, 208, 208, 1.0);
  static const greyA1 = Color(0xA1A1A1A1);
  static const grey71 = Color(0x71717171);
  static const grey42 = Color(0x42424242);
  static const lightColorDownPanel = Color.fromRGBO(255, 255, 255, 0.9);

  // DarkTheme 42, 71, A1, D0
  static const black = Color(0xFF131313);
  static const darkColorDownPanel = Color.fromRGBO(19, 19, 19, 0.9);

  static const yellow = Color(0xFFE8CF57);
}
