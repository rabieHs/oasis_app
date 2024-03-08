import 'package:flutter/material.dart';
import '../core/consts.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
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
                ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          height: MediaQuery.of(context).size.height * 0.20,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 115, 161, 199),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text("title"),
                                  ),
                                  Text("location"),
                                  Text("date"),
                                  Text("N° participants"),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ))));
  }
}
