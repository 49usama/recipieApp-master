

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
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/Global%20Styles/TextFiles.dart';
import 'package:recipeapp/Globle%20Controllers/controller.dart';
import 'package:recipeapp/Responsive/Responsiveclass.dart';
import 'package:recipeapp/View/RecipeDetail/RecipeDetail.dart';

import '../../Globle Controllers/userdataclass.dart';
import '../Home/View/Home.dart';
import '../Widgets/CustomBottomAppbar.dart';
import '../Widgets/NewTab.dart';
import '../Widgets/TrandingRecipeContainer.dart';
import '../Widgets/tabs.dart';
import '../authentication/Login.dart';


List<bool> isTab1Active = [true,false];
var tabs = ['Recipes',];


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
  //   print('email is : ${FirebaseAuth.instance.currentUser?.email}');
    return Scaffold(

      body: Padding(
        padding:  EdgeInsets.fromLTRB(responsive(10, context), 0, responsive(10, context), 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Consumer2<UserDataController,FoodDBProvider>(
              builder: (context, UserData,recipe, child) {
                if(UserData.UserData == null){
                  UserData.fetchDataFromFirestore();
                }
                if(!recipe.ispAdLoaded){

                  recipe.initBannerAds_profile();
                }
                if(FirebaseAuth.instance.currentUser != null){
                  if(UserData.UserPostData.isEmpty)
                  UserData.fetchCurrentUSerPostFromFirestore();
                  print('data detch');
                }

              return Container(
                // width: responsive(450, context),
                child: SafeArea(
                  child: Column(

                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left:responsive(90, context), top: responsive(15, context)),
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
                            if(FirebaseAuth.instance.currentUser != null)Padding(
                              padding:  EdgeInsets.only(right: responsive(20, context),),
                              child: InkWell(
                                onTap: () async {
                                 await FirebaseAuth.instance.signOut().then((value) {
                                   Get.to(MainPage());
                                   setState(() {

                                   });
                                 });
                                },
                                child:
                                NewStepsTabes(
                                  text:"logout",
                                  isSelected: true, // Set isSelected to true for the initially selected tab
                                )
                              ),
                            ) else Container(
                              child: SizedBox(
                                width: responsive(140, context),

                              ),
                            ),
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
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                  padding:  EdgeInsets.fromLTRB(responsive(30, context ), 0, 0, 0),
                                  child: Column(

                                    children: [
                                      normalText(
                                          center: false,
                                          color:Color.fromRGBO(169, 169, 169, 1).withOpacity(0.6),
                                          context: context,
                                        text: 'Recipes'
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.fromLTRB(0, responsive(8, context), 0, 0),
                                        child: HeadingText(
                                            text: '${UserData.UserPostData.length??"0"}',
                                            context: context,
                                            center: false
                                        ),
                                      ),

                                    ],
                                  ),
                                ),

                                // Padding(
                                //   padding:  EdgeInsets.fromLTRB(responsive(10, context ), 0, 0, 0),
                                //   child: Column(
                                //
                                //     children: [
                                //       normalText(
                                //           center: false,
                                //           color:Color.fromRGBO(169, 169, 169, 1).withOpacity(0.6),
                                //           context: context,
                                //         text: 'Followers'
                                //       ),
                                //       Padding(
                                //         padding:  EdgeInsets.fromLTRB(0, responsive(8, context), 0, 0),
                                //         child: HeadingText(
                                //             text: '2.5M',
                                //             context: context,
                                //             center: false
                                //         ),
                                //       ),
                                //
                                //
                                //     ],
                                //   ),
                                // ),
                                // Padding(
                                //   padding:  EdgeInsets.fromLTRB(responsive(10, context ), 0, responsive(20, context), 0),
                                //   child: Column(
                                //
                                //     children: [
                                //       normalText(
                                //           center: false,
                                //           color:Color.fromRGBO(169, 169, 169, 1).withOpacity(0.6),
                                //           context: context,
                                //         text: 'Following'
                                //       ),
                                //       Padding(
                                //         padding:  EdgeInsets.fromLTRB(0, responsive(8, context), 0, 0),
                                //         child: HeadingText(
                                //             text: '259',
                                //             context: context,
                                //             center: false
                                //         ),
                                //       ),
                                //
                                //
                                //     ],
                                //   ),
                                // ),



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
                          // Padding(
                          //   padding:  EdgeInsets.fromLTRB(responsive(20, context), 0, 0, responsive(20, context)),
                          //   child: normalText(
                          //
                          //     context: context,
                          //     text: 'More...',
                          //     center: false,
                          //     color: Color(0x71B1A1).withOpacity(1),
                          //   ),
                          // ),

                          Padding(
                            padding:  EdgeInsets.only(left: responsive(10, context),right: 5 ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0; i < tabs.length; i++)
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
                          // if(FirebaseAuth.instance.currentUser!.email == UserData.UserData!.email)
                         Center(
                           child: UserData.UserPostData.isEmpty && UserData.iscalled==false?Padding(
                             padding:  EdgeInsets.only(top: responsive(100, context)),
                             child: Container(
                               height: responsive(50, context),
                               width: responsive(50,context),
                               child: CircularProgressIndicator(
                                 color: Colors.teal,
                               ),
                             ),
                           ) : UserData.UserPostData.isEmpty && UserData.iscalled==true?
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                             recipe.ispAdLoaded?
 SizedBox(
                height:recipe.profileBadd[0].size.height.toDouble(),
                width: recipe.profileBadd[0].size.width.toDouble(),
                child: AdWidget(ad: recipe.profileBadd[0]), // Use a different BannerAd instance
                ):Container(),
                               SizedBox(
  height: responsive(50, context),
),
                               SvgPicture.asset(
                                 'images/emp.svg',
                                 height: responsive(100, context),
                                 width: responsive(100, context),
                               ),
                               SizedBox(
                                 height: responsive(30, context),
                               ),
                               normalText(
                                 context: context,
                                 text: 'Nothing to show here!',
                                 color: Colors.teal,
                                 center: true,
                               ),


                             ],
                           ):

                           ListView.builder(
                               physics: NeverScrollableScrollPhysics(),
                               primary: true,
                               shrinkWrap: true,
                               itemCount: UserData.UserPostData.length,
                               // itemCount: UserData.UserPostData!.i.method!.length,
                               itemBuilder: (context,i){

                                 return  recipe.ispAdLoaded && i%10==0  && i ~/ 10 < recipe.profileBadd.length
                                     ?
                                 SizedBox(
                                   height:recipe.profileBadd[0].size.height.toDouble(),
                                   width: recipe.profileBadd[0].size.width.toDouble(),
                                   child: AdWidget(ad: recipe.profileBadd[i ~/ 5 ]), // Use a different BannerAd instance
                                 ): InkWell(
                                   onTap: (){
                                     Get.to(Recipedetail(i: UserData.UserPostData[i],url: UserData.UserPostData[i].url,));
                                   },
                                   child: Padding(
                                     padding:  EdgeInsets.fromLTRB(responsive(10, context), responsive(15, context), responsive(10, context), 0),
                                     child:
                                     Container(
                                       height: responsive(150, context),
                                       // width: responsive(350, context),
                                       decoration: BoxDecoration(
                                         // image: DecorationImage(
                                         //   image: NetworkImage('${UserData.UserPostData![i].url}'),
                                         //   fit: BoxFit.cover,
                                         // ),
                                         borderRadius: BorderRadius.circular(10),
                                       ),
                                       child: Stack(
                                         children: [
                                           ClipRRect(
                                             borderRadius: BorderRadius.all(Radius.circular(responsive(15, context))),
                                             child: CachedNetworkImage(
                                               errorWidget: (context, url, error) => SvgPicture.asset(
                                                 width: responsive(410, context),

                                                 'images/dummydish.svg',
                                                 fit: BoxFit.fitWidth,
                                               ),

                                               imageUrl: '${UserData.UserPostData![i].url}',
                                               width: responsive(410, context),
                                               // replace with the URL of your image
                                               fit: BoxFit.fitWidth,

                                             ),
                                           ),
                                           Column(
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
                                                           text: '${UserData.UserPostData![i].name}'
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
                                                               text: 'By ${UserData.UserPostData![i].author}',
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
                                                                     text: '${UserData.UserPostData![i].time}min'
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
                                         ],
                                       ),
                                     ),
                                   ),
                                 );
                               }) ,
                         )










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
