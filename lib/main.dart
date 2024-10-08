import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:streak_push/controller/animation_controller.dart';
import 'package:streak_push/screens/wrapper/main_wrapper.dart';
import 'package:streak_push/services/database_service.dart';

import 'controller/create_habit_controller.dart';

void main() {
  Get.put(AnimeController());
  Get.put(MainWrapperController());
  Get.put(CreateHabitController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Streak Push',
      theme: ThemeData(
        popupMenuTheme: PopupMenuThemeData(
          color: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainWrapper(),
    );
  }
}
