import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class BuildCalendar extends StatelessWidget {
  const BuildCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return HeatMap(
      datasets: {
        DateTime(2021, 1, 6): 3,
        DateTime(2021, 1, 7): 7,
        DateTime(2024, 1, 8): 10,
        DateTime(2025, 1, 9): 13,
        DateTime(2021, 1, 13): 6,
      },
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: 365)),
      colorMode: ColorMode.opacity,
      showText: false,
      scrollable: true,
      colorsets: {
        1: Color.fromARGB(20, 2, 179, 8),
        1: Color.fromARGB(40, 2, 179, 8),
        1: Color.fromARGB(60, 2, 179, 8),
        1: Color.fromARGB(80, 2, 179, 8),
        1: Color.fromARGB(100, 2, 179, 8),
        1: Color.fromARGB(120, 2, 179, 8),
        1: Color.fromARGB(150, 2, 179, 8),
        1: Color.fromARGB(180, 2, 179, 8),
        1: Color.fromARGB(220, 2, 179, 8),
        1: Color.fromARGB(255, 2, 179, 8)
      },
      onClick: (value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(value.toString())));
      },
    );
  }
}
