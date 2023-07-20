import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:recipeapp/Global%20Styles/TextFiles.dart';

import '../../Responsive/Responsiveclass.dart';
import '../Widgets/CustomAddTextField.dart';
import '../Widgets/CustomButton.dart';

class Addrecipe extends StatefulWidget {
  const Addrecipe({super.key});

  @override
  State<Addrecipe> createState() => _AddrecipeState();
}

class _AddrecipeState extends State<Addrecipe> {
  List<Widget> ingredients = [];
  List<Widget> procedures = [];

  List<String> ingredientsvalues = [];
  List<String> proceduressvalues = [];

  void uploadDataToFirestore(Map<String, dynamic> data) {
    FirebaseFirestore.instance.collection('Recipes').add(data);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Container(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      responsive(15, context), 0, responsive(15, context), 0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: responsive(20, context)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(Icons.arrow_back)),
                              HeadingText(
                                  center: true,
                                  context: context,
                                  text: 'Add Recipe',
                                  color: Colors.black),
                              SizedBox(
                                width: responsive(40, context),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    MyCustomTextField(
                                      height: responsive(55, context),
                                      width: responsive(200, context),
                                      hintText: 'Name',
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, responsive(10, context), 0, 0),
                                      child: MyCustomTextField(
                                          height: responsive(55, context),
                                          width: responsive(200, context),
                                          hintText: 'Time Taken'),
                                    )
                                  ],
                                ),
                                SvgPicture.asset(
                                  'images/ImageUpload.svg',
                                  height: responsive(100, context),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0, responsive(10, context), 0, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyCustomTextField(
                                    height: responsive(55, context),
                                    width: responsive(200, context),
                                    hintText: ' chef name ',
                                  ),
                                  CustomButton(
                                    text: 'Pick Image',
                                    onTap: () {},
                                  )
                                ],
                              ),
                            ),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              primary: true,
                              itemCount: ingredients.length,
                              itemBuilder: (context, index) {
                                print(
                                  ingredientsvalues.length - 1 == index
                                      ? ingredientsvalues[index]
                                      : "",
                                );
                                final item = ingredients[index];

                                return
                                  Padding(
                                    padding:  EdgeInsets.only(top: responsive(10, context)),
                                    child: SwipeActionCell(

                                    key: ObjectKey(item),

                                    /// this key is necessary
                                    trailingActions: <SwipeAction>[
                                      SwipeAction(
                                          performsFirstActionWithFullSwipe: true,

                                          icon: Icon(Icons.delete,color: Colors.white,size: responsive(30, context),),
                                          backgroundRadius: 10.0,
                                          // title: "delete",
                                          onTap:
                                              (CompletionHandler handler) async {
                                            print(ingredientsvalues);

                                            ingredients.remove(item);
                                            if (ingredientsvalues.length - 1 <
                                                index) {
                                            } else {
                                              final ingri =
                                                  ingredientsvalues[index];
                                              ingredientsvalues.remove(ingri);
                                            }

                                            setState(() {});
                                          },
                                          color: Colors.red),
                                    ],
                                    child:
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, responsive(0, context), 0, 0),
                                      child: MyCustomTextField(
                                        onchange: (value) {
                                          ingredientsvalues.insert(index, value);
                                          print(index);
                                          print(ingredientsvalues.length - 1);
                                        },
                                        text: ingredientsvalues.length - 1 < index
                                            ? ""
                                            : ingredientsvalues.isEmpty
                                                ? ""
                                                : ingredientsvalues[index],
                                        height: responsive(55, context),
                                        width: responsive(420, context),
                                        hintText: 'Ingredients',
                                      ),
                                    ),
                                ),
                                  );
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0, responsive(10, context), 0, 0),
                              child: Row(
                                mainAxisAlignment: procedures.isEmpty
                                    ? MainAxisAlignment.spaceBetween
                                    : MainAxisAlignment.end,
                                children: [
                                  procedures.isEmpty
                                      ? InkWell(
                                          onTap: () {
                                            procedures.add(
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0,
                                                    responsive(10, context),
                                                    0,
                                                    0),
                                                child: MyCustomTextField(
                                                  height:
                                                      responsive(55, context),
                                                  width:
                                                      responsive(400, context),
                                                  hintText: 'Procedure  ',
                                                ),
                                              ),
                                            );
                                            setState(() {});
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical:
                                                    responsive(20, context)),
                                            child: SvgPicture.asset(
                                              'images/addprocedure.svg',
                                              height: responsive(18, context),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  InkWell(
                                    onTap: () {
                                      ingredients.add(
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0, responsive(10, context), 0, 0),
                                          child: MyCustomTextField(
                                            height: responsive(55, context),
                                            width: responsive(400, context),
                                            hintText: 'Ingredients  ',
                                          ),
                                        ),
                                      );
                                      setState(() {});
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: responsive(25, context)),
                                      child: SvgPicture.asset(
                                        'images/Addingredients.svg',
                                        height: responsive(18, context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              primary: true,
                              itemCount: procedures.length,
                              itemBuilder: (context, index) {
                                final items = procedures[index];

                                return
                                  Padding(
                                    padding:  EdgeInsets.only(top: responsive(10, context)),
                                    child: SwipeActionCell(


                                      key: ObjectKey(items),

                                      /// this key is necessary
                                      trailingActions: <SwipeAction>[
                                        SwipeAction(
                                            performsFirstActionWithFullSwipe: true,

                                          icon: Icon(Icons.delete,color: Colors.white,size: responsive(30, context),),
                                          backgroundRadius: 10.0,
                                          //   title: "delete",
                                            onTap:
                                                (CompletionHandler handler) async {
                                              print(proceduressvalues);

                                              procedures.remove(items);
                                              if (proceduressvalues.length - 1 <
                                                  index) {
                                              } else {
                                                final proce =
                                                proceduressvalues[index];
                                                proceduressvalues.remove(proce);
                                              }

                                              setState(() {});
                                            },
                                            color: Colors.red),
                                      ],
                                      child:
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0, responsive(0, context), 0, 0),
                                        child: MyCustomTextField(
                                          onchange: (value) {
                                            proceduressvalues.insert(index, value);
                                            print(index);
                                            print(proceduressvalues.length - 1);
                                          },
                                          text: proceduressvalues.length - 1 < index
                                              ? ""
                                              : proceduressvalues.isEmpty
                                              ? ""
                                              : proceduressvalues[index],
                                          height: responsive(55, context),
                                          width: responsive(420, context),
                                          hintText: 'procedure',
                                        ),
                                      ),
                                    ),
                                  );
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: responsive(150, context)),
                              child: Visibility(
                                visible: procedures.isEmpty ? false : true,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0, responsive(10, context), 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          procedures.add(
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0,
                                                  responsive(10, context),
                                                  0,
                                                  0),
                                              child: MyCustomTextField(
                                                height: responsive(55, context),
                                                width: responsive(400, context),
                                                hintText: 'Procedure  ',
                                              ),
                                            ),
                                          );
                                          setState(() {});
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical:
                                                  responsive(20, context)),
                                          child: SvgPicture.asset(
                                            'images/addprocedure.svg',
                                            height: responsive(18, context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: responsive(20, context), top: responsive(40, context)),
            child: CustomButton(
              text: 'Submit',
              onTap: () {
                uploadDataToFirestore({
                  "Name": "Christmas pie",
                  "url": "https://www.bbcgoodfood.com/recipes/2793/christmas-pie",
                  "timetaken": "20Mins",
                  "Description": "Combine a few key Christmas flavours here to make a pie that both children and adults will adore",
                  "Author": "Mary Cadogan",
                  "Ingredients": ingredientsvalues,
                  "Method": proceduressvalues
                });
              },
            ),
          ),
        )
      ],
    )));
  }
}
