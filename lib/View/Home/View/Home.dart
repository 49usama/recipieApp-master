import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/Responsive/Responsiveclass.dart';
import 'package:recipeapp/View/Saved%20Recipies/SavedRecipies.dart';
import 'package:recipeapp/View/Widgets/TrandingRecipeContainer.dart';
import 'package:recipeapp/utils/utils.dart';

import '../../../Global Styles/TextFiles.dart';
import '../../../Globle Controllers/controller.dart';
import '../../../Globle Controllers/userdataclass.dart';
import '../../../constant/const.dart';
import '../../../services/admobservice.dart';
import '../../Add Recipe/AddRecipe.dart';
import '../../Notifications/Notifications.dart';
import '../../Profile/Profile.dart';
import '../../RecipeDetail/RecipeDetail.dart';
import '../../Widgets/CustomBottomAppbar.dart';
import '../../Widgets/CustomTabs.dart';
import '../../Widgets/NewRecipeWidget.dart';
import '../../Widgets/SearchRecipeWidget.dart';
import '../../Widgets/SearchWidget.dart';
import '../../authentication/Login.dart';
import '/../../Global Models/Model.dart';
//final List<String> tabs = ['All', 'Indian', 'Italian','Asian','Chinese','Fruit','Vegitables','Protien','Cereal','Local Dishes',];
final List<String> _svgIcons = [
  'images/home.svg',
  'images/save.svg',
  'images/notify.svg',
  'images/profile.svg',
];
var selected=0;
// Create an instance of the Random class
final random = Random();
class MainPage extends StatefulWidget {

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {




  var selected=0;
  int _selectedIndex = 0;
  var pages = [
    Home(),
    saved(),
    Notifications(),
    Profile(),


  ];





  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child:Scaffold(
         //   resizeToAvoidBottomInset: false, // fluter 1.x
            resizeToAvoidBottomInset: false,
            // backgroundColor: Colors.white60,
          floatingActionButton: InkWell(
            onTap: (){
              FirebaseAuth.instance.currentUser==null?Get.to(Login()):
              Get.to(Addrecipe());
            },
            child: CircleAvatar(
              backgroundColor: Color(0xFF119475),
              radius: responsive(30, context),
              child:  Icon(Icons.add,size: responsive(25, context),),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CurvedNavigationBar(

            selectedIndex: _selectedIndex,
            items: _svgIcons.map((iconPath) {
              return SvgPicture.asset(
                height:responsiveDesign(28, context),
                width:responsiveDesign(28, context),
                iconPath,
                color: _selectedIndex == _svgIcons.indexOf(iconPath)
                    ? Color(0xFF119475).withOpacity(0.4)
                    : Colors.grey.withOpacity(0.4),
              );
            }).toList(),
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          body: pages[_selectedIndex]
        )

    );
  }
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //
  // void setTestDevices() {
  //   List<String> testDevices = ["d7afbe19-7433-48b0-8e04-41d9ffe014a8"];
  //   MobileAds.instance.updateRequestConfiguration(
  //     RequestConfiguration(testDeviceIds: testDevices),
  //   );
  // }


  recipesDB? res;
  @override
  void initState() {
    //setTestDevices();

    // TODO: implement initState
    super.initState();

  }

  var addindex ;
  var search="";

  @override
  Widget build(BuildContext context) {
    return     Consumer2<UserDataController,FoodDBProvider>(
        builder: (context, UserData,recipe, child) {


          if(recipe.dataa.isEmpty){
            UserData.fetchDataFromFirestore();
            recipe.fetchDataFromFirestore();


         }
          if(!recipe.isAdLoaded){
            recipe.initBannerAdshome();
          }
          // recipe.loadJsonData();

        return Scaffold(
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: responsiveDesign(20, context),vertical: responsiveDesign(10, context) ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            HeadingText(
                              text: 'Hello ',
                              context: context,
                            ),
                            smallText(
                              text: 'What are you cooking today?',
                              context: context,
                              color: Color(0xFFA9A9A9),
                            ),
                          ],



                        ),
                        InkWell(
                          onTap: (){
                           Get.to(Profile());
                            // Get.to(Login());
                          },
                          child: Container(
                            width: responsive(45, context),
                            height: responsive(50, context),
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //   image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxsR8Th9DhpNwI1Gsj2fyL8eHJgrY-kVEYWQ50040j&s"),
                              //   fit: BoxFit.cover,
                              // ),
                              color: Color(0xFFFFCE80).withOpacity(0),
                              borderRadius: BorderRadius.circular(responsive(10, context)),
                            ),
                            child:    ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(responsive(15, context))),
                              child: CachedNetworkImage(
                                errorWidget: (context, url, error) => Image.network(
                                  // width: responsive(410, context),

                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxsR8Th9DhpNwI1Gsj2fyL8eHJgrY-kVEYWQ50040j&s",
                                  fit: BoxFit.cover
                                ),

                                imageUrl: '${UserData.UserData?.url}',
                                // width: responsive(410, context),
                                // replace with the URL of your image
                                fit: BoxFit.fitWidth,

                              ),
                            ),

                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: responsive(20, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Search(context,

                            (value){
                          // setState(() {
                              search = value;
                             recipe.UpdatingSearch(value);

                            }, (value){
                            search = value;
                            if(search == ""){
                              setState(() {
                              });
                            }
                          }

                        ),
                        // SvgPicture.asset('images/Filter.svg',
                        //   width: responsive(50, context),
                        //   height: responsive(50, context),),

                      ],
                    ),

                    search ==""?Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SingleChildScrollView(
                        //   physics: BouncingScrollPhysics(),
                        //   scrollDirection: Axis.horizontal,
                        //   child: Padding(
                        //     padding:  EdgeInsets.only(top: responsiveHeight(20, context)),
                        //     child: Row(
                        //       children: [
                        //         for (int i = 0; i < dish_names.length; i++)
                        //           InkWell(
                        //             onTap: (){
                        //               selected = i;
                        //               setState(() {
                        //
                        //               });
                        //             },
                        //
                        //             child: CustomTab(
                        //               text:  dish_names[i],
                        //               isSelected: i == selected, // Set isSelected to true for the initially selected tab
                        //             ),
                        //           ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: responsiveHeight(60, context),
                        ),
                        Center(
                            child: recipe.dataa.isEmpty?Padding(
                              padding:  EdgeInsets.only(top: responsive(50, context)),
                              child: Container(
                                height: responsive(50, context),
                                width: responsive(50, context),

                                child: CircularProgressIndicator(
                                  color: Colors.teal,
                                ),
                              ),
                            ) :
                            Container(
                              height:responsive(240, context),
                              child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: //10,
                              recipe.dataa!.length,

                                  itemBuilder: (context,i){

 //var a = recipe.dataa![i].name.contains(dish_names[selected]);

 // dish_names[selected].contains(
 //     recipe.dataa![i].name);
// print('Contains a = $a');
                                    // Generate a random number between 0 and 40 (inclusive)
                                    int randomNumber = random.nextInt(41);


                                    return



                                      recipe.isAdLoaded && i%5==0  && i ~/ 5 < recipe.bannerAd.length
                                        ?
                                      SizedBox(
                                        height:recipe.bannerAd[0].size.height.toDouble(),
                                        width: recipe.bannerAd[0].size.width.toDouble(),
                                        child: AdWidget(ad: recipe.bannerAd[i ~/ 5 ]), // Use a different BannerAd instance
                                      ):

                                    // Cat[selected]=="All"?
                                      recipe.dataa![i].name.toLowerCase().contains(dish_names[selected].toLowerCase())
                                                      ? InkWell(
                                                          onTap: () {
                                                            Get.to(Recipedetail(
                                                                url: recipe
                                                                    .dataa![i]
                                                                    .url,
                                                                i: recipe
                                                                        .dataa![
                                                                    i]));
                                                          },
                                                          child: Padding(
                                                            padding: EdgeInsets.only(
                                                                right: responsive(
                                                                    15,
                                                                    context)),
                                                            child:
                                                                TrendingRecipe(
                                                              url: recipe
                                                                  .dataa![i]
                                                                  .url,
                                                              name: recipe
                                                                  .dataa![i]
                                                                  .name,
                                                            ),
                                                          ),
                                                        )
                                                      : dish_names[selected] ==
                                                              'All'
                                                          ? InkWell(
                                        onTap: () {
                                          Get.to(Recipedetail(
                                              url: recipe
                                                  .dataa![
                                              i]
                                                  .url,
                                              i: recipe
                                                  .dataa![
                                              i]));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: responsive(
                                                  15,
                                                  context)),
                                          child:
                                          TrendingRecipe(
                                            url: recipe
                                                .dataa![i]
                                                .url,
                                            name: recipe
                                                .dataa![i]
                                                .name,
                                          ),
                                        ),
                                      )
                                                          : Container();



                                              //   ):Cat[selected]==recipe.dataa!.meals![i].strCategory? InkWell(
                                    //   onTap: (){
                                    //     Get.to(Recipedetail(url:images[randomNumber] ,i:i));
                                    //   },
                                    //     child: Padding(
                                    //     padding:  EdgeInsets.only(right: responsive(15, context)),
                                    //     child: TrendingRecipe(url: images[randomNumber],name:  recipe.dataa!.meals![i].strMeal,),
                                    // ),
                                    //   ):Container();Container




                                  }),
                            )),
                        SizedBox(height: responsive(40, context),),
                        HeadingText(
                            text: 'New Recipes',
                            context: context,
                            color: Colors.black
                        ),
                        SizedBox(height: responsive(20, context),),
                        Center(
                          child: recipe.dataa.isEmpty?Padding(
                            padding:  EdgeInsets.only(top: responsive(50, context)),
                            child: Container(
                              height: responsive(50, context),
                              width: responsive(50, context),

                              child: CircularProgressIndicator(
                                color: Colors.teal,
                              ),
                            ),
                          ) : Container(
                            height: responsive(170, context),
                            child:

                            Padding(
                              padding:  EdgeInsets.only(bottom: responsive(20, context)),
                              child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  // shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 10,
                                  itemBuilder: (context,i){
                                    int randomNumber = random.nextInt(41);
                                    int reversedIndex = (recipe.dataa!.length - 1) - i;
                                    return

                                      InkWell(
                                        onTap: (){
                                          Get.to(Recipedetail(url:recipe.dataa![reversedIndex].url ,i:recipe.dataa![reversedIndex]));
                                        },
                                        child: Padding(
                                          padding:  EdgeInsets.only(right: responsive(15, context)),
                                          child:    NewRecipe(url:  recipe.dataa![reversedIndex].url,name:  recipe.dataa![reversedIndex].name,auther: recipe.dataa![reversedIndex].author,),
                                        ),
                                      );

                                  }),
                            ),
                          ),
                        ),

                      ],
                    ):ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: //10,
                      recipesDB.searchByName(recipe.dataa!, recipe.searchKeyword).length,

                      itemBuilder: (context,i){

                        // Generate a random number between 0 and 40 (inclusive)
                        int randomNumber = random.nextInt(41);

                        final filteredRecipes =
                        recipesDB.searchByName(recipe.dataa!, recipe.searchKeyword);
                        res = filteredRecipes[i];
                        return
                          // Cat[selected]=="All"?
                          InkWell(
                            onTap: (){
                              Get.to(Recipedetail(url:res!.url  ,i:filteredRecipes[i]));
                            },

                              child: SearchRecipe(url: res!.url,name:  res!.name,),
                            );
                        //   ):Cat[selected]==recipe.dataa!.meals![i].strCategory? InkWell(
                        //   onTap: (){
                        //     Get.to(Recipedetail(url:images[randomNumber] ,i:i));
                        //   },
                        //     child: Padding(
                        //     padding:  EdgeInsets.only(right: responsive(15, context)),
                        //     child: TrendingRecipe(url: images[randomNumber],name:  recipe.dataa!.meals![i].strMeal,),
                        // ),
                        //   ):Container();Container




                      }),



                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}

