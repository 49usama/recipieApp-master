

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/Global%20Styles/TextFiles.dart';
import 'package:recipeapp/Responsive/Responsiveclass.dart';

import '../../Globle Controllers/userdataclass.dart';
import '../Home/View/Home.dart';
import '../Widgets/CustomBottomAppbar.dart';
import '../Widgets/NewTab.dart';
import '../Widgets/TrandingRecipeContainer.dart';
import '../Widgets/tabs.dart';
import '../authentication/Login.dart';


List<bool> isTab1Active = [true,false];
var tabs = ['Recipe', 'Videos','Tag',];


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int Selected = 0;





  FirebaseAuth auth = FirebaseAuth.instance;









  @override
  Widget build(BuildContext context) {
  //FirebaseAuth.instance.signOut();
    print('email is : ${FirebaseAuth.instance.currentUser?.email}');
    return Scaffold(

      body: Padding(
        padding:  EdgeInsets.fromLTRB(responsive(10, context), 0, responsive(10, context), 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Consumer<UserDataController>(
              builder: (context, UserData, child) {
                if(UserData.UserData == null){
                  UserData.fetchDataFromFirestore();
                }

              return Container(
                // width: responsive(450, context),
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
                              child: InkWell(
                                onTap: () async {
                                 await FirebaseAuth.instance.signOut().then((value) {
                                   Get.to(MainPage());
                                 });
                                },
                                child: SvgPicture.asset(
                                    'images/more.svg',
                                    height: responsive(25, context),
                                    width:  responsive(25, context)
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      FirebaseAuth.instance.currentUser==null?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: responsive(200, context),
                          ),
                          SvgPicture.asset(
                            'images/emp.svg',
                            height: responsive(200, context),
                            width: responsive(200, context),
                          ),
                          SizedBox(
                            height: responsive(30, context),
                          ),
                          normalText(
                            context: context,
                            text: 'Nothing to show here!',
                            center: true,
                          ),
                          InkWell(
                            onTap:(){
                              Get.to(Login());
                            },
                            child: normalText(
                              context: context,
                              text: 'Create Account or Login',
                              center: true,
                              color:  Color(0x71B1A1).withOpacity(1),
                            ),
                          )

                        ],
                      ):
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Padding(
                            padding:  EdgeInsets.fromLTRB(responsive(22, context), responsive(4, context), 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 51,
                                  backgroundColor:  Color(0x71B1A1).withOpacity(1),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: responsive(50, context),
                                    child: InkWell(
                                      onTap: ()async{

                                      await  UserData.pickImage();
                                      UserData.fetchDataFromFirestore();

                                      },
                                      child: UserData.isLoading==false?ClipOval(
                                        child: CachedNetworkImage(
                                          errorWidget: (context, url, error) => SvgPicture.asset(
                                              width: 100,
                                              height: 100,
                                              'images/dummyprofile.svg'
                                          ),
                                          imageUrl: '${UserData.UserData?.url}',
                                          // replace with the URL of your image
                                          fit: BoxFit.cover,
                                          width: 100,
                                          height: 100,
                                        ),
                                      ):Container(
                                          height: responsive(25, context),
                                          width: responsive(25, context),

                                          child: CircularProgressIndicator(
                                            color: Color(0x71B1A1).withOpacity(1),
                                            strokeWidth: 2,
                                          )),


                                    ),
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
                              text: '${UserData.UserData?.name??""}'
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
                    ],
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
