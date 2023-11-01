import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class setprovider extends ChangeNotifier {
  int counter = 0;
  setprovider() {
    getValue();
  }

  Future<void> getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter = await prefs.getInt('value') ?? 0;
    notifyListeners();
  }

  //int get Counter => counter;
  Future<void> incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('value', counter++);
    // counter++;
    notifyListeners();
  }

  Future<void> getValue1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter = await prefs.getInt('value1') ?? 0;
  }

  Future<void> decrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('value1', counter--);
    //counter--;
    notifyListeners();
  }
}
