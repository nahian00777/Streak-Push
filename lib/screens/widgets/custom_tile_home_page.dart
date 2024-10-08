import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streak_push/controller/animation_controller.dart';
import 'package:streak_push/utility/constants.dart';

import '../../models/task_model.dart';

class CustomTileHomePage extends StatelessWidget {
  final VoidCallback onnClick;
  final Task? task;

  const CustomTileHomePage({super.key, required this.onnClick, this.task});

  @override
  Widget build(BuildContext context) {
    final AnimeController animeController = Get.find<AnimeController>();

    return InkWell(
      onTap: onnClick,
      onLongPress: () {
        // Toggle pressed state and color
        animeController.isPressed.value = !animeController.isPressed.value;
        animeController.tileColor.value =
            animeController.isPressed.value ? primaryColor2 : Colors.white;
      },
      child: Obx(() {
        // Use AnimatedContainer for smooth color transitions
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          // Duration for color transition
          decoration: BoxDecoration(
            color: animeController.tileColor.value,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.all(5),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ListTile(
              title: Text(
                task?.name ?? 'Habit Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Icon(
                Icons.ac_unit,
                size: 40,
              ),
              trailing: Icon(
                Icons.fire_extinguisher,
                size: 30,
              ),
              subtitle: Text(
                'Here is the subtitle for the habit',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
