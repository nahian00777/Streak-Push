import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:streak_push/utility/constants.dart';

class BuildCalendar extends StatelessWidget {
  const BuildCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      datasets: {
        DateTime(2024, 11, 6): 3,
        DateTime(2024, 10, 7): 7,
        DateTime(2024, 1, 8): 10,
        DateTime(2025, 1, 9): 13,
        DateTime(2025, 1, 13): 6,
      },
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: 365)),
      colorMode: ColorMode.opacity,
      showText: false,
      scrollable: true,
      colorsets: {
        1: Color.fromARGB(20, 2, 179, 8),
        2: Color.fromARGB(40, 2, 179, 8),
        3: Color.fromARGB(60, 2, 179, 8),
        4: Color.fromARGB(80, 2, 179, 8),
        5: Color.fromARGB(100, 2, 179, 8),
        6: Color.fromARGB(120, 2, 179, 8),
        7: Color.fromARGB(150, 2, 179, 8),
        9: Color.fromARGB(170, 2, 179, 8),
        10: Color.fromARGB(200, 2, 179, 8),
        11: Color.fromARGB(220, 2, 179, 8),
        12: Color.fromARGB(240, 2, 179, 8),
        13: Color.fromARGB(255, 2, 179, 8),
      },
      onClick: (value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 200),
          backgroundColor: secondaryColor, // Change the background color here
          content: Text(
            '${value.day}-${value.month}-${value.year}',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ));
      },
    );
  }
}
