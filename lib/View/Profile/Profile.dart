

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipeapp/Global%20Styles/TextFiles.dart';
import 'package:recipeapp/Responsive/Responsiveclass.dart';

import '../Widgets/CustomBottomAppbar.dart';
import '../Widgets/NewTab.dart';
import '../Widgets/TrandingRecipeContainer.dart';
import '../Widgets/tabs.dart';


List<bool> isTab1Active = [true,false];
var tabs = ['Recipe', 'Videos','Tag',];


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int Selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding:  EdgeInsets.fromLTRB(responsive(10, context), 0, responsive(10, context), 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            // width: responsive(450, context),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: responsive(15, context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: responsive(40, context),
                        ),
                        HeadingText(
                          text: 'Profile',
                          context: context,
                          center: false
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: responsive(20, context),),
                          child: SvgPicture.asset(
                            'images/more.svg',
                            height: responsive(25, context),
                            width:  responsive(25, context)
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(responsive(22, context), responsive(4, context), 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: responsive(100, context),
                          height: responsive(100, context),
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
                          padding:  EdgeInsets.fromLTRB(responsive(10, context ), 0, 0, 0),
                          child: Column(

                            children: [
                              normalText(
                                  center: false,
                                  color:Color.fromRGBO(169, 169, 169, 1).withOpacity(0.6),
                                  context: context,
                                text: 'Recipe'
                              ),
                              Padding(
                                padding:  EdgeInsets.fromLTRB(0, responsive(8, context), 0, 0),
                                child: HeadingText(
                                    text: '4',
                                    context: context,
                                    center: false
                                ),
                              ),

                            ],
                          ),
                        ),

                        Padding(
                          padding:  EdgeInsets.fromLTRB(responsive(10, context ), 0, 0, 0),
                          child: Column(

                            children: [
                              normalText(
                                  center: false,
                                  color:Color.fromRGBO(169, 169, 169, 1).withOpacity(0.6),
                                  context: context,
                                text: 'Followers'
                              ),
                              Padding(
                                padding:  EdgeInsets.fromLTRB(0, responsive(8, context), 0, 0),
                                child: HeadingText(
                                    text: '2.5M',
                                    context: context,
                                    center: false
                                ),
                              ),


                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.fromLTRB(responsive(10, context ), 0, responsive(20, context), 0),
                          child: Column(

                            children: [
                              normalText(
                                  center: false,
                                  color:Color.fromRGBO(169, 169, 169, 1).withOpacity(0.6),
                                  context: context,
                                text: 'Following'
                              ),
                              Padding(
                                padding:  EdgeInsets.fromLTRB(0, responsive(8, context), 0, 0),
                                child: HeadingText(
                                    text: '259',
                                    context: context,
                                    center: false
                                ),
                              ),


                            ],
                          ),
                        ),



                      ],
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.fromLTRB(responsive(20, context), responsive(10, context), 0, 0),
                    child: HeadingText(
                      center: false,
                      context: context,
                      text: 'Inam Khan'
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(responsive(20, context), 0, 0, 0),
                    child: normalText(

                      context: context,
                      text: 'Chef',
                      center: false,
                      color: Color(0xFFA9A9A9).withOpacity(0.7),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(responsive(20, context), responsive(10, context), 0, 0),
                    child: normalText(

                      context: context,
                      text: 'Private Chef',
                      center: false,
                      color: Color(0xFFA9A9A9).withOpacity(1),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(responsive(20, context), 0, 0, 0),
                    child: normalText(

                      context: context,
                      text: 'Passionate about food and life 🥘🍲🍝🍱',
                      center: false,
                      color: Color(0xFFA9A9A9).withOpacity(1),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(responsive(20, context), 0, 0, responsive(20, context)),
                    child: normalText(

                      context: context,
                      text: 'More...',
                      center: false,
                      color: Color(0x71B1A1).withOpacity(1),
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(left: responsive(10, context),right: 5 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < 3; i++)
                          InkWell(
                            onTap: (){
                              Selected = i;
                              setState(() {

                              });
                            },

                            child: NewStepsTabes(
                              text: tabs[i],
                              isSelected: i == Selected, // Set isSelected to true for the initially selected tab
                            ),
                          ),
                      ],
                    ),

                  ),

                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      primary: true,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context,i){
                        return   Padding(
                          padding:  EdgeInsets.fromLTRB(responsive(10, context), responsive(15, context), responsive(10, context), 0),
                          child:
                          Container(
                            height: responsive(150, context),
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
                                  padding:  EdgeInsets.only(right: responsive(1, context),top:responsive(0, context) ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.fromLTRB(responsive(10, context), responsive(40, context),0, 0),
                                        child: MediumText(
                                            center: false,
                                            context: context,
                                            color: Colors.white,
                                            text: 'Traditional spare ribs\nbaked'
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.fromLTRB(responsive(10, context), 0, 0, 0),
                                            child: smallText(
                                                center: false,
                                                context: context,
                                                text: 'By Chef John',
                                                color: Color(0xFFD9D9D9)
                                            ),
                                          ),
                                          Container(
                                            child: Row(
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
                                          )


                                        ],
                                      ),
                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ),
                        );
                      }),









                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
