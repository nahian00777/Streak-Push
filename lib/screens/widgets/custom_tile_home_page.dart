import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streak_push/controller/animation_controller.dart';
import 'package:streak_push/screens/pages/task_page.dart';
import 'package:streak_push/utility/constants.dart';

class CustomTileHomePage extends StatelessWidget {
  const CustomTileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AnimeController animeController = Get.find<AnimeController>();
    // final AnimationController controller = Get.find<AnimationController>();
    return InkWell(
      onTap: () async {
        // Add your onTap code here
        // animeController.toggleAnimation();
        Get.to(TaskPage(),
            transition: Transition.zoom, duration: Duration(milliseconds: 200));
      },
      onLongPress: () {
        // Add your onLongPress code here
        animeController.isPressed.value = !animeController.isPressed.value;
        if (animeController.isPressed.value) {
          animeController.tileColor.value = primaryColor2;
        } else {
          animeController.tileColor.value = Colors.white;
        }
      },
      child: Obx(() {
        return Container(
          // duration: Duration(seconds: 2),
          // color: animeController.tileColor.value,
          decoration: BoxDecoration(
            color: animeController.tileColor.value,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.all(5),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ListTile(
              title: Text(
                'Create a Custom habit',
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
