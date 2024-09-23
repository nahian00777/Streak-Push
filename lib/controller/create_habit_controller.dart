import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateHabitController extends GetxController {
  var isEmojiVisible = false.obs;
  var selectedEmoji = "".obs;
  var selectedDays = List<bool>.filled(7, true).obs;
  FocusNode focusNode = FocusNode();

  var isDarkMode = false.obs;

  @override
  void onInit() {
    focusNode.addListener(() {
      if(focusNode.hasFocus) {
        isEmojiVisible.value = true;
      }
    });
    super.onInit();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
  }

  void toggleDay(int index) {
    selectedDays[index] = !selectedDays[index];
    selectedDays.refresh();
  }
}