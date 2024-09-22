import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:streak_push/controller/animation_controller.dart';
import 'package:streak_push/screens/wrapper/main_wrapper.dart';

void main() {
  Get.put(AnimeController());
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
