

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../Global Models/Model.dart';

class FoodDBProvider  extends ChangeNotifier {

  List<recipesDB> dataa=[];
  List<dynamic> _jsonData = [];
  var searchKeyword="";


  void UpdatingSearch(value){
    searchKeyword = value;
    notifyListeners();
  }

  List<dynamic> get jsonData => _jsonData;

  Future<void> loadJsonData() async {
    try {
      var jsonString = await rootBundle.loadString('assets/foodDB.json');
      var jsonData = jsonDecode(jsonString);
for(var map in jsonData){
  dataa.add(recipesDB.fromJson(map));
  notifyListeners();
}




      print(dataa![0].name!);
    } catch (e) {
      print('Error loading JSON data: $e');
    }
  }




  Future<void> fetchDataFromFirestore() async {


    try {
      dataa.clear();
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Recipes').orderBy('time').get();
      querySnapshot.docs.reversed.forEach((document) async {
        // print("data = ${document.data()}");
        var map = document.data();

        dataa.add(recipesDB.fromJson(map as Map<String, dynamic>));

      });
    loadJsonData();
    } catch (e) {
      print("Error fetching data from Firestore: $e");
    }
        print(dataa[0].author);
    notifyListeners();

  }



}