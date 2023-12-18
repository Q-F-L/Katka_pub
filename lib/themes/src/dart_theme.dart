part of '../theme.dart';

ThemeData darkTheme() {
  return ThemeData(
    backgroundColor: Color.fromARGB(255, 29, 30, 31),
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
    // colorScheme: const ColorScheme(
    //   brightness: Brightness.dark,
    //   primary: AppColors.black,
    //   onPrimary: AppColors.grey42,
    //   secondary: AppColors.grey71,
    //   onSecondary: AppColors.grey71,
    //   surface: AppColors.greyA1,
    //   onSurface: AppColors.greyD0,
    //   background: AppColors.black,
    //   onBackground: AppColors.darkColorDownPanel,
    //   error: AppColors.black,
    //   onError: AppColors.black,
    // ),
    // scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(
      elevation: 0.1,
    ),
    textTheme: darkTextTheme(),
  );
}
