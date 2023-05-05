// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';

class ThemeProvider with ChangeNotifier {
  bool isLightTheme;
  ThemeProvider({
    required this.isLightTheme,
  });

  ThemeData themeData() {
    String fontFamily = "Baloo";
    return ThemeData(
      scaffoldBackgroundColor:
          isLightTheme ? AppColors.white : AppColors.lightBlack,
      appBarTheme: isLightTheme
          ? const AppBarTheme(
              elevation: 0,
              backgroundColor: AppColors.white,
            )
          : const AppBarTheme(
              elevation: 0,
              backgroundColor: AppColors.black,
            ),
      fontFamily: fontFamily,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.handlee(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: isLightTheme ? AppColors.black : AppColors.white,
        ),
        displayMedium: GoogleFonts.handlee(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: isLightTheme ? AppColors.darkGray : AppColors.lightGray,
        ),
        displaySmall: GoogleFonts.handlee(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: isLightTheme ? AppColors.darkGray : AppColors.lightGray,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(
              primarySwatch: isLightTheme ? Colors.blue : Colors.yellow)
          .copyWith(
              secondary: isLightTheme ? AppColors.navyBlue : AppColors.yellow,
              brightness: isLightTheme ? Brightness.light : Brightness.dark),
    );
  }

  toggleThemeData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (isLightTheme) {
      sharedPreferences.setBool(SPref.isLight, false);
      isLightTheme = !isLightTheme;
      notifyListeners();
    } else {
      sharedPreferences.setBool(SPref.isLight, true);
      isLightTheme = !isLightTheme;
      notifyListeners();
    }
    notifyListeners();
  }

  ThemeMode themeMode() {
    return ThemeMode(
      tertiaryThemeColor: isLightTheme ? AppColors.white : AppColors.black,
      contentColor: isLightTheme ? AppColors.darkGray : AppColors.lightGray,
      textColor: isLightTheme ? AppColors.black : AppColors.white,
      dotsIndicatorColor: isLightTheme ? AppColors.black : AppColors.white,
      iconColor: isLightTheme ? AppColors.gray : AppColors.white,
      navBarIconColor: isLightTheme ? AppColors.navyBlue : AppColors.white,
      containerColor: isLightTheme ? AppColors.white : AppColors.lightBlack,
      boxContainerColor: isLightTheme ? AppColors.gray : AppColors.darkGray,
      defaultBoxContainerColor:
          isLightTheme ? AppColors.blue : AppColors.lightBlue,
      lineColor: isLightTheme ? AppColors.darkGray : AppColors.gray,
      inputThemeColor: isLightTheme ? AppColors.gray : AppColors.lightBlack,
      chatIconColor: isLightTheme ? AppColors.navyBlue : AppColors.yellow,
      primaryContentColor:
          isLightTheme ? AppColors.darkGray : AppColors.lightBlack,
      themeColor: isLightTheme ? AppColors.lightBlack : AppColors.white,
      hmColor: isLightTheme ? AppColors.navyBlue : AppColors.yellow,
      primaryThemeColor: isLightTheme ? AppColors.white : AppColors.lightBlack,
      secondaryThemeColor: isLightTheme ? AppColors.darkGray : AppColors.gray,
      primaryTransparentColor: isLightTheme
          ? AppColors.darkGrayOpacity30
          : AppColors.lightGrayOpacity30,
      secondaryTransparentColor: isLightTheme
          ? AppColors.darkBlueOpacity50
          : AppColors.lightYellowOpacity50,
      cardColor:
          isLightTheme ? const Color(0xB4F2F0F0) : const Color(0x34F2F0F0),
    );
  }
}

class ThemeMode {
  Color? tertiaryThemeColor;
  Color? contentColor;
  Color? textColor;
  Color? dotsIndicatorColor;
  Color? iconColor;
  Color? navBarIconColor;
  Color? navBarIconActiveColor;
  Color? containerColor;
  Color? boxContainerColor;
  Color? defaultBoxContainerColor;
  Color? lineColor;
  Color? inputThemeColor;
  Color? chatIconColor;
  Color? primaryContentColor;
  Color? themeColor;
  Color? hmColor;
  Color? primaryThemeColor;
  Color? secondaryThemeColor;
  Color? primaryTransparentColor;
  Color? secondaryTransparentColor;
  Color? cardColor;

  ThemeMode({
    this.tertiaryThemeColor,
    this.contentColor,
    this.textColor,
    this.dotsIndicatorColor,
    this.iconColor,
    this.navBarIconColor,
    this.containerColor,
    this.boxContainerColor,
    this.defaultBoxContainerColor,
    this.lineColor,
    this.inputThemeColor,
    this.chatIconColor,
    this.primaryContentColor,
    this.themeColor,
    this.hmColor,
    this.primaryThemeColor,
    this.secondaryThemeColor,
    this.primaryTransparentColor,
    this.secondaryTransparentColor,
    this.cardColor,
  });
}

/*
ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: fontFamily,
        ),


*/