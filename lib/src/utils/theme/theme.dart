import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/utils/theme/custom_themes/appbar_theme.dart';
import 'package:kgiantmobile/src/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:kgiantmobile/src/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:kgiantmobile/src/utils/theme/custom_themes/chip_theme.dart';
import 'package:kgiantmobile/src/utils/theme/custom_themes/elevatted_button_theme.dart';
import 'package:kgiantmobile/src/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:kgiantmobile/src/utils/theme/custom_themes/textfield_theme.dart';

import 'custom_themes/text_theme.dart';

class KAppTheme {
  KAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.white,
    textTheme: KTextTheme.lightTextTheme,
    elevatedButtonTheme: KElevatedButtonTheme.lightTheme,
    appBarTheme: KAppBarTheme.lightTheme,
    bottomSheetTheme: KBottomSheetTheme.lightTheme,
    checkboxTheme: KCheckboxTheme.lightTheme,
    chipTheme: KChipTheme.lightTheme,
    inputDecorationTheme: KTextFieldTheme.lightTheme,
    outlinedButtonTheme: KOutLinedButtonTheme.lightTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.black,
    textTheme: KTextTheme.darkTextTheme,
    elevatedButtonTheme: KElevatedButtonTheme.darkTheme,
    appBarTheme: KAppBarTheme.darkTheme,
    bottomSheetTheme: KBottomSheetTheme.darkTheme,
    checkboxTheme: KCheckboxTheme.darkTheme,
    chipTheme: KChipTheme.darkTheme,
    inputDecorationTheme: KTextFieldTheme.darkTheme,
    outlinedButtonTheme: KOutLinedButtonTheme.darkTheme,
  );
}
