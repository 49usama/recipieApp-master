
import 'package:flutter/material.dart';

import '../../Global Styles/AppFonts.dart';
import '../../Responsive/Responsiveclass.dart';

class MyCustomTextField extends StatelessWidget {
  final double width;
  final double height;
  final String hintText;
  var onchange;
  var text;
  MyCustomTextField({this.onchange,this.text, required this.width, required this.height, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.65, color: Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: TextFormField(
        onChanged: onchange,
        initialValue: text??"",
        autofocus: false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFFD9D9D9),
            fontSize: responsive(14, context),
            fontFamily: AppFonts.poppinsMedium,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        ),
      ),
    );
  }
}