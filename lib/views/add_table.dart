import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:oasis_app/core/consts.dart';
import 'package:table_calendar/table_calendar.dart';

class AddTable extends StatefulWidget {
  const AddTable({super.key});

  @override
  State<AddTable> createState() => _AddTableState();
}

class _AddTableState extends State<AddTable> {
  DateTime today = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColors,
        title: Text("Add Table"),
      ),
      body: content(),
    );
  }

  content() {
    return Column(
      children: [
        Text(
          "Date",
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.blue),
        ),
        Container(
          child: TableCalendar(
              focusedDay: today,
              firstDay: DateTime.utc(2015, 10, 01),
              lastDay: DateTime.utc(2050, 10, 01)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Time"),
            Text("${selectedTime.hour}:${selectedTime.minute}"),
            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: selectedTime,
                  initialEntryMode: TimePickerEntryMode.dial,
                );
                if (timeOfDay != null) {
                  setState(() {
                    selectedTime = timeOfDay;
                  });
                }
              },
              child: const Text("choose time"),
            )
          ],
        )
      ],
    );
  }
}
