import 'package:art_core/art_core.dart';
import 'package:flutter_modular/flutter_modular.dart';

void showSnackBar(String text,{bool isError = false}) {
  ScaffoldMessenger.of(
    Modular.routerDelegate.navigatorKey.currentContext!,
  ).showSnackBar(SnackBar(
    content: AppText(
      text: text,
      color: colorWhite,
    ),
    backgroundColor:isError ? AppColors.red:colorPrimary,
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    duration: const Duration(seconds: 3),
  ));

}
