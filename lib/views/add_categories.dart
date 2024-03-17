import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [DropdownMenu].

const List<String> list = <String>[
  'Coffee',
  'water',
  'breakfast',
  'sweets',
  'tea',
  'jus',
];

void main() => runApp(DropdownMenuApp());

class DropdownMenuApp extends StatefulWidget {
  DropdownMenuApp({super.key});

  @override
  State<DropdownMenuApp> createState() => _DropdownMenuAppState();
}

class _DropdownMenuAppState extends State<DropdownMenuApp> {
  final articleController = TextEditingController();

  final prixController = TextEditingController();

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
            appBar: AppBar(title: const Text('Add menu ')),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownMenu<String>(
                    initialSelection: list.first,
                    onSelected: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    dropdownMenuEntries:
                        list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: articleController,
                    decoration: InputDecoration(
                        labelText: "Article",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: prixController,
                    decoration: InputDecoration(
                        labelText: "Prix",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final article = articleController.text;
                        final prix = prixController.text;
                        FirebaseFirestore.instance
                            .collection("menu")
                            .doc()
                            .set({
                          "article": article,
                          "prix": prix,
                          "categorie": dropdownValue
                        }).whenComplete(() {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("article added Successfully"),
                            backgroundColor: Colors.green,
                          ));
                          Navigator.pop(context);
                        });
                      },
                      child: Text("Ajouter")),
                ],
              ),
            )));
  }
}
