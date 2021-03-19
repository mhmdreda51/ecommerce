import 'package:e_commerce/constants.dart';
import 'package:e_commerce/helper/enum.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutViewModel extends GetxController {
  int get index => _index;
  int _index = 0;
  Pages get pages => _pages;
  Pages _pages = Pages.DeliveryTime;

  String street1, street2, city, state, country;
  GlobalKey<FormState> formState = GlobalKey();

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (index < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

  void changeIndex(int i) {
    if (i == 0 || i < 0) {
      _pages = Pages.DeliveryTime;
      _index = i;
    } else if (i == 1) {
      _pages = Pages.AddAddress;
      _index = i;
    } else if (i == 2) {
      formState.currentState.save();
      if (formState.currentState.validate()) {
        _pages = Pages.Summary;
        _index = i;
      }
    } else if (i == 3) {
      Get.to(ControlView());
      _pages = Pages.DeliveryTime;

      _index = 0;
    }
    update();
  }
}
