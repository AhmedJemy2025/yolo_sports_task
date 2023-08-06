import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppSwitchThemes {
  static SwitchThemeData light = SwitchThemeData(
    trackColor: MaterialStateProperty.resolveWith((states) {
      return AppColors.primaryColorLight;
    }),
    thumbColor: MaterialStateProperty.resolveWith((states) {
      return AppColors.primaryColorLight;
    }),
  );

  static SwitchThemeData dark = SwitchThemeData(
    trackColor: MaterialStateProperty.resolveWith((states) {
      return AppColors.primaryColorLight;
    }),
    thumbColor: MaterialStateProperty.resolveWith((states) {
      return AppColors.primaryColorLight;
    }),
  );
}
