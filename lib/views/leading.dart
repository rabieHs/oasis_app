import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oasis_app/views/add_event.dart';
import 'package:oasis_app/views/add_table.dart';
import 'package:oasis_app/views/login.dart';

import '../core/consts.dart';

class Leading extends StatefulWidget {
  const Leading({super.key});

  @override
  State<Leading> createState() => _LeadingState();
}

class _LeadingState extends State<Leading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Ajouter"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (FirebaseAuth.instance.currentUser == null) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Login()));
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AddEvent()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.blue,
                            padding: const EdgeInsets.all(15),
                          ),
                          child: const Text(
                            "Event",
                            style: TextStyle(
                                color: Color.fromARGB(255, 219, 14, 14)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddTable()));
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.blue,
                            padding: const EdgeInsets.all(15),
                          ),
                          child: const Text(
                            "Table",
                            style: TextStyle(
                                color: Color.fromARGB(255, 219, 14, 14)),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0).copyWith(left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  bottom: true,
                  child: RichText(
                    text: const TextSpan(
                        text: "Title1",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: "Title2",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: secondaryColor),
                          )
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  // width: double.infinity,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          labelText: "search",
                          suffixIcon: Container(
                            margin: const EdgeInsets.only(
                                right: 5, top: 5, bottom: 5),
                            height: 10,
                            width: 30,
                            decoration: BoxDecoration(
                                color: primaryColors,
                                borderRadius: BorderRadius.circular(7)),
                            child: const Center(
                                child: Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                          ),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blue),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                Row(
                  children: const [
                    Icon(Icons.location_pin),
                    Text(
                      "Location wyz street Gbaes",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Our Place",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 8,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                        testImage,
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          )),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Our Recent Events",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: NetworkImage(
                                  testImage2,
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(25)),
                        child: Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white.withOpacity(0.5),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Wedding",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "12 March 2022 11:30 PM",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
