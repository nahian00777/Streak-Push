import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Correct import for GetX
import 'package:intl/intl.dart';
import 'package:streak_push/screens/pages/task_page.dart';
import 'package:streak_push/utility/constants.dart';

class MySettingPage extends StatelessWidget {
  const MySettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current date
    String curDate = 'Settings';
    return Scaffold(
      backgroundColor: primaryColor,
      // Light background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              curDate,
              style: TextStyle(
                fontFamily: 'Setting',
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: ListView(
          children: [
            // Language
            InkWell(
              onTap: () async {
                // Add your onTap code here
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          color: primaryColor,
                          Icons.language,
                          size: 25,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Language',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "English",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Subscription
            InkWell(
              onTap: () async {
                // Add your onTap code here
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          color: primaryColor,
                          Icons.subscriptions,
                          size: 25,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Subscription',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Choose a Premium Plan",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Share , Review, Contact
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      // Add your onTap code here
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              color: primaryColor,
                              Icons.share,
                              size: 25,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Share App',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Share Habits Streak with your friends",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      // Add your onTap code here
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              color: primaryColor,
                              Icons.reviews,
                              size: 25,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Review App',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Help us grow by leaving 5 star review",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      // Add your onTap code here
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              color: primaryColor,
                              Icons.contact_support,
                              size: 25,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Contact Developer',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Let me know how can I improve this app",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
