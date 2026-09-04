import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void readMostRecent() async {
    var prefs = await SharedPreferences.getInstance();
    List<String> mostRecentStringsList =
        prefs.getStringList('most-recent') ?? [];
    mostRecentList = mostRecentStringsList.map((String element) {
      return int.parse(element);
    }).toList();
    notifyListeners();
    // return mostRecentIntList;
  }
}
