import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:recipeapp/Responsive/Responsiveclass.dart';
import 'package:recipeapp/View/Widgets/TrandingRecipeContainer.dart';

import '../../../Global Styles/TextFiles.dart';
import '../../RecipeDetail/RecipeDetail.dart';
import '../../Widgets/CustomBottomAppbar.dart';
import '../../Widgets/CustomTabs.dart';
import '../../Widgets/NewRecipeWidget.dart';
import '../../Widgets/SearchWidget.dart';

final List<String> tabs = ['All', 'Indian', 'Italian','Asian','Chinese','Fruit','Vegitables','Protien','Cereal','Local Dishes',];
final List<String> _svgIcons = [
  'images/home.svg',
  'images/save.svg',
  'images/notify.svg',
  'images/profile.svg',
];
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selected=0;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          // backgroundColor: Colors.white60,
          floatingActionButton: FloatingActionButton(
            backgroundColor:   Color(0xFF119475),
            onPressed: () {
              // Perform action when "+" button is pressed
            },
            child: Icon(Icons.add),
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
                        Container(
                          width: responsiveDesign(45, context),
                          height: responsiveHeight(50, context),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxsR8Th9DhpNwI1Gsj2fyL8eHJgrY-kVEYWQ50040j&s"),
                              fit: BoxFit.cover,
                            ),
                            color: Color(0xFFFFCE80),
                            borderRadius: BorderRadius.circular(10),
                          ),

                        ),

                      ],
                    ),
                    SizedBox(
                      height: responsiveHeight(20, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Search(context),
                        SvgPicture.asset('images/Filter.svg',
                        width: responsiveDesign(50, context),
                        height: responsiveHeight(50, context),),

                      ],
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding:  EdgeInsets.only(top: responsiveHeight(20, context)),
                        child: Row(
                          children: [
                            for (int i = 0; i < tabs.length; i++)
                              InkWell(
                                onTap: (){
                                  selected = i;
                                  setState(() {

                                  });
                                },

                                child: CustomTab(
                                  text: tabs[i],
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

                    InkWell(
                      onTap: () {
                        Get.to(Recipedetail());
                      },
                      child: Container(
                        height: responsiveHeight(280, context),
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context,i){
                            return

                                 Padding(
                                   padding:  EdgeInsets.only(right: responsiveDesign(15, context)),
                                   child: TrendingRecipe(),
                                 );

                        }),
                      ),
                    ),

SizedBox(height: responsiveHeight(20, context),),
                    HeadingText(
                      text: 'New Recipes',
                      context: context,
                      color: Colors.black
                    ),
                    Container(
                      height: responsiveHeight(190, context),
                      child:

                      Padding(
                        padding:  EdgeInsets.only(bottom: responsiveDesign(20, context)),
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                           // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context,i){
                              return

                                Padding(
                                  padding:  EdgeInsets.only(right: responsiveDesign(15, context)),
                                  child:    NewRecipe(),
                                );

                            }),
                      ),
                    ),



                  ],
                ),
              ),
            ),
          ),
        )

    );
  }
}
