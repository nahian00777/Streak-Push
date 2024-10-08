import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streak_push/screens/pages/settings_page.dart';
import 'package:streak_push/screens/widgets/build_calendar.dart';
import 'package:streak_push/utility/constants.dart';

import '../../controller/create_habit_controller.dart';

class TaskPage extends StatelessWidget {
  String habitName;

  TaskPage({required this.habitName});

  @override
  Widget build(BuildContext context) {
    String taskName =
        habitName; // Ideally, this should come from a reactive variable or a state management solution
    int streakDays =
        0; // Ideally, this should come from a reactive variable or a state management solution

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
          taskName,
          style: TextStyle(
            fontFamily: 'Times New Roman',
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onSelected: (String result) {
              // Handle the selected option here
              if (result == 'Edit') {
                // Perform edit action
              } else if (result == 'Delete') {
                // Perform delete action
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'Edit',
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'Delete',
                child: Text(
                  'Delete',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
            offset: Offset(0, 35),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildStreakContainer(streakDays),
            SizedBox(height: 20),
            _buildTotalRepetitions(),
            SizedBox(height: 20),
            _buildCompletionRate(),
            SizedBox(height: 20),
            _buildFrequency(),
            SizedBox(height: 20),
            _buildReminder(),
            SizedBox(height: 20),
            _buildHabitCreatedOn(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget to build the Current Streak section
  Widget _buildStreakContainer(int streakDays) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Current Streak',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                streakDays.toString(),
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.local_fire_department, size: 50, color: Colors.orange),
            ],
          ),
        ],
      ),
    );
  }

  // Widget to build Total Repetitions section
  Widget _buildTotalRepetitions() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Repetitions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Time',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(height: 10),
          BuildCalendar(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  // Widget to build Completion Rate section
  Widget _buildCompletionRate() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Completion Rate',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '0%',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build Frequency section
  Widget _buildFrequency() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Frequency',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'All Days',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build Reminder section
  Widget _buildReminder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reminder',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '1:00 AM',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build Habit Created On section
  Widget _buildHabitCreatedOn() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Habit Created On',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '12th October 2021',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
