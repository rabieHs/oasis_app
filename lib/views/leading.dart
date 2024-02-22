import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
                bottom: true,
                child: Container(
                  child: Text(
                    "Title",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )),
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
                      labelText: "search",
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                  )
                ],
              ),
            ),
            Text(
              "Title1",
              style: TextStyle(fontSize: 18),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      )),
            ),
            Text(
              "Title2",
              style: TextStyle(fontSize: 18),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      )),
            ),
          ],
        ),
      ),
    ));
  }
}
