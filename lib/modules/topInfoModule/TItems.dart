import 'package:flutter/material.dart';

class TItems {
  static List<Image> tItems = [
    Image.asset("lib/assets/images/admit.png"),
    Image.asset("lib/assets/images/beds.png"),
    Image.asset("lib/assets/images/ECard.png"),
    Image.asset("lib/assets/images/empanelled_hospitals.png"),
  ];
}

class TopInfoItems extends StatelessWidget {
  const TopInfoItems({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: TItems.tItems[index].image,
            ),
            border: Border.all(color: Colors.black, width: 4),
            // color: Colors.red,
            borderRadius: const BorderRadius.all(Radius.circular(17))),
      ),
    );
  }
}
