import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streak_push/screens/pages/create_custom_habit_page.dart';
import 'package:streak_push/screens/widgets/custom_tile.dart';

import '../../utility/constants.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "New Habit",
          style: TextStyle(
            fontFamily: 'Times New Roman',
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  // Add your onTap code here
                  Get.to(CreateNewHabitPage(), transition: Transition.zoom, duration: Duration(milliseconds: 200));
                },
                child: Card(
                  margin: EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
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
                      subtitle: Text(
                        'Here is the subtitle for the habit',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Popular habits",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select a habit from the list below. This will help you get started.",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return CustomTile();
                    }),
              ),
            ],
          )),
    );
  }
}
