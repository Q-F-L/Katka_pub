part of '../theme.dart';

TextTheme darkTextTheme() {
  return const TextTheme(
    button: TextStyle(
      fontFamily: "Inter",
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Color.fromARGB(255, 77, 31, 0),
    ),
    labelMedium: TextStyle(
      fontFamily: "Inter",
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color.fromARGB(255, 255, 255, 255),
    ),
  );
}
