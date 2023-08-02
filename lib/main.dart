import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/View/Home/View/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Globle Controllers/controller.dart';
import 'Globle Controllers/userdataclass.dart';
import 'View/Notifications/Notifications.dart';
import 'View/Saved Recipies/SavedRecipies.dart';
import 'View/Spash/SplashScreen.dart';

var prefs;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();


  String data = "200g, butter, plus extra for the tins";

  // Split the data based on the comma
  List<String> splitData = data.split(',');

  // Trim any leading or trailing whitespace
  String variable1 = splitData[0].trim();
  String variable2 = splitData[1].trim();

  print("Variable 1: $variable1");
  print("Variable 2: $variable2");
  runApp( MultiProvider(providers: [


    ChangeNotifierProvider(create: (context)=> FoodDBProvider()),
    ChangeNotifierProvider(create: (context)=> UserDataController()),



  ],child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // FoodDBProvider().loadJsonData();
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
          primarySwatch: Colors.teal,
        ),
        home: Splash(),
      ),
    );
  }
}
