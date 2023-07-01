import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipeapp/Global%20Styles/AppFonts.dart';
import 'package:recipeapp/Responsive/Responsiveclass.dart';

Widget Search(context){
  return Container(
    width: responsiveDesign(280, context),
    height: responsiveHeight(50, context),
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 0.65, color: Color(0xFFD9D9D9)),
        borderRadius: BorderRadius.circular(10),
      ),

    ),
    child: Center(
      child:
          TextField(
            style: TextStyle(

              // color: Colors.black45.withOpacity(0.4),
              // fontSize: responsiveDesign(11, context),
              fontFamily: AppFonts.poppinsMedium,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintStyle: TextStyle(

                color: Colors.black45.withOpacity(0.4),
                fontSize: responsiveDesign(14, context),
                fontFamily: AppFonts.poppinsMedium,
                fontWeight: FontWeight.w400,
              ) ,
              hintText: 'Search recipe',

prefixIconConstraints: BoxConstraints(
  minHeight: responsiveHeight(25, context),
  minWidth: responsiveDesign(25, context),
  maxHeight: responsiveHeight(100, context),
  maxWidth: responsiveDesign(100, context),

),
prefix:  SizedBox(
  width: responsiveDesign(6, context),
),
prefixIcon:
   Padding(
     padding:  EdgeInsets.only(left: responsiveDesign(10, context)),
     child: SvgPicture.asset('images/search.svg',

  ),
   ),

              border: InputBorder.none,
            ),
          ),


    ),
  );
}