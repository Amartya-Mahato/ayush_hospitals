import 'package:ayush_hospitals/pages/about_nha.dart';
import 'package:ayush_hospitals/pages/donation.dart';
import 'package:ayush_hospitals/pages/faqs.dart';
import 'package:ayush_hospitals/pages/loginPage.dart';
import 'package:ayush_hospitals/pages/my_map.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String name = 'Unknown';
  String email = 'Unknown';

  @override
  void initState() {
    getName();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.teal,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
      width: 250,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "lib/assets/images/appLogo.png",
                  height: 60,
                  width: 60,
                ),
                Text(
                  '''Welcome \n$name''',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  email,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.teal.shade700,
            ),
          ),
          ListTile(
              leading: const Icon(Icons.local_hospital_rounded),
              title: const Text(
                "Find Hospital",
                style: TextStyle(color: Colors.black54),
              ),
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((value) => const MyMap())));
              })),
          ListTile(
            leading: const Icon(Icons.question_answer_rounded),
            title: const Text(
              "FAQs",
              style: TextStyle(color: Colors.black54),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((value) => const Faqs())));
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_mark_rounded),
            title: const Text(
              "About NHA",
              style: TextStyle(color: Colors.black54),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((value) => const AboutNHA())));
            },
          ),
          ListTile(
            leading: const Icon(Icons.handshake_rounded),
            title: const Text(
              "Donation",
              style: TextStyle(color: Colors.black54),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((value) => const Donation())));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.black54),
            ),
            onTap: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              await pref.remove('email');
              await pref.remove('name');
              await pref.clear();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: ((value) => const LoginPage())),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }

  Future<String?> getN() async {
    String? str = await SharedPreferences.getInstance()
        .then((value) => value.getString('name'));
    return str;
  }

  Future<String?> getE() async {
    String? str = await SharedPreferences.getInstance()
        .then((value) => value.getString('email'));
    return str;
  }

  void getName() {
    getN().then((value) {
      name = value!;
      setState(() {});
    });

    getE().then((value) {
      email = value!;
      setState(() {});
    });
  }
}
