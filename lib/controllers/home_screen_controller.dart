import 'package:ecommerce_app/views/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;

  List<Widget> pagesList = [
    const HomeScreen(),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('settings')],
      ),
    ),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('person')],
      ),
    ),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('favorites')],
      ),
    ),
  ];
  List titleBottomAppbar = ['Home', 'Settings', 'Profile', 'Favorite'];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
