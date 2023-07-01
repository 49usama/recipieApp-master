import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipeapp/Global%20Styles/TextFiles.dart';
import 'package:recipeapp/Responsive/Responsiveclass.dart';

class TrendingRecipe extends StatelessWidget {
  const TrendingRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsiveHeight(280, context),
      width: responsiveDesign(160, context),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: responsiveDesign(170, context),
              height: responsiveHeight(210, context),
              decoration: ShapeDecoration(
                color: Color(0xFFD9D9D9).withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: responsiveHeight(75, context),left: responsiveDesign(10, context),right: responsiveDesign(10, context)),
                    child: normalText(
                      text: 'Classic Greek Salad',
                      context: context,
                      color: Color(0xFF484848),
                      
                    ),

                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: responsiveHeight(20, context),left: responsiveDesign(10, context)),
                    child: smallText(
                      text: 'Time',
                      context: context,
                      color: Color(0xFFA9A9A9),
                    ),
                  ),
                  SizedBox(
                    height: responsiveHeight(5, context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding:  EdgeInsets.only(left: responsiveDesign(10, context)),
                        child: normalText(
                          text: '15 mins',
                          context: context,
                          color: Color(0xFF484848),

                        ),


                      ),
                      Padding(
                        padding:  EdgeInsets.only(right: responsiveDesign(10, context)),
                        child: CircleAvatar(
                          radius: responsiveDesign(11, context),
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                            'images/save.svg',
                            height: responsiveHeight(16, context),
                            width: responsiveDesign(16, context),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),

            ),
          ),

               CircleAvatar(
                 radius: responsiveDesign(53, context),
                 backgroundColor: Color(0xFFD9D9D9),
                 child: CircleAvatar(

                  radius: responsiveDesign(50, context),
                  backgroundColor: Color(0xFFD9D9D9), 
                  backgroundImage:NetworkImage('https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2018/12/Shakshuka-19.jpg'),
              ),
               ),
          Positioned(
              top: responsiveHeight(20, context),
              left: responsiveDesign(100, context),
              child: RecipeBadge(context, '4.5')),

        ],
      ),
    );
  }
}

Widget RecipeBadge(context, rating){
  return Container(
    width: responsiveDesign(48, context),
    height: responsiveHeight(30, context),
    padding:  EdgeInsets.symmetric(horizontal: responsiveDesign(7, context), vertical: responsiveHeight(3, context)),
    decoration: ShapeDecoration(
      color: Color(0xFFFFE1B3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.star,color:Color(0xffFFAD30),size: responsiveDesign(15, context),),
        smallText(text: rating,color: Colors.black,context: context),
      ],
    ),
  );

}
