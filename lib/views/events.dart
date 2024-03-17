import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oasis_app/services/events.dart';
import '../core/consts.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  bottom: true,
                  child: Text(
                    "Profitez de nos grands espaces verts",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 73, 111, 131)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  // width: double.infinity,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          labelText: "search",
                          suffixIcon: Container(
                            margin:
                                EdgeInsets.only(right: 5, top: 5, bottom: 5),
                            height: 10,
                            width: 30,
                            decoration: BoxDecoration(
                                color: primaryColors,
                                borderRadius: BorderRadius.circular(7)),
                            child: Center(
                                child: Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                          ),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.blue),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                Text(
                  "Nos Evénements",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueGrey,
                      backgroundColor: Color(5)),
                ),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder(
                    stream: uid == adminId
                        ? FirebaseFirestore.instance
                            .collection('events')
                            .snapshots()
                        : FirebaseFirestore.instance
                            .collection('events')
                            .where("confidentialite", isEqualTo: "public")
                            .where("status", isEqualTo: "accepte")
                            .snapshots(),
                    builder: (context, result) {
                      if (result.hasError) {
                        print(result.error);
                      }
                      if (result.data == null) {
                        // return error widget
                        return CircularProgressIndicator();
                      } else {
                        final data = result.data;
                        List events = data!.docs.map((doc) {
                          return doc.data();
                        }).toList();

                        return ListView.builder(
                            padding: EdgeInsets.only(top: 10),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: events.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: const Text(
                                                'demande de creation dune evenements'),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("nom: "),
                                                    Text(events[index]
                                                        ["event_name"]),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        "nom de l'utilisateur: "),
                                                    Text(events[index]
                                                        ["user-name"]),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            actions: uid != adminId
                                                ? <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'events')
                                                            .doc(events[index]
                                                                ["event_id"])
                                                            .update({
                                                          "status": "refuse"
                                                        });
                                                      },
                                                      child:
                                                          const Text('Refuser'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'events')
                                                            .doc(events[index]
                                                                ["event_id"])
                                                            .update({
                                                          "status": "accepte"
                                                        });
                                                      },
                                                      child: const Text(
                                                          'Accepter'),
                                                    ),
                                                  ]
                                                : <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          const Text('Exist'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'events')
                                                            .doc(events[index]
                                                                ["event_id"])
                                                            .update({
                                                          "participants": [uid]
                                                        });
                                                      },
                                                      child: const Text(
                                                          'Participer'),
                                                    ),
                                                  ],
                                          ));
                                  //// alertDialog + Home
                                  ///title : Text("demande de creation dune even")
                                  ///==> content: event details : titre , type , nom user , time date :
                                  ///
                                  ///2 buttons  ==> actions:[  button1(accept), button2(refu)]
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    height: MediaQuery.of(context).size.height *
                                        0.20,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 115, 161, 199),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: NetworkImage(testImage2),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 150,
                                              child: Text(
                                                  events[index]["event_name"]),
                                            ),
                                            Row(
                                              children: [
                                                Text("Date: "),
                                                Text(
                                                  events[index]["date"],
                                                ),
                                              ],
                                            ),
                                            Row(children: [
                                              Text("Time: "),
                                              Text(events[index]["time"])
                                            ]),
                                            Row(children: [
                                              Text("Les Participants: "),
                                              Text(events[index]["number"])
                                            ]),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    }),
              ],
            ))));
  }
}
