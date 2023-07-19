import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/View/Home/View/Home.dart';

import 'Globle Controllers/controller.dart';
import 'View/Notifications/Notifications.dart';
import 'View/Saved Recipies/SavedRecipies.dart';
import 'View/Spash/SplashScreen.dart';

void main(){
  runApp( MultiProvider(providers: [


    ChangeNotifierProvider(create: (context)=> FoodDBProvider()),



  ],child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FoodDBProvider().loadJsonData();
    return GetMaterialApp(
      home: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Splash(),
      ),
    );
  }
}
