import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oasis_app/core/consts.dart';
import 'package:oasis_app/views/my_events.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  IconData? get iconData => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 78,
              backgroundImage: NetworkImage(user),
            ),
            const SizedBox(height: 20),
            itemProfile("Nom", "nawras sebti", CupertinoIcons.person),
            SizedBox(width: 20, height: 20),
            itemProfile("Email", "nawrasSebti@gmail.com", CupertinoIcons.mail),
            SizedBox(width: 20, height: 20),
            itemProfile("Téléphone", "25857421", CupertinoIcons.phone),
            SizedBox(width: 20, height: 20),
            itemProfile("mes points", "4", CupertinoIcons.add),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => my_events()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text(
                  "Mes Evénements",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text(
                  "Déconnexion",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: const Text("title"),
        subtitle: const Text("subtitle"),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey),
        tileColor: Colors.white,
      ),
    );
  }
}
