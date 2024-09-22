import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTile extends StatelessWidget {

  const CustomTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // Add your onTap code here
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
    );
  }
}
