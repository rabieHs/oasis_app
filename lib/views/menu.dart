import 'package:flutter/material.dart';
import 'package:oasis_app/core/consts.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
