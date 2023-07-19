import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/Responsive/Responsiveclass.dart';
import 'package:recipeapp/View/Saved%20Recipies/SavedRecipies.dart';
import 'package:recipeapp/View/Widgets/TrandingRecipeContainer.dart';
import 'package:recipeapp/utils/utils.dart';

import '../../../Global Styles/TextFiles.dart';
import '../../../Globle Controllers/controller.dart';
import '../../Notifications/Notifications.dart';
import '../../Profile/Profile.dart';
import '../../RecipeDetail/RecipeDetail.dart';
import '../../Widgets/CustomBottomAppbar.dart';
import '../../Widgets/CustomTabs.dart';
import '../../Widgets/NewRecipeWidget.dart';
import '../../Widgets/SearchWidget.dart';

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
          // backgroundColor: Colors.white60,
          floatingActionButton: CircleAvatar(
            backgroundColor: Color(0xFF119475),
            radius: responsive(40, context),
            child:  Icon(Icons.add,size: responsive(25, context),),
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
  @override
  Widget build(BuildContext context) {
    return     Consumer<FoodDBProvider>(
        builder: (context, recipe, child) {
          if(recipe.dataa.isEmpty)
          recipe.loadJsonData();

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
                              text: 'Hello Inam',
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
                          },
                          child: Container(
                            width: responsive(45, context),
                            height: responsive(50, context),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxsR8Th9DhpNwI1Gsj2fyL8eHJgrY-kVEYWQ50040j&s"),
                                fit: BoxFit.cover,
                              ),
                              color: Color(0xFFFFCE80),
                              borderRadius: BorderRadius.circular(responsive(10, context)),
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
                        Search(context),
                        SvgPicture.asset('images/Filter.svg',
                          width: responsive(50, context),
                          height: responsive(50, context),),

                      ],
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding:  EdgeInsets.only(top: responsiveHeight(20, context)),
                        child: Row(
                          children: [
                            for (int i = 0; i < Cat.length; i++)
                              InkWell(
                                onTap: (){
                                  selected = i;
                                  setState(() {

                                  });
                                },

                                child: CustomTab(
                                  text: Cat[i],
                                  isSelected: i == selected, // Set isSelected to true for the initially selected tab
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: responsiveHeight(40, context),
                    ),

                    Container(
                      height:responsive(240, context),
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: //10,
                          recipe.dataa!.length,

                          itemBuilder: (context,i){

                            // Generate a random number between 0 and 40 (inclusive)
                            int randomNumber = random.nextInt(41);
                            return
                              // Cat[selected]=="All"?
                              InkWell(
                                onTap: (){
                                  Get.to(Recipedetail(url:images[randomNumber]  ,i:i));
                                },
                                child: Padding(
                                  padding:  EdgeInsets.only(right: responsive(15, context)),
                                  child: TrendingRecipe(url: images[randomNumber],name:  recipe.dataa![i].name,),
                                ),);
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
                    ),

                    SizedBox(height: responsive(40, context),),
                    HeadingText(
                        text: 'New Recipes',
                        context: context,
                        color: Colors.black
                    ),
                    SizedBox(height: responsive(20, context),),
                    Container(
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
                                    Get.to(Recipedetail(url:images[randomNumber]  ,i:reversedIndex));
                                  },
                                  child: Padding(
                                    padding:  EdgeInsets.only(right: responsive(15, context)),
                                    child:    NewRecipe(url:  images[randomNumber],name:  recipe.dataa![reversedIndex].name,auther: recipe.dataa![reversedIndex].author,),
                                  ),
                                );

                            }),
                      ),
                    ),



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

