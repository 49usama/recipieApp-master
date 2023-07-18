import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipeapp/Global%20Styles/TextFiles.dart';
import 'package:recipeapp/Responsive/Responsiveclass.dart';

class TrendingRecipe extends StatelessWidget {
  const TrendingRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     height:responsive(200, context),
      width: responsiveDesign(160/2, context)+ responsiveHeight(160/2, context),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: responsive(170, context),
              height: responsive(180, context),
              decoration: ShapeDecoration(
                color: Color(0xFFD9D9D9).withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(responsive(12, context)),
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
                    padding:  EdgeInsets.only(top: responsive(20, context),left: responsive(10, context)),
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
                        padding:  EdgeInsets.only(left: responsiveDesign(10/2, context)+ responsiveHeight(10/2, context),),
                        child: normalText(
                          text: '15 mins',
                          context: context,
                          color: Color(0xFF484848),

                        ),


                      ),
                      Padding(
                        padding:  EdgeInsets.only(right: responsiveDesign(10, context)),
                        child: CircleAvatar(
                          radius: responsiveDesign(11/2, context)+ responsiveHeight(11/2, context),
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                            'images/save.svg',
                            height: responsiveDesign(16/2, context)+ responsiveHeight(16/2, context),
                            width:  responsiveDesign(16/2, context)+ responsiveHeight(16/2, context),
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
                 radius: responsiveDesign(53/2, context)+ responsiveHeight(53/2, context),
                 backgroundColor: Color(0xFFD9D9D9),
                 child: CircleAvatar(

                  radius: responsiveDesign(50/2, context)+ responsiveHeight(50/2, context),
                  backgroundColor: Color(0xFFD9D9D9), 
                  backgroundImage:NetworkImage('https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2018/12/Shakshuka-19.jpg'),
              ),
               ),
          Positioned(
              top: responsiveDesign(20/2, context)+ responsiveHeight(20/2, context),
              left: responsiveDesign(100/2, context)+ responsiveHeight(100/2, context),
              child: RecipeBadge(context, '4.5')),

        ],
      ),
    );
  }
}

Widget RecipeBadge(context, rating){
  return Container(
    width:responsive(45, context),
    height: responsive(20, context),
    padding:  EdgeInsets.symmetric(horizontal: responsive(4, context), vertical:responsive(3, context),),
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
        Icon(Icons.star,color:Color(0xffFFAD30),size: responsive(15, context),),
        smallText(text: rating,color: Colors.black,context: context),
      ],
    ),
  );

}
