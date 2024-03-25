import 'package:flutter/material.dart';
import 'package:newsapplication/controller/bottom_nav_control.dart';
import 'package:provider/provider.dart';

class Main_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider
          .of<BottomNavController>(context)
          .mypages[Provider
          .of<BottomNavController>(context)
          .selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          currentIndex: Provider
              .of<BottomNavController>(
            context,
          )
              .selectedIndex,
          onTap: (index) =>
              Provider.of<BottomNavController>(context, listen: false)
                  .OnItemtap(index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          ]),
    );
  }
}
