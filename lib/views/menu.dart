import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oasis_app/core/consts.dart';
import 'package:oasis_app/models/menu_model.dart';
import 'package:oasis_app/views/add_categories.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DropdownMenuApp()));
          // navigate to  add menu page
          //add menu page content:
          /// category drop down menu {coffee, wtaer , food }
          /// name
          /// price
          /// add button
          ///
          /// add event
          /// event name:
          /// number places
          /// date time
          /// type {wedding , party ...} drop dow, menu
          /// add button
          ///
          ///
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
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
                    child: const Center(
                        child: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
                  ),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Our Menu",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              GridView.builder(
                  padding: EdgeInsets.only(top: 20),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220,
                      childAspectRatio: 1,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 5),
                  itemCount: menuList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor:
                                      Color.fromARGB(255, 243, 233, 141),
                                  title: Text(
                                    menuList[index].title,
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Container(
                                    height: 500,
                                    width: 400,
                                    child: FutureBuilder(
                                        future: FirebaseFirestore.instance
                                            .collection('menu')
                                            .where("categorie",
                                                isEqualTo:
                                                    menuList[index].title)
                                            .get(),
                                        builder: (context, resultat) {
                                          if (resultat.hasError) {
                                            return Center(
                                              child: Text("error"),
                                            );
                                          }
                                          if (resultat.data == null) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          } else {
                                            final List<Map> menu =
                                                resultat.data!.docs.map((doc) {
                                              return doc.data();
                                            }).toList();
                                            return ListView.builder(
                                                itemCount: menu.length,
                                                itemBuilder: (context, index) {
                                                  return ListTile(
                                                    leading: Icon(Icons
                                                        .attach_money_outlined),
                                                    title: Text(
                                                        menu[index]["article"]),
                                                    trailing: Text(
                                                        "${menu[index]["prix"]} DT"),
                                                  );
                                                });
                                          }
                                        }),

                                    /*  ListView(
                                      shrinkWrap: true,
                                      children: [
                                        
                                        ListTile(
                                          leading: Icon(Icons.coffee),
                                          title: Text("American"),
                                          trailing: Text("1.5 DT"),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.coffee),
                                          title: Text("American"),
                                          trailing: Text("1.5 DT"),
                                        )
                                      ],
                                    ), */
                                  ),
                                );
                              });
                        },
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            decoration: BoxDecoration(
                              color:
                                  primaryColors, //Color.fromARGB(255, 115, 161, 199),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  menuList[index].image,
                                  width: 80,
                                ),
                                Text(
                                  menuList[index].title,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            )),
                      ),
                    );
                  })
              /*   GridView.builder(
                padding: EdgeInsets.only(top: 20),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    childAspectRatio: 1,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor:
                                  Color.fromARGB(255, 243, 233, 141),
                              title: Text(
                                "café",
                                textAlign: TextAlign.center,
                              ),
                              content: Container(
                                height: 500,
                                width: 400,
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    ListTile(
                                      leading: Icon(Icons.coffee),
                                      title: Text("American"),
                                      trailing: Text("1.5 DT"),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.coffee),
                                      title: Text("American"),
                                      trailing: Text("1.5 DT"),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.coffee),
                                      title: Text("American"),
                                      trailing: Text("1.5 DT"),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 115, 161, 199),
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                              image: NetworkImage(
                                image4,
                              ),
                              fit: BoxFit.cover),
                        ),
                        child: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white.withOpacity(0.5),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Pizza",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
