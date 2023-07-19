import 'package:flutter/material.dart';
import 'package:recipeapp/Global%20Styles/TextFiles.dart';
import 'package:recipeapp/Responsive/Responsiveclass.dart';

class NewRecipe extends StatelessWidget {
  var url, name;

   NewRecipe({this.name,this.url,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsive(170, context),
     width: responsive(295, context),
      child: Stack(

        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(responsive(20, context)),
              ),
                color: Colors.white,
              child: Container(
                height: responsive(110, context),
                width: responsive(300, context),
                child: Padding(
                  padding:  EdgeInsets.only(top: responsive(10, context),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: responsive(150, context),
                        height: responsive(20, context),
                        child: Padding(
                          padding:  EdgeInsets.fromLTRB(responsive(10, context), 0, 0, 0),
                          child: normalText(
                            center: false,
                            text: '$name',
                            context: context,
                            color: Color(0xFF484848),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: responsive(10, context),top: responsive(5, context),bottom: responsive(5, context)),
                        child: Container(
                          height: responsive(20, context),
                          child: ListView.builder(
                            shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:5,
                              itemBuilder: (context,i){
                            return Icon(Icons.star,color:Color(0xffFFAD30),size: responsive(15, context),);
                          }),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: responsive(10, context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                               CircleAvatar(
                                 backgroundColor: Color(0xFFD9D9D9),
                                    radius: responsive(15, context),
                                    backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxsR8Th9DhpNwI1Gsj2fyL8eHJgrY-kVEYWQ50040j&s"),
                                  ),
                                SizedBox(width: responsive(5, context),),
                                smallText(
                                    text: 'By James Milner',
                                    context: context,
                                    color:  Color(0xFFA9A9A9),
                                  ),

                              ],
                            ),
                            Padding(
                              padding:  EdgeInsets.only(right: responsive(10, context)),
                              child: Row(
                                children:[
                                  Icon(Icons.watch_later_outlined,size: responsive(17, context),color: Color(0xFFA9A9A9),),
                                  SizedBox(width: responsive(5, context),),
                                  smallText(
                                    text: '20 mins',
                                    context: context,
                                    color: Color(0xFFA9A9A9),
                                  )
                                ]
                               
                              ),
                            ),
                            
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: responsive(20, context)),
              child: CircleAvatar(
                backgroundColor: Color(0xFFD9D9D9),
                radius: responsive(40, context),
                backgroundImage:NetworkImage('$url'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
