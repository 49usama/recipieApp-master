

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipeapp/Global%20Styles/TextFiles.dart';
import 'package:recipeapp/Responsive/Responsiveclass.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
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
                      padding:  EdgeInsets.fromLTRB(responsive(10, context ), 0, responsive(10, context), 0),
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
              )



            ],
          ),
        ),
      ),
    );
  }
}
