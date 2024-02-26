import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:oasis_app/views/events.dart';
import 'package:oasis_app/views/leading.dart';
import 'package:oasis_app/views/menu.dart';
import 'package:oasis_app/views/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  List<Widget> screens = [
    const Leading(),
    const Menu(),
    const Events(),
    const Profile()
  ];

  updateScreen(int _index) {
    setState(() {
      index = _index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: GNav(
          style: GnavStyle.google,
          onTabChange: updateScreen,
          selectedIndex: index,
          color: Colors.grey,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.lightBlue,
          gap: 8,
          padding: const EdgeInsets.all(16),
          tabs: const [
            GButton(textColor: Colors.white, icon: Icons.home, text: "Home"),
            GButton(icon: Icons.coffee, text: "Menu"),
            GButton(icon: Icons.event, text: "Events"),
            GButton(icon: Icons.person, text: "Profile"),
          ],
        ),
      ),
      body: screens[index],
    );
  }
}
