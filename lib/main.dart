import 'package:ayush_hospitals/Routes/routes.dart';
import 'package:ayush_hospitals/pages/drawer.dart';
import 'package:ayush_hospitals/widgets/gridItems.dart';
import 'package:ayush_hospitals/widgets/topInfo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/loginPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? login = prefs.getBool("login");

  runApp(MaterialApp(
    routes: Routes.route,
    restorationScopeId: "id",
    title: 'Ayush Hospitals',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.black,
    ),
    home: login == null
        ? const LoginPage()
        : const MyHomePage(title: 'Ayushman Hospitals'),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Ayushman Hospitals",
            style: TextStyle(
              fontStyle: FontStyle.italic,
            )),
        elevation: 0,
        backgroundColor: Colors.teal,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [TopInfo(), GridViewItems()]),
    );
  }
}
