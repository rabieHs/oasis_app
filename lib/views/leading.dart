import 'package:flutter/material.dart';

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
                text: TextSpan(
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
                        margin: EdgeInsets.only(right: 5, top: 5, bottom: 5),
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
                          borderSide: BorderSide(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
            Text(
              "Our Place",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
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
                              image: DecorationImage(
                                  image: NetworkImage(
                                    testImage,
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      )),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Our Recent Events",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
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
                        image: DecorationImage(
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
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white.withOpacity(0.5),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Wedding",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
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
