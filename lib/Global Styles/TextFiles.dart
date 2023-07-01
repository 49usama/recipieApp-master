
import 'package:flutter/material.dart';
import 'package:recipeapp/Global%20Styles/AppFonts.dart';
import 'package:recipeapp/Responsive/Responsiveclass.dart';

Widget  MediumlargeText({text,context,Color? color}){
  return Text(
    '$text',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: responsiveDesign(18, context),
      fontFamily: AppFonts.poppinsMedium,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget  HeadingText({text,context,Color? color}){
  return Text(
    '$text',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: responsiveDesign(20, context),
      fontFamily: AppFonts.poppinsSemiBold,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget  MediumText({text,context,Color? color}){
  return Text(
    '$text',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: responsiveDesign(16, context),
      fontFamily: AppFonts.poppinsMedium,
      fontWeight: FontWeight.w600,
    ),
  );
}
Widget  ExtraLargeText({text,context,Color? color}){
  return Text(
    '$text',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: responsiveDesign(50, context),
      fontFamily: AppFonts.poppinsMedium,
      fontWeight: FontWeight.w600,
     //  height: responsiveHeight(60, context),
    ),
  );
}
Widget  normalText({text,context,Color? color}){
  return Text(
    '$text',
     textAlign: TextAlign.center,

    style: TextStyle(

      color: color,
      fontSize: responsiveDesign(14, context),
      fontFamily: AppFonts.poppinsSemiBold,
      fontWeight: FontWeight.w600,
      //  height: responsiveHeight(60, context),
    ),
  );
}

Widget  smallText({text,context,Color? color}){
  return Text(
    '$text',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: responsiveDesign(11, context),
      fontFamily: AppFonts.poppinsMedium,
      fontWeight: FontWeight.w600,
      //  height: responsiveHeight(60, context),
    ),
  );
}