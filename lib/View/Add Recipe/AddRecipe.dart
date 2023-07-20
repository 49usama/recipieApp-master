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
  var text;
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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyCustomTextField(
                                            height: responsive(55, context),
                                            width: responsive(200, context),
                                            hintText: ' chef name ',
                                          ),
                                          CustomButton(text: 'Pick Image',onTap: (){},)
                                        ],
                                      ),
                                    ),
                                    ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      primary: true,
                                      itemCount: ingredients.length,
                                      itemBuilder: (context, index) {
                                        print(ingredientsvalues.length-1==index?ingredientsvalues[index]:"",);
                                        final item = ingredients[index];

                                        return
                                          SwipeActionCell(
                                          key: ObjectKey(item), /// this key is necessary
                                          trailingActions: <SwipeAction>[
                                            SwipeAction(
                                                title: "delete",
                                                onTap: (CompletionHandler handler) async {
print(ingredientsvalues);

                                                  ingredients.remove(item);
if(ingredientsvalues.length-1<index){

} else {
  final ingri = ingredientsvalues[index];
  ingredientsvalues.remove(ingri);
}



                                                  setState(() {});
                                                },
                                                color: Colors.red),
                                          ],
                                          child:
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, responsive(10, context), 0, 0),
                                            child: MyCustomTextField(
onchange: (value){
  ingredientsvalues.insert(index,value);
print(index);
print(ingredientsvalues.length-1);
},
                                              text: ingredientsvalues.length-1<index?"":ingredientsvalues.isEmpty?"":ingredientsvalues[index],
                                              height: responsive(55, context),
                                              width: responsive(420, context),
                                              hintText: 'Ingredients',
                                            ),
                                          ),
                                        );
                                        //   Dismissible(
                                        //   key: UniqueKey(), // Use a unique key for each ingredient
                                        //   direction: DismissDirection
                                        //       .endToStart, // Swipe from right to left
                                        //   onDismissed: (direction) {
                                        //
                                        //       setState(() {
                                        //         ingredients.remove(item); // Remove the ingredient using its key
                                        //       });
                                        //
                                        //
                                        //     // Show a snackbar to notify the user that the ingredient is deleted
                                        //     ScaffoldMessenger.of(context).showSnackBar(
                                        //       SnackBar(
                                        //         backgroundColor: Color(0xFF119475),
                                        //         content: Text('Ingredient Deleted'),
                                        //         action: SnackBarAction(
                                        //           textColor: Colors.white,
                                        //           label: 'Undo',
                                        //           onPressed: () {
                                        //             ingredients.insert(
                                        //                 index, ingredients[index]);
                                        //             // Restore the ingredient when the "Undo" button is pressed
                                        //             setState(() {});
                                        //           },
                                        //         ),
                                        //       ),
                                        //     );
                                        //     Builder(builder: (context) {
                                        //       setState(() {
                                        //
                                        //       });
                                        //       return Container(); // This empty container will replace the Dismissible in the tree.
                                        //     });
                                        //   },
                                        //   background: Container(
                                        //     height: responsive(20, context),
                                        //     color: Colors.red,
                                        //     alignment: Alignment.centerRight,
                                        //     padding: EdgeInsets.only(right: 16.0),
                                        //     child: Icon(Icons.delete, color: Colors.white),
                                        //   ),
                                        //   child: Padding(
                                        //     padding: EdgeInsets.fromLTRB(
                                        //         0, responsive(10, context), 0, 0),
                                        //     child: MyCustomTextField(
                                        //
                                        //       height: responsive(55, context),
                                        //       width: responsive(420, context),
                                        //       hintText: 'Ingredients',
                                        //     ),
                                        //   ),
                                        // );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, responsive(10, context), 0, 0),
                                      child: Row(
                                        mainAxisAlignment:   procedures.isEmpty?MainAxisAlignment.spaceBetween: MainAxisAlignment.end,
                                        children: [
                                          procedures.isEmpty
                                              ? InkWell(
                                                  onTap: () {
                                                    procedures.add(
                                                      Padding(
                                                        padding: EdgeInsets.fromLTRB(0,
                                                            responsive(10, context), 0, 0),
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
                                                    padding:   EdgeInsets.symmetric(vertical: responsive(20, context)),
                                                    child: SvgPicture.asset(
                                                        'images/addprocedure.svg',height: responsive(18, context),),
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
                                              padding:  EdgeInsets.symmetric(vertical: responsive(25, context)),
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
                                        return Dismissible(
                                          key:UniqueKey(), // Use a unique key for each ingredient
                                          direction: DismissDirection
                                              .endToStart, // Swipe from right to left
                                          onDismissed: (direction) {
                                            setState(() {
                                              procedures.removeAt(
                                                  index); // Remove the ingredient on swipe
                                            });

                                            // Show a snackbar to notify the user that the ingredient is deleted
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                backgroundColor: Color(0xFF119475),

                                                content: Text('procedure Deleted'),
                                                action: SnackBarAction(
                                                  textColor: Colors.white,
                                                  label: 'Undo',
                                                  onPressed: () {
                                                    procedures.insert(
                                                        index, procedures[index]);
                                                    // Restore the procedure when the "Undo" button is pressed
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                          background: Container(
                                            height: responsive(20, context),
                                            color: Colors.red,
                                            alignment: Alignment.centerRight,
                                            padding: EdgeInsets.only(right: 16.0),
                                            child: Icon(Icons.delete, color: Colors.white),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, responsive(10, context), 0, 0),
                                            child: MyCustomTextField(
                                              height: responsive(55, context),
                                              width: responsive(420, context),
                                              hintText: 'Procedure',
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(bottom: responsive(150, context)),
                                      child: Visibility(
                                        visible: procedures.isEmpty?false:true,
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
                                                          0, responsive(10, context), 0, 0),
                                                      child: MyCustomTextField(
                                                        height: responsive(55, context),
                                                        width: responsive(400, context),
                                                        hintText: 'Procedure  ',
                                                      ),
                                                    ),
                                                  );
                                                  setState(() {});
                                                },
                                                child:
                                                    Padding(
                                                      padding:  EdgeInsets.symmetric(vertical: responsive(20, context)),
                                                      child: SvgPicture.asset('images/addprocedure.svg',height: responsive(18, context),),

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
                    padding:  EdgeInsets.only(bottom: responsive(20, context),top: responsive(40, context)),
                    child: CustomButton(text: 'Submit',onTap: (){},),
                  ),
                )
              ],
            )
        )
    );
  }
}
