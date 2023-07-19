

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../Global Models/Model.dart';

class FoodDBProvider  extends ChangeNotifier {
  foodDB? dataa;
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

      dataa = foodDB.fromJson(jsonData as Map<String, dynamic>);
      // _jsonData = jsonData as List<dynamic>; // Remove this line

      notifyListeners();
      print(dataa!.meals![0].strCategory);
    } catch (e) {
      print('Error loading JSON data: $e');
    }
  }



}