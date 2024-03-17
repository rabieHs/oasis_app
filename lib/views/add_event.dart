import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:uuid/uuid.dart';

class AddEvent extends StatefulWidget {
  AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  String? selectedType;
  String? selectedValue;
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final nbplacesController = TextEditingController();
  final contactController = TextEditingController();
  final otherController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          labelText: 'full real name',
                          icon: Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          labelText: 'Event name',
                          icon: Icon(Icons.badge_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'type de evenements',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedType,
                      onChanged: (String? value) {
                        setState(() {
                          selectedType = value;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        height: 40,
                        width: 500,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    )),
                    SizedBox(
                      height: 16.0,
                    ),
                    DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Accessible',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: item
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        height: 40,
                        width: 500,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    )),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      onTap: () async {
                        final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050));

                        if (date != null) {
                          setState(() {
                            dateController.text =
                                "${date.day}- ${date.month}- ${date.year}";
                          });
                        }
                      },
                      controller: dateController,
                      decoration: InputDecoration(
                          labelText: 'date',
                          icon: Icon(Icons.calendar_month_sharp),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      onTap: () async {
                        final time = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        if (time != null) {
                          setState(() {
                            timeController.text = "${time.hour}:${time.minute}";
                          });
                        }

                        print(time);
                      },
                      controller: timeController,
                      decoration: InputDecoration(
                          labelText: 'heure',
                          icon: Icon(Icons.calendar_month_sharp),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: nbplacesController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'nombre de personne',
                          icon: Icon(Icons.confirmation_number),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: contactController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'contact',
                          icon: Icon(Icons.contact_phone),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: otherController,
                      maxLines: 3,
                      decoration: InputDecoration(
                          labelText: 'plus dinformation',
                          icon: Icon(Icons.info_outline),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            final userId =
                                FirebaseAuth.instance.currentUser!.uid;
                            final userName = usernameController.text;
                            final name = nameController.text;
                            final date = dateController.text;
                            final time = timeController.text;
                            final nbr = nbplacesController.text;
                            final contact = contactController.text;
                            final moreInfo = otherController.text;
                            final event_id = Uuid().v4();
                            await FirebaseFirestore.instance
                                .collection('events')
                                .doc(event_id)
                                .set({
                              "confidentialite": selectedValue,
                              "event_id": event_id,
                              "user_id": userId,
                              "user-name": userName,
                              "event_name": name,
                              "type": selectedType,
                              "date": date,
                              "time": time,
                              "number": nbr,
                              "contact": contact,
                              "more_info": moreInfo,
                              "status": "en attente"
                            }).whenComplete(() {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Event added Successfully"),
                                backgroundColor: Colors.green,
                              ));
                            });
                          },
                          child: Text("Enregistrer")),
                    ),
                  ],
                ),
              ),
            )));
  }
}

final List<String> items = [
  'Mariage',
  'Soutenance',
  'Anniversaire',
  'party',
];
List<String> selectedValue = [];
final List<String> item = [
  'public',
  'private',
];
List<String> selectedItem = [];
