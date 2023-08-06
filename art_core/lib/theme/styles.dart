import 'package:flutter/material.dart';

var colorBlack = const Color(0xFF14171A);
var colorWhite = const Color(0xFFffffff);
var colorDarkGrey = const Color(0xFF657786);
var colorGrey = const Color(0xFFA3A3A3);
var colorLightGrey = const Color(0xFF707070);
var colorPrimary = const Color(0xFF1672DE);
var colorSecondary = const Color(0xFF1672DE);
var colorLightBlue = const Color(0xFF1672DE);
var colorBG = const Color(0xFF000000);
var colorTitle = const Color(0xFF000000);
var iconColor = const Color(0xFF28334A);
var statusColor = const Color(0xFF664D08);

var colorHigh = Colors.redAccent;
var colorMedium = Colors.amber.shade700;
var colorLow = colorPrimary;
var colorCompleted = Colors.green;
var colorFailed = colorDarkGrey;
var colorActive = const Color(0xFF00D72F);

Color mC = Colors.grey.shade100;
Color mCL = Colors.white;
Color mCM = Colors.grey.shade200;
Color mCH = Colors.grey.shade400;
Color mCD = Colors.black.withOpacity(0.075);
Color mCC = Colors.green.withOpacity(0.65);
Color fCD = Colors.grey.shade700;
Color fCL = Colors.grey;

BoxDecoration nMbox = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  color: mC,
  boxShadow: [
    BoxShadow(
      color: mCD,
      offset: const Offset(10, 10),
      blurRadius: 10,
    ),
    BoxShadow(
      color: mCL,
      offset: const Offset(-10, -10),
      blurRadius: 10,
    ),
  ],
);

BoxDecoration nMboxCategoryOff = BoxDecoration(
  shape: BoxShape.circle,
  color: mC,
  boxShadow: [
    BoxShadow(
      color: mCD,
      offset: const Offset(10, 10),
      blurRadius: 10,
    ),
    BoxShadow(
      color: mCL,
      offset: const Offset(-10, -10),
      blurRadius: 10,
    ),
  ],
);

BoxDecoration nMboxCategoryOn = BoxDecoration(
  shape: BoxShape.circle,
  color: mCD,
  boxShadow: [
    BoxShadow(color: mCL, offset: const Offset(3, 3), blurRadius: 3, spreadRadius: -3),
  ],
);
BoxDecoration mainDecoration = BoxDecoration(borderRadius: BorderRadius.circular(5), color: colorWhite);

BoxDecoration nMboxInvert = BoxDecoration(borderRadius: BorderRadius.circular(15), color: mCD, boxShadow: [
  BoxShadow(color: mCL, offset: const Offset(3, 3), blurRadius: 3, spreadRadius: -3),
]);

BoxDecoration nMboxInvertActive = nMboxInvert.copyWith(color: mCC);

BoxDecoration nMbtn = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: mC,
  boxShadow: [
    BoxShadow(
      color: mCD,
      offset: const Offset(2, 2),
      blurRadius: 2,
    )
  ],
);

BoxDecoration gradiantDecoration(
    {double topLeftRadius = 5,
    double topRightRadius = 5,
    double bottomLeftRadius = 5,
    double bottomRightRadius = 5,
    bool circle = false}) {
  return circle
      ?   const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              colors: [Color(0xff253D52), Color(0xff156B73), Color(0xff08918F)],
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd),
        )
      : BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius),
              topRight: Radius.circular(topRightRadius),
              bottomLeft: Radius.circular(bottomLeftRadius),
              bottomRight: Radius.circular(bottomRightRadius)),
          gradient: const LinearGradient(
              colors: [Color(0xff253D52), Color(0xff156B73), Color(0xff08918F)],
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd),
        );
}
