import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Correct import for GetX
import 'package:intl/intl.dart';
import 'package:streak_push/screens/pages/add_task_page.dart';
import 'package:streak_push/screens/pages/settings_page.dart';
import 'package:streak_push/screens/pages/task_page.dart';
import 'package:streak_push/utility/constants.dart';

import '../widgets/custom_tile_home_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current date
    String curDate = DateFormat('EEEE, MMMM d, yyyy').format(DateTime.now());
    return Scaffold(
      backgroundColor: primaryColor,
      // Light background color
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10),
            Text(
              curDate,
              style: TextStyle(
                fontFamily: 'Times New Roman',
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              color: Colors.black,
              onPressed: () {},
              icon: Icon(Icons.calendar_month_outlined),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 6 , right: 6),
        child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return CustomTileHomePage();
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here
          Get.to(AddTaskPage(), transition: Transition.zoom, duration: Duration(milliseconds: 200));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: secondaryColor,
      ),
    );
  }
}
