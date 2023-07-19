

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../Global Models/Model.dart';

class FoodDBProvider  extends ChangeNotifier {
  List<recipesDB> dataa=[];
  List<dynamic> _jsonData = [];

  List<dynamic> get jsonData => _jsonData;

  // Future<void> loadJsonData() async {
  //   try {
  //     var jsonString = (await rootBundle.loadString('assets/foodDB.json'));
  //     // print(jsonString);
  //     var data = json.decode(jsonString);
  //     // _jsonData = data as List;
  //
  //     dataa = foodDB.fromJson(jsonString as Map<String, dynamic>);
  //     // notifyListeners();
  //     print(data);
  //   } catch (e) {
  //     print('Error loading JSON data: $e');
  //   }
  // }
  Future<void> loadJsonData() async {
    try {
      var jsonString = await rootBundle.loadString('assets/foodDB.json');
      var jsonData = jsonDecode(jsonString);
for(var map in jsonData){
  dataa.add(recipesDB.fromJson(map));
  notifyListeners();
}

      // _jsonData = jsonData as List<dynamic>; // Remove this line


      print(dataa![0].name!);
    } catch (e) {
      print('Error loading JSON data: $e');
    }
  }



}