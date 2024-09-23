import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeController extends GetxController {
  // Observable properties to animate
  // var height = 100.0.obs;
  // var width = 100.0.obs;
  var color = Colors.blue.obs;
  // var padding = 0.0.obs;

  void toggleAnimation() {
    // Change properties to trigger animation
    // height.value = height.value == 100 ? 200 : 100;
    // width.value = width.value == 100 ? 200 : 100;
    color.value = color.value == Colors.blue ? Colors.red : Colors.blue;
  }
}