

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:recipeapp/Global%20Styles/TextFiles.dart';
import 'package:recipeapp/Responsive/Responsiveclass.dart';
import 'package:recipeapp/View/Widgets/TrandingRecipeContainer.dart';

class Recipedetail extends StatefulWidget {
  const Recipedetail({super.key});

  @override
  State<Recipedetail> createState() => _RecipedetailState();
}

class _RecipedetailState extends State<Recipedetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: responsiveDesign(370, context),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){
                        Get.back();
                      }, icon: Icon(Icons.arrow_back)),

                      IconButton(onPressed: (){

                      }, icon: Icon(Icons.menu)),
                    ],
                  ),

                  Container(
                    height: responsiveHeight(200, context),
                    width: responsiveDesign(350, context),
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
                          padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                          child: RecipeBadge(context, '4.5'),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 65, 0, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,

                            children: [
                              Icon(Icons.lock_clock,color: Colors.white,),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: normalText(
                                  color: Colors.white,
                                  context: context,
                                  text: '20 min'
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5 , 0, 10, 0),
                                child: Container(
                                    height: responsiveHeight(50, context),
                                    width: responsiveDesign(50, context),
                                  decoration: BoxDecoration(

                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),

                                  ),

                                    child: IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border,color: Colors.green,size: 20,))),
                              )


                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: HeadingText(
                              text: 'Spicy chicken burger with\nFrench fries',
                              context: context,
                              color: Colors.black
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
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
                      height: 50,
                      width: 380,
                      // color: Colors.black,
                      child: Row(
                        children: [
                          Container(
                            width: responsiveDesign(45, context),
                            height: responsiveHeight(50, context),
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
                                  text: 'Laura Wilson',
                                  context: context,
                                  color: Colors.black
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on,color: Colors.green,size: 15,),
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

                          Padding(
                              padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
                            child: Container(
                              // height: 80,
                              width: 80,
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
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: responsiveHeight(10, context),
                  ),

                  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(18, 149, 117, 1),
                          //Colors.pink,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: normalText(
                              text: 'ingrident',
                              context: context,
                              color: Colors.white
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          //Colors.pink,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: normalText(
                              text: 'procedure',
                              context: context,
                              color: Color.fromRGBO(18, 149, 117, 1)
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child:Row(
                            children: [
                              Icon(Icons.dinner_dining_rounded,color:Color.fromRGBO(169, 169, 169, 1) ,),
                              SizedBox(
                                width:  responsiveDesign(5, context)
                              ),
                              smallText(
                                color: Color.fromRGBO(169, 169, 169, 1),
                                context: context,
                                text: '1 serve'
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0 , 0, 15, 0),
                          child: smallText(
                              color: Color.fromRGBO(169, 169, 169, 1),
                              context: context,
                              text: '10 items'
                          ),
                        )
                      ],
                    ),
                  ),
                  // List of INGRIDENTS
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ListTile(
                      tileColor:Color.fromRGBO(217, 217, 217, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      leading: Container(
                        width: responsiveDesign(45, context),
                        height: responsiveHeight(50, context),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxsR8Th9DhpNwI1Gsj2fyL8eHJgrY-kVEYWQ50040j&s"),
                            fit: BoxFit.cover,
                          ),
                          color: Color(0xFFFFCE80),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      title: normalText(
                        context: context,
                        text: 'Tomatos',
                        color: Colors.black
                      ),
                      trailing: normalText(
                          context: context,
                          text: '500g',
                        color: Color.fromRGBO(169, 169, 169, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: ListTile(
                      tileColor:Color.fromRGBO(217, 217, 217, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      leading: Container(
                        width: responsiveDesign(45, context),
                        height: responsiveHeight(50, context),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxsR8Th9DhpNwI1Gsj2fyL8eHJgrY-kVEYWQ50040j&s"),
                            fit: BoxFit.cover,
                          ),
                          color: Color(0xFFFFCE80),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      title: normalText(
                        context: context,
                        text: 'Cabbage',
                        color: Colors.black
                      ),
                      trailing: normalText(
                          context: context,
                          text: '500g',
                        color: Color.fromRGBO(169, 169, 169, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: ListTile(
                      tileColor:Color.fromRGBO(217, 217, 217, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      leading: Container(
                        width: responsiveDesign(45, context),
                        height: responsiveHeight(50, context),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxsR8Th9DhpNwI1Gsj2fyL8eHJgrY-kVEYWQ50040j&s"),
                            fit: BoxFit.cover,
                          ),
                          color: Color(0xFFFFCE80),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      title: normalText(
                        context: context,
                        text: 'Taco',
                        color: Colors.black
                      ),
                      trailing: normalText(
                          context: context,
                          text: '500g',
                        color: Color.fromRGBO(169, 169, 169, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: ListTile(
                      tileColor:Color.fromRGBO(217, 217, 217, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      leading: Container(
                        width: responsiveDesign(45, context),
                        height: responsiveHeight(50, context),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxsR8Th9DhpNwI1Gsj2fyL8eHJgrY-kVEYWQ50040j&s"),
                            fit: BoxFit.cover,
                          ),
                          color: Color(0xFFFFCE80),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      title: normalText(
                          context: context,
                          text: 'Slice Bread',
                          color: Colors.black
                      ),
                      trailing: normalText(
                        context: context,
                        text: '500g',
                        color: Color.fromRGBO(169, 169, 169, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: ListTile(
                      tileColor:Color.fromRGBO(217, 217, 217, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      leading: Container(
                        width: responsiveDesign(45, context),
                        height: responsiveHeight(50, context),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxsR8Th9DhpNwI1Gsj2fyL8eHJgrY-kVEYWQ50040j&s"),
                            fit: BoxFit.cover,
                          ),
                          color: Color(0xFFFFCE80),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      title: normalText(
                          context: context,
                          text: 'Tomatos',
                          color: Colors.black
                      ),
                      trailing: normalText(
                        context: context,
                        text: '500g',
                        color: Color.fromRGBO(169, 169, 169, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: ListTile(
                      tileColor:Color.fromRGBO(217, 217, 217, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      leading: Container(
                        width: responsiveDesign(45, context),
                        height: responsiveHeight(50, context),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxsR8Th9DhpNwI1Gsj2fyL8eHJgrY-kVEYWQ50040j&s"),
                            fit: BoxFit.cover,
                          ),
                          color: Color(0xFFFFCE80),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      title: normalText(
                          context: context,
                          text: 'Tomatos',
                          color: Colors.black
                      ),
                      trailing: normalText(
                        context: context,
                        text: '500g',
                        color: Color.fromRGBO(169, 169, 169, 1),
                      ),
                    ),
                  ),




                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
