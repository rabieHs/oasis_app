import 'package:flutter/material.dart';

class CateGories extends StatefulWidget {
  const CateGories({Key? key}) : super(key: key);

  @override
  State<CateGories> createState() => _CateGoriesState();
}

class _CateGoriesState extends State<CateGories> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.menu),
        style: const TextStyle(color: Colors.white),
        underline: Container(
          height: 2,
          color: Colors.white,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: const [
          DropdownMenuItem<String>(
            value: 'one',
            child: Text('one'),
          ),
          DropdownMenuItem<String>(
            value: 'two',
            child: Text('two'),
          ),
          DropdownMenuItem<String>(
            value: 'three',
            child: Text('three'),
          ),
        ],
      ),
    );
  }
}
