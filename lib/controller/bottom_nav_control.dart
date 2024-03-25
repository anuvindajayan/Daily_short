import 'package:flutter/material.dart';
import 'package:newsapplication/view/category_screen/category_screen.dart';
import 'package:newsapplication/view/home_screen/home_screen.dart';
import 'package:newsapplication/view/search_screen/search_screen.dart';

class BottomNavController extends ChangeNotifier {
  int selectedIndex = 0;

  void OnItemtap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> mypages = [
    Home_Screen(),
    Category_Screen(),
    Search_Screen(),
  ];
}
