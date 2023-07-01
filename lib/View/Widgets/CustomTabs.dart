import 'package:flutter/material.dart';
import 'package:recipeapp/Global%20Styles/TextFiles.dart';
import 'package:recipeapp/Responsive/Responsiveclass.dart';

class CustomTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CustomTab({
    Key? key,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: responsiveDesign(5, context)),
      child: Container(
      //  width: responsiveDesign(57, context),
        height: responsiveHeight(40, context),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        decoration: ShapeDecoration(
          color: isSelected ? Color(0xFF119475) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: smallText(
            text: text,
            color: isSelected ? Colors.white : Color(0xFF119475),
            context: context,
          ),
        )

      ),
    );
  }
}