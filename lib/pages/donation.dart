import 'package:ayush_hospitals/modules/scans/scans.dart';
import 'package:flutter/material.dart';

class Donation extends StatefulWidget {
  const Donation({super.key});

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text("Donation"),
      ),
      body: PageView.builder(
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
          itemCount: 4,
          onPageChanged: ((value) {
            setState(() {});
          }),
          itemBuilder: ((context, index) => Container(
            color: Colors.white,
            alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                        height: 300, width: 300, child: Scans.images[index]),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Page No. ${index+1}',
                      style: const TextStyle(fontSize: 30),
                    )
                  ],
                ),
              ))),
    );
  }
}
