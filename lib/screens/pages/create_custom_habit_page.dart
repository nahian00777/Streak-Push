import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streak_push/screens/pages/home_page.dart';
import 'package:streak_push/utility/constants.dart';
import '../../controller/create_habit_controller.dart';

class CreateNewHabitPage extends GetView<CreateHabitController> {
  CreateNewHabitPage({super.key});

  final CreateHabitController controller = Get.put(CreateHabitController());
  final FocusNode textFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
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
                                controller: controller.habitName,
                                onTap: () {
                                  // Toggling emoji visibility using GetX observable
                                  controller.isEmojiVisible.value = false;
                                },
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 5, right: 5),
                                  border: InputBorder.none,
                                  hintText: " workout",
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
                              // controller.isEmojiVisible.value = true;
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: secondaryColor,
                                  context: context,
                                  builder: (_) {
                                    return FractionallySizedBox(
                                      heightFactor: 0.75,
                                      child: Column(children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          // Margin from the top
                                          height: 5,
                                          // Height of the bar
                                          width: 50,
                                          // Width of the bar
                                          decoration: BoxDecoration(
                                            color: Colors.grey[400],
                                            // Color of the bar
                                            borderRadius: BorderRadius.circular(
                                                10), // Rounded edges
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: secondaryColor,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 8,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: secondaryColor,
                                            ),
                                            child: EmojiPicker(
                                              onEmojiSelected:
                                                  (category, emoji) {
                                                // Add your onEmojiSelected code here
                                                controller.selectedEmoji.value =
                                                    emoji.emoji;
                                                controller.isEmojiVisible
                                                    .value = false;
                                              },
                                              config: Config(
                                                bottomActionBarConfig:
                                                    BottomActionBarConfig(
                                                  showSearchViewButton: false,
                                                  showBackspaceButton: false,
                                                ),
                                                emojiViewConfig:
                                                    EmojiViewConfig(
                                                  backgroundColor:
                                                      secondaryColor,
                                                ),
                                                categoryViewConfig:
                                                    CategoryViewConfig(
                                                  backgroundColor:
                                                      secondaryColor,
                                                ),
                                                skinToneConfig: SkinToneConfig(
                                                  dialogBackgroundColor:
                                                      secondaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    );
                                  });
                              FocusScope.of(context)
                                  .requestFocus(controller.focusNodeToHabit);
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
                          Obx(() {
                            int selectedCount = controller.selectedDays
                                .where((day) => day == true)
                                .length;
                            String displayText;
                            // Determine the text to display based on the selectedCount
                            if (selectedCount == 7) {
                              displayText = "All Day";
                            } else if (selectedCount == 0) {
                              displayText = "Choose at least 1 day";
                            } else {
                              displayText = "$selectedCount x days";
                            }
                            return Text(displayText,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold));
                          }),
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
                                    controller.toggleDay(index);
                                    // toggle Color
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Obx(() {
                                    return CircleAvatar(
                                      backgroundColor:
                                          controller.selectedDays[index]
                                              ? secondaryColor
                                              : Colors.grey,
                                      child: Text(
                                        dayLabel[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  })),
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
                          Obx(() {
                            return Switch(
                                value: controller.isReminderOn.value,
                                onChanged: (value) {
                                  // FocusScope.of(context).unfocus();
                                  controller.isReminderOn.value = value;
                                  if (value) {
                                    showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                        .then((time) {
                                      if (time != null) {
                                        controller.selectedTime = time;
                                      }
                                      FocusScope.of(context).requestFocus(
                                          controller.focusNodeToHabit);
                                    });
                                  } else {
                                    controller.resetReminder();
                                  }
                                });
                          }),
                        ],
                      ),
                      Obx(() {
                        if (controller.isReminderOn.value &&
                            controller.selectedTime != null) {
                          return Text(
                            "Reminder set for: ${controller.selectedTime!.format(context)}",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          );
                        } else {
                          return Container(); // Empty container when no reminder is set
                        }
                      }),
                      const Spacer(),

                      Focus(
                        focusNode: controller.focusNodeToHabit,
                        child: ElevatedButton(
                          onPressed: () {
                            // Pushing Data to the Database
                            controller.reset();
                            Get.offAll(MyHomePage());
                          },
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
                      ),
                      // Obx to reactively manage the visibility of the EmojiPicker
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
