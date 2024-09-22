import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streak_push/utility/constants.dart';
import '../../controller/create_habit_controller.dart';

class CreateNewHabitPage extends GetView<CreateHabitController> {
  CreateNewHabitPage({super.key});

  final CreateHabitController controller = Get.put(CreateHabitController());
  final FocusNode textFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    List<bool> selectedDays = List.generate(7, (index) => false);
    bool reminder = false;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        controller.isEmojiVisible.value = false;
      },
      child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Create a new habit",
              style: TextStyle(
                fontFamily: 'Times New Roman',
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextField(
                                onTap: () {
                                  // Toggling emoji visibility using GetX observable
                                  controller.isEmojiVisible.value = false;
                                },
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 5, right: 5),
                                  border: InputBorder.none,
                                  hintText: " Workout",
                                  hintStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Toggling emoji visibility using GetX observable
                              controller.isEmojiVisible.value = true;
                              FocusScope.of(context).unfocus();
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Obx(() {
                                return controller.selectedEmoji.value.isEmpty
                                    ? Icon(Icons.add, size: 40)
                                    : Text(
                                        controller.selectedEmoji.value,
                                        style: TextStyle(fontSize: 30),
                                      );
                              }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Frequency',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text('All Day',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          7,
                          (index) {
                            const dayLabel = [
                              'S',
                              'M',
                              'T',
                              'W',
                              'T',
                              'F',
                              'S'
                            ];
                            return Flexible(
                              child: InkWell(
                                  onTap: () {
                                    // Add your onTap code here
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: selectedDays[index]
                                        ? Colors.white
                                        : Colors.grey,
                                    child: Text(
                                      dayLabel[index],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Reminder',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Switch(
                              value: reminder,
                              onChanged: (value) => reminder = value),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 60),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Create Habit',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      // Obx to reactively manage the visibility of the EmojiPicker
                    ],
                  ),
                ),
                Obx(() {
                  return GestureDetector(
                    onVerticalDragUpdate: (details) {
                      if (details.delta.dy > 0)
                        controller.isEmojiVisible.value = false;
                    },
                    child: Container(
                      // rounded
                      padding: EdgeInsets.only(top: 200),
                      height: double.infinity,
                      width: double.infinity,
                      child: Offstage(
                        offstage: !controller.isEmojiVisible.value,
                        child: EmojiPicker(
                          onEmojiSelected: (category, emoji) {
                            // Add your onEmojiSelected code here
                            controller.selectedEmoji.value = emoji.emoji;
                            controller.isEmojiVisible.value = false;
                          },
                          config: Config(
                            bottomActionBarConfig: BottomActionBarConfig(
                              showSearchViewButton: false,
                              showBackspaceButton: false,
                            ),
                            customBackspaceIcon: Icon(Icons.arrow_back),
                            emojiViewConfig: EmojiViewConfig(
                              backgroundColor: secondaryColor,
                            ),
                            categoryViewConfig: CategoryViewConfig(
                              backgroundColor: secondaryColor,
                            ),
                            skinToneConfig: SkinToneConfig(
                              dialogBackgroundColor: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          )),
    );
  }
}
