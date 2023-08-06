// import 'package:intercome_app/core/theme/themes.dart';

import '../themes.dart';

class TextFieldThemes {
  static const double _radius = 4;
  static const double _width1_5 = 1;

  static  InputDecorationTheme light = InputDecorationTheme(
    // enabled border style
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColorLight, width: _width1_5), borderRadius: BorderRadius.all(Radius.circular(_radius))),

      // focused border style
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColorLight, width: _width1_5), borderRadius: BorderRadius.all(Radius.circular(_radius))),

      // error border style
      errorBorder: const OutlineInputBorder(
        // borderSide: BorderSide(color: AppColors.purple, width: _width1_5),
          borderSide: BorderSide(color: Colors.red, width: _width1_5),
          borderRadius: BorderRadius.all(Radius.circular(_radius))),

      // focused Error border style
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: _width1_5), borderRadius: BorderRadius.all(Radius.circular(_radius))),
      labelStyle: TextStyle(
        color: AppColors.primaryColorLight.withOpacity(0.8),
        fontWeight: FontWeight.normal,
      ),
      hintStyle: TextStyle(
        color: AppColors.primaryColorLight.withOpacity(0.8),
        fontWeight: FontWeight.normal,
      ),
      contentPadding: const EdgeInsets.all(8),
  );

  static  InputDecorationTheme dark = InputDecorationTheme(
    // enabled border style
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColorDark, width: _width1_5), borderRadius: BorderRadius.all(Radius.circular(_radius))),

      // focused border style
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColorDark, width: _width1_5), borderRadius: BorderRadius.all(Radius.circular(_radius))),

      // error border style
      errorBorder: const OutlineInputBorder(
        // borderSide: BorderSide(color: AppColors.purple, width: _width1_5),
          borderSide: BorderSide(color: Colors.red, width: _width1_5),
          borderRadius: BorderRadius.all(Radius.circular(_radius))),

      // focused Error border style
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: _width1_5), borderRadius: BorderRadius.all(Radius.circular(_radius))),
      labelStyle: TextStyle(
        color: AppColors.primaryColorDark.withOpacity(0.8),
        fontWeight: FontWeight.normal,
      ),
      hintStyle: TextStyle(
        color: AppColors.primaryColorDark.withOpacity(0.8),
        fontWeight: FontWeight.normal,
      ),
      contentPadding: const EdgeInsets.all(8),

  );



  static InputDecoration lightDecoration = InputDecoration(
      // enabled border style
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColorLight, width: _width1_5), borderRadius: BorderRadius.all(Radius.circular(_radius))),

      // focused border style
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColorLight, width: _width1_5), borderRadius: BorderRadius.all(Radius.circular(_radius))),

      // error border style
      errorBorder: const OutlineInputBorder(
          // borderSide: BorderSide(color: AppColors.purple, width: _width1_5),
          borderSide: BorderSide(color: Colors.red, width: _width1_5),
          borderRadius: BorderRadius.all(Radius.circular(_radius))),

      // focused Error border style
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: _width1_5), borderRadius: BorderRadius.all(Radius.circular(_radius))),
      labelStyle: TextStyle(
        color: AppColors.primaryColorLight.withOpacity(0.8),
        fontWeight: FontWeight.normal,
      ),
      hintStyle: TextStyle(
        color: AppColors.primaryColorLight.withOpacity(0.8),
        fontWeight: FontWeight.normal,
      ),
      contentPadding: const EdgeInsets.all(8));
}
