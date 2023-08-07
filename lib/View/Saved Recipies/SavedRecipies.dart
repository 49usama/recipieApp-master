import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:recipeapp/Global%20Models/Model.dart';
import 'package:recipeapp/View/RecipeDetail/RecipeDetail.dart';

import '../../Global Styles/TextFiles.dart';
import '../../Responsive/Responsiveclass.dart';
import '../../main.dart';
import '../Widgets/TrandingRecipeContainer.dart';

class saved extends StatefulWidget {
  const saved({Key? key}) : super(key: key);

  @override
  State<saved> createState() => _savedState();
}

class _savedState extends State<saved> {
  List<recipesDB> saved= [];
  var saved2 = [];
  Future<void> getdata() async {
    debugPrint("usama");
    final jsonString = prefs.getString('saved');
    saved2 = json.decode(jsonString);
    for(var m in saved2){
      saved.add(recipesDB.fromJson(m));

    }
    json.decode(jsonString);
    // saved.add(items2);
    debugPrint('saveddata is ${saved.length}');


  }
  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Container(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: responsive(15, context)),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: responsive(15, context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        HeadingText(
                            text: 'Saved Recipes',
                            context: context,
                            center: false
                        ),


                      ],
                    ),
                  ),
                 ListView.builder(
                   // physics: AlwaysScrollableScrollPhysics(),
                  physics: NeverScrollableScrollPhysics(),
                      primary: true,
                      shrinkWrap: true,
                     itemCount: saved.length,
                     itemBuilder: (context,i){
                   return InkWell(
                       onTap: (){
                         Get.to(Recipedetail(i: saved[i],));
                       },
                       child: SavedWidget(authname: saved[i].author,name: saved[i].name,url: saved[i].url,));
                 })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SavedWidget extends StatelessWidget {
  var name,authname,url;
   SavedWidget({Key? key,this.name,this.url,this.authname});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  EdgeInsets.fromLTRB(responsive(10, context), responsive(15, context), responsive(10, context), 0),
      child:
      Container(
        height: responsive(150, context),
        // width: responsive(350, context),
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('$url'),
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

                imageUrl: '${url}',
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
                        padding:  EdgeInsets.fromLTRB(responsive(10, context), responsive(50, context),0, 0),
                        child: MediumText(
                            center: false,
                            context: context,
                            color: Colors.black,
                            text: '$name'
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
                                text: 'By ${authname}',
                                color: Colors.black
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
          ],
        ),
      ),
    );
  }
}
