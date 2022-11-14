import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'package:ayush_hospitals/main.dart';
import 'package:ayush_hospitals/pages/createAccountPage.dart';
import 'package:ayush_hospitals/utils/loginValidator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email = 'Email';
  String? pass = 'Password';
  String hintEmail = 'Email';
  String hintPass = 'Password';
  String nextButton = 'Next';
  bool bl = true;

  @override
  void initState() {
    getAppPermission();
    super.initState();
  }

  void getAppPermission() async {
    Location location = Location();
    PermissionStatus pStatus = await location.hasPermission();
    if (pStatus == PermissionStatus.denied ||
        pStatus == PermissionStatus.deniedForever) {
      location.requestPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 310,
                child: Image.asset("lib/assets/images/lock.png"),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: bl ? null : TextEditingController(text: ''),
                  onChanged: (value) {
                    email = value;
                    bl = true;
                    hintPass = 'Password';
                    hintEmail = 'Email';
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: bl ? Colors.grey : Colors.red),
                    fillColor: Colors.deepPurple,
                    hintText: hintEmail,
                    suffixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  obscureText: true,
                  controller: bl ? null : TextEditingController(text: ''),
                  onChanged: (value) {
                    pass = value;
                    bl = true;
                    hintPass = 'Password';
                    hintEmail = 'Email';
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: bl ? Colors.grey : Colors.red),
                    fillColor: Colors.deepPurple,
                    hintText: hintPass,
                    suffixIcon: const Icon(Icons.key),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100, left: 100),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    onPressed: () async {
                      await validation();
                      if (bl) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (value) =>
                                    const MyHomePage(title: 'Ayush Hospital')),
                            (route) => false);

                        setState(() {});
                      }
                    },
                    child: Text("Next")),
              ),
              const Center(
                child: SizedBox(
                  height: 20,
                  child: Text(
                    "OR",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100, left: 100),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const CreateAccountPage()),
                          ));
                    },
                    child: Text("Create Account")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> validation() async {
    bl = await LoginValidator().validate(pass!, email!);
    if (!bl) {
      hintEmail = 'something went wrong';
      hintPass = 'something went wrong';
    }
  }
}
