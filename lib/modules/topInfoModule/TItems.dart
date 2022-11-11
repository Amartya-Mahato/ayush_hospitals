import 'dart:ui';

import 'package:flutter/material.dart';

class TItems {
  static List<Image> tItems = [
    Image.asset("lib/assets/images/hospital2.png"),
    Image.asset("lib/assets/images/hospital2.png"),
    Image.asset("lib/assets/images/hospital2.png"),
    Image.asset("lib/assets/images/hospital2.png"),
  ];
}

class TopInfoItems extends StatelessWidget {
  const TopInfoItems({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 4),
            color: Colors.red,
            borderRadius: const BorderRadius.all(Radius.circular(17))),
        child: SizedBox(height: 200, width: 500, child: TItems.tItems[index]),
      ),
    );
  }
}
