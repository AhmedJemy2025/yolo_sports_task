import 'package:flutter/material.dart';

import '../app_colors.dart';


class AppElevatedButtonThemes {
  static ElevatedButtonThemeData light = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) => AppColors.primaryColorLight),
      foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),

    ),
  );

  static ElevatedButtonThemeData dark = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) => AppColors.primaryColorLight),
      foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black),
    ),
  );
}
