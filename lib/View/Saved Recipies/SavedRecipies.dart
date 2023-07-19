import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Global Styles/TextFiles.dart';
import '../../Responsive/Responsiveclass.dart';
import '../Widgets/TrandingRecipeContainer.dart';

class saved extends StatefulWidget {
  const saved({Key? key}) : super(key: key);

  @override
  State<saved> createState() => _savedState();
}

class _savedState extends State<saved> {
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
                     itemCount: 10,
                     itemBuilder: (context,i){
                   return SavedWidget();
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
  const SavedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
