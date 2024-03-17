import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/consts.dart';

class my_events extends StatelessWidget {
  my_events({Key? key}) : super(key: key);
  final uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Mes Evénements",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromARGB(255, 179, 96, 2)),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.event_note),
                text: "mon propre evenements",
              ),
              Tab(
                icon: Icon(Icons.event_note_outlined),
                text: "evenements que j'ai participer",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('events')
                    .where("user_id", isEqualTo: uid)
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
                                                Text("nom de l'utilisateur: "),
                                                Text(
                                                    events[index]["user-name"]),
                                              ],
                                            ),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Exist'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              FirebaseFirestore.instance
                                                  .collection('events')
                                                  .doc(
                                                      events[index]["event_id"])
                                                  .delete();
                                            },
                                            child: const Text('supprimer'),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 115, 161, 199),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
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
                                          child:
                                              Text(events[index]["event_name"]),
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
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('events')
                    .where("participants", arrayContains: uid)
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
                                                Text("nom de l'utilisateur: "),
                                                Text(
                                                    events[index]["user-name"]),
                                              ],
                                            ),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Exist'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              FirebaseFirestore.instance
                                                  .collection('events')
                                                  .doc(
                                                      events[index]["event_id"])
                                                  .delete();
                                            },
                                            child: const Text('supprimer'),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 115, 161, 199),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
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
                                          child:
                                              Text(events[index]["event_name"]),
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
        ),
      ),
    );
  }
}
