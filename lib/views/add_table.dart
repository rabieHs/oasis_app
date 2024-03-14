import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:oasis_app/core/consts.dart';
import 'package:table_calendar/table_calendar.dart';

class AddTable extends StatefulWidget {
  const AddTable({Key? key}) : super(key: key);

  @override
  _AddTableState createState() => _AddTableState();
}

class _AddTableState extends State<AddTable> {
  //Create datetime variable
  DateTime _dateTime = DateTime.now();

  // show date picker method

  void _ShowDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // display chosen date
          Text(_dateTime.toString(), style: TextStyle(fontSize: 30)),

          //button
          MaterialButton(
            onPressed: _ShowDatePicker,
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('choose Date',
                  style: TextStyle(
                    color: Color.fromARGB(255, 184, 42, 42),
                    fontSize: 25,
                  )),
            ),
          ),
        ],
      ),
    ));
  }
}
