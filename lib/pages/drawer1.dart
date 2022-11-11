import 'package:ayush_hospitals/pages/about_us.dart';
import 'package:ayush_hospitals/pages/donation.dart';
import 'package:ayush_hospitals/pages/faqs.dart';
import 'package:ayush_hospitals/pages/loginPage.dart';
import 'package:ayush_hospitals/pages/my_map.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer1 extends StatefulWidget {
  const MyDrawer1({super.key});

  @override
  State<MyDrawer1> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer1> {
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
        children: [
          DrawerHeader(
            child: Column(children: [
                  
            ],),
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            '''Welcome \n$name''',
            style: const TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            email,
            style: const TextStyle(fontSize: 12, color: Colors.white),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 50,
          ),
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((value) => const MyMap())));
            },
            child: const Text(
              "Find Hospital",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((value) => const Faqs())));
            },
            child: const Text(
              "FAQs",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((value) => const AboutUs())));
            },
            child: const Text(
              "About Us",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((value) => const Donation())));
            },
            child: const Text(
              "Donation",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const Spacer(),
          InkWell(
              splashColor: Colors.transparent,
              onTap: () async {
                SharedPreferences pref =
                    await SharedPreferences.getInstance();
                await pref.remove('email');
                await pref.remove('name');
                await pref.clear();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((value) => const LoginPage())));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Logout",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Icon(
                    Icons.logout_rounded,
                    size: 30,
                    color: Colors.white,
                  )
                ],
              ))
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
