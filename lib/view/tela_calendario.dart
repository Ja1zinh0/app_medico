import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../components/bottomBar.dart';
import '../components/customAppBar.dart';

class VerCalendario extends StatefulWidget {
  const VerCalendario({super.key});

  @override
  State<VerCalendario> createState() => VerCalendarioState();
}

class VerCalendarioState extends State<VerCalendario> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      drawer: buildDrawer(context),
      endDrawer: buildEndDrawer(context),
      bottomNavigationBar: CustomBottom(context),
      body: Column(
        children: [
          TableCalendar(
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            firstDay: DateTime.utc(2023, 01, 01),
            lastDay: DateTime.utc(2025, 3, 14),
            focusedDay: DateTime.now(),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
          )
        ],
      ),
    );
  }
}
