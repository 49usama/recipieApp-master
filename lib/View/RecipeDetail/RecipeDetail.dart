

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:recipeapp/Global%20Styles/TextFiles.dart';
import 'package:recipeapp/Responsive/Responsiveclass.dart';
import 'package:recipeapp/View/Widgets/TrandingRecipeContainer.dart';

import '../../Global Styles/Listtile.dart';
import '../Widgets/tabs.dart';
List<bool> isTab1Active = [true,false];
var tabs = ['Ingridents', 'Procedure',];
class Recipedetail extends StatefulWidget {
  const Recipedetail({super.key});

  @override
  State<Recipedetail> createState() => _RecipedetailState();
}

class _RecipedetailState extends State<Recipedetail> {
  int Selected = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(left:25.0,right: 25.0),
              child: Container(
                width: responsiveDesign(370, context),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: responsive(20, context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           InkWell(
                               onTap: (){
                                 Get.back();
                               },
                               child: Icon(Icons.arrow_back)),

                          SvgPicture.asset(
                            'images/more.svg',
                            height: responsiveDesign(25/2, context)+ responsiveHeight(16/2, context),
                            width:  responsiveDesign(25/2, context)+ responsiveHeight(16/2, context),
                          )
                        ],
                      ),
                    ),

                    Container(
                      height: responsive(200, context),
                      // width: responsive(350, context),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/background.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(right: responsive(10, context),top:responsive(10, context) ),
                            child: RecipeBadge(context, '4.5'),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(right: responsive(1, context),top:responsive(135, context) ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,

                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: responsive(10, context)),
                                  child: SvgPicture.asset(
                                    'images/timer.svg',
                                    height: responsiveDesign(16/2, context)+ responsiveHeight(16/2, context),
                                    width:  responsiveDesign(16/2, context)+ responsiveHeight(16/2, context),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: normalText(
                                    color: Colors.white,
                                    context: context,
                                    text: '20 min'
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(right: responsive(10, context),left: responsive(10, context)),
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
                            ),
                          ),


                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: HeadingText(
                                center: false,
                                text: 'Spicy chicken burger with\nFrench fries',
                                context: context,
                                color: Colors.black
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 25),
                          child: normalText(
                            color:Color.fromRGBO(169, 169, 169, 1),
                            context: context,
                            text: '(13K Reviews)'

                          ),
                        )

                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // height: 50,
                        // width: 380,
                        // color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: responsive(45, context),
                              height: responsive(50, context),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxsR8Th9DhpNwI1Gsj2fyL8eHJgrY-kVEYWQ50040j&s"),
                                  fit: BoxFit.cover,
                                ),
                                color: Color(0xFFFFCE80),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Column(
                                children: [
                                  HeadingText(
                                    center: false,
                                    text: 'Laura Wilson',
                                    context: context,
                                    color: Colors.black
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.fromLTRB(responsive(3, context), 0, responsive(50, context), 0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.location_on,color: Colors.green,size: responsive(15, context),),
                                        smallText(
                                          color: Color.fromRGBO(169, 169, 169, 1),
                                          context: context,
                                          text: 'Lagos,Nigeria'
                                        )
                                      ],
                                    ),
                                  ),



                                ],
                              ),
                            ),
                            SizedBox(
                              width: responsive(50, context),
                            ),

                            Container(
                              height: responsive(40, context),
                              width: responsive(80, context),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(18, 149, 117, 1),
                                //Colors.pink,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: normalText(
                                  text: 'Follow',
                                  context: context,
                                  color: Colors.white
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: responsive(10, context),
                    ),

                    Padding(
                      padding:  EdgeInsets.only(left: responsive(10, context),right: 0 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < 2; i++)
                            InkWell(
                              onTap: (){
                                Selected = i;
                                setState(() {

                                });
                              },

                              child: StepsTabes(
                                text: tabs[i],
                                isSelected: i == Selected, // Set isSelected to true for the initially selected tab
                              ),
                            ),
                        ],
                      ),

                    ),

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: responsive(15, context),vertical: responsive(20, context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child:Row(
                              children: [
                                SvgPicture.asset(
                                  'images/food.svg',
                                  height: responsive(16, context),
                                  width:  responsive(16, context)
                                ),
                                SizedBox(
                                  width:  responsive(5, context)
                                ),
                                smallText(
                                  color: Color.fromRGBO(169, 169, 169, 1),
                                  context: context,
                                  text: '1 serve'
                                )
                              ],
                            ),
                          ),
                          smallText(
                              color: Color.fromRGBO(169, 169, 169, 1),
                              context: context,
                              text: '10 items'
                          )
                        ],
                      ),
                    ),

                 Selected == 1?   Padding(
                      padding:  EdgeInsets.symmetric(horizontal: responsive(10, context)),
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          primary: true,
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context,i){
                            return    Padding(
                                padding:  EdgeInsets.fromLTRB(0, responsive(5, context), 0, responsive(10, context)),
                                child:  Container(
                                  width: responsive(315, context),
                                  decoration: ShapeDecoration(
                                    color: Color(0xffD9D9D9).withOpacity(0.3),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),

                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: responsive(20, context),vertical: responsive(10, context)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        MediumText(
                                            center: false,
                                            text: 'Step ${i+1}',
                                            context: context,
                                          ),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(vertical: responsive(5, context)),
                                          child: normalText(
                                            center: false,
                                              color:Color.fromRGBO(169, 169, 169, 1).withOpacity(0.6),
                                              context: context,
                                              text: 'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?'

                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                )
                            );
                          }),
                    ):
                    // List of INGRIDENTS
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: responsive(10, context)),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                          primary: true,
                        shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context,i){
                        return    Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child:
                            ListNew(context, 'Tomatos', '500g', 'images/tomato.png')
                        );
                      }),
                    ),





                  ],
                ),
              ),
            ),
          ),
        ),

      ),
    );
  }
}