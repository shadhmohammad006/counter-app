import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class setprovider extends ChangeNotifier {
//   int counter = 0;

//   //int get Counter => counter;
//   Future<void> incrementCounter() async {
//     final SharedPreferences prefs = await _prefs;
//     final int counter = (prefs.getInt('counter') ?? 0) + 1;
//     counter++;
//     notifyListeners();
//     _counter = prefs.setInt('counter', counter).then((bool success) {
//       return counter;
//     });
//   }

//   void decrementCounter() {
//     counter--;
//     notifyListeners();
//   }
// }
