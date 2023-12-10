part of '../theme.dart';

ThemeData lightTheme() {
  return ThemeData(
    backgroundColor: Color.fromARGB(255, 0, 85, 255),
    // buttonTheme: const ButtonThemeData(
    //   colorScheme: ColorScheme(
    //     brightness: Brightness.dark,
    //     primary: AppColors.black,
    //     onPrimary: AppColors.greyD0,
    //     secondary: AppColors.greyA1,
    //     onSecondary: AppColors.greyA1,
    //     surface: AppColors.grey71,
    //     onSurface: AppColors.grey42,
    //     background: AppColors.white,
    //     onBackground: AppColors.white,
    //     error: AppColors.white,
    //     onError: AppColors.white,
    //   ),
    // ),
    // inputDecorationTheme:
    //     const InputDecorationTheme(fillColor: AppColors.greyD0),
    // colorScheme: const ColorScheme(
    //   brightness: Brightness.light,
    //   primary: AppColors.white,
    //   onPrimary: AppColors.greyD0,
    //   secondary: AppColors.greyA1,
    //   onSecondary: AppColors.greyA1,
    //   surface: AppColors.grey71,
    //   onSurface: AppColors.grey42,
    //   background: AppColors.white,
    //   onBackground: AppColors.white,
    //   error: AppColors.white,
    //   onError: AppColors.white,
    // ),
    // scaffoldBackgroundColor: AppColors.white,
    // appBarTheme: const AppBarTheme(
    //   shape: Border(bottom: BorderSide(color: AppColors.greyD0, width: 1)),
    //   elevation: 4,
    //   backgroundColor: AppColors.white,
    // ),
    textTheme: darkTextTheme(),
  );
}
