import 'package:ayush_hospitals/pages/my_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: "id",
      title: 'Ayush Hospitals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Ayush Hospitals'),
    );
  }
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
      appBar: AppBar(
        title: const Text("Ayush Hospitals"),
        elevation: 1,
        backgroundColor: Color.fromARGB(255, 204, 0, 109),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
      ),
      body: const MyMap(),
    );
  }
}
