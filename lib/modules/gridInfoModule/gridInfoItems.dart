import 'package:flutter/material.dart';

class GItem {
  GItem({required this.title, required this.image});
  String title;
  Image image;
}

class GItems {
  List<GItem> gItems = [];

  GItems() {
    populateGItems();
  }

  void populateGItems() {
    gItems.add(GItem(
        title: "Find Hospital",
        image: Image.asset(
          "lib/assets/images/hospital111.png",
          height: 100,
        )));
    gItems.add(GItem(
        title: "FAQs",
        image: Image.asset(
          "lib/assets/images/faq.png",
          height: 100,
        )));
    gItems.add(GItem(
        title: "About NHA",
        image: Image.asset(
          "lib/assets/images/about.png",
          height: 100,
        )));
    gItems.add(GItem(
        title: "Donation",
        image: Image.asset(
          "lib/assets/images/donation111.png",
          height: 100,
        )));
  }
}

class GridItems extends StatelessWidget {
  const GridItems({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, GItems().gItems[index].title);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: GItems().gItems[index].image,
          ),
          const Spacer(),
          Container(
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(17),
                    bottomRight: Radius.circular(17))),
            alignment: Alignment.center,
            // color: Colors.black,
            child: Text(
              GItems().gItems[index].title,
              style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
