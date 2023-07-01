import 'package:flutter/material.dart';
import 'package:recipeapp/Global%20Styles/TextFiles.dart';
import 'package:recipeapp/Responsive/Responsiveclass.dart';

class NewRecipe extends StatelessWidget {
  const NewRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsiveHeight(180, context),
     width: responsiveDesign(295, context),
      child: Stack(

        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(responsiveHeight(20, context)),
              ),
                color: Colors.white,
              child: Container(
                height: responsiveHeight(120, context),
                width: responsiveDesign(300, context),
                child: Padding(
                  padding:  EdgeInsets.only(top: responsiveHeight(10, context),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: responsiveDesign(150, context),
                        height: responsiveHeight(20, context),
                        child: normalText(
                          text: 'Steak with tomato sauce and bulgur rice.',
                          context: context,
                          color: Color(0xFF484848),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: responsiveDesign(10, context),top: responsiveHeight(10, context),bottom: responsiveHeight(10, context)),
                        child: Container(
                          height: responsiveHeight(20, context),
                          child: ListView.builder(
                            shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:5,
                              itemBuilder: (context,i){
                            return Icon(Icons.star,color:Color(0xffFFAD30),size: responsiveDesign(15, context),);
                          }),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: responsiveDesign(10, context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                               CircleAvatar(
                                    radius: responsiveDesign(15, context),
                                    backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxsR8Th9DhpNwI1Gsj2fyL8eHJgrY-kVEYWQ50040j&s"),
                                  ),
                                SizedBox(width: responsiveDesign(5, context),),
                                smallText(
                                    text: 'By James Milner',
                                    context: context,
                                    color:  Color(0xFFA9A9A9),
                                  ),

                              ],
                            ),
                            Padding(
                              padding:  EdgeInsets.only(right: responsiveDesign(10, context)),
                              child: Row(
                                children:[
                                  Icon(Icons.watch_later_outlined,size: responsiveDesign(17, context),color: Color(0xFFA9A9A9),),
                                  SizedBox(width: responsiveDesign(5, context),),
                                  smallText(
                                    text: '20 mins',
                                    context: context,
                                    color: Color(0xFFA9A9A9),
                                  )
                                ]
                               
                              ),
                            ),
                            
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: responsiveDesign(20, context)),
              child: CircleAvatar(
                radius: 50,
                backgroundImage:NetworkImage('https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2018/12/Shakshuka-19.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
