import 'package:flutter/material.dart';
import 'package:newsapplication/controller/bottom_nav_control.dart';
import 'package:newsapplication/controller/category_controller.dart';
import 'package:newsapplication/controller/home_screen_controller.dart';
import 'package:newsapplication/controller/search_screen_controller.dart';
import 'package:newsapplication/view/bottom_nav/mainScreen.dart';
import 'package:newsapplication/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyNewsapp());
}

class MyNewsapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => HomeScreenController()),
      ChangeNotifierProvider(create: (context) => SearchScreenController()),
      ChangeNotifierProvider(create: (context) => BottomNavController()),
      ChangeNotifierProvider(create: (context) => CategoryController())
    ],child: MaterialApp(debugShowCheckedModeBanner: false,home: Newssplash(),),);
  }
}
