import 'package:ayush_hospitals/utils/createAccountValidator.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  int currIdx = 0;

  String email = 'Email';
  bool hEmail = true;

  String pass = 'Password';
  bool hpass = true;

  String cnfpass = 'Confirm Password';
  bool hCnfPass = true;

  String name = 'Name';
  bool hName = true;

  String nextButton = 'Next';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    highlightColor: Colors.white,
                    splashColor: Colors.white,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const SizedBox(
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.keyboard_arrow_left_rounded,
                          size: 30,
                        )),
                  ),
                ],
              ),
              SizedBox(
                  height: 170,
                  child: Image.asset('lib/assets/images/computer.png')),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: hName ? null : TextEditingController(text: ''),
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(
                    hintStyle:
                        TextStyle(color: hName ? Colors.grey : Colors.red),
                    fillColor: Colors.deepPurple,
                    hintText: "Name",
                    suffixIcon: const Icon(Icons.person),
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
                  controller: hEmail ? null : TextEditingController(text: ''),
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    hintStyle:
                        TextStyle(color: hEmail ? Colors.grey : Colors.red),
                    fillColor: Colors.deepPurple,
                    hintText: email,
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
                  controller: hpass ? null : TextEditingController(text: ''),
                  onChanged: (value) {
                    pass = value;
                    hpass = true;
                  },
                  decoration: InputDecoration(
                    hintStyle:
                        TextStyle(color: hpass ? Colors.grey : Colors.red),
                    fillColor: Colors.deepPurple,
                    hintText: "Password",
                    suffixIcon: const Icon(Icons.key),
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
                  controller: hCnfPass ? null : TextEditingController(text: ''),
                  onChanged: (value) {
                    cnfpass = value;
                    hCnfPass = true;
                  },
                  decoration: InputDecoration(
                    hintStyle:
                        TextStyle(color: hCnfPass ? Colors.grey : Colors.red),
                    fillColor: Colors.deepPurple,
                    hintText: 'Confirm Password',
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
                      if (name == 'Name' ||
                          pass == 'Password' ||
                          email == 'Email' ||
                          cnfpass == 'Confirm Password') {
                        hpass = false;
                        hName = false;
                        hEmail = false;
                        hCnfPass = false;
                        setState(() {});
                        return;
                      }
                      if (pass != cnfpass ||
                          (pass == 'Password' ||
                              cnfpass == 'Confirm Password' ||
                              pass == '' ||
                              cnfpass == '')) {
                        hpass = false;
                        hCnfPass = false;
                        pass = 'Password';
                        cnfpass = 'Confirm Password';
                        setState(() {});
                        return;
                      }

                      if (name == 'Name' || name == '') {
                        name = 'Can not be empty';
                        hName = false;
                        setState(() {});
                        return;
                      }

                      if (email == 'Email' || email == '') {
                        email = 'Can not be empty';
                        hEmail = false;
                        setState(() {});
                        return;
                      }
                      await validation();
                      if (hEmail) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (value) =>
                                    const MyHomePage(title: 'Ayush Hospital')),
                            (route) => false);
                      } else {
                        email = 'Already present';
                      }

                      setState(() {});
                    },
                    child: Text("Next")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> validation() async {
    hEmail =
        await CreateAccountValidator().validateAndCreate(email, pass, name);
  }
}
