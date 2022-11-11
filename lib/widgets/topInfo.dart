import 'package:ayush_hospitals/modules/topInfoModule/TItems.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TopInfo extends StatefulWidget {
  const TopInfo({super.key});

  @override
  State<TopInfo> createState() => _TopInfoState();
}

class _TopInfoState extends State<TopInfo> {
  int currIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CarouselSlider.builder(
                itemCount: TItems.tItems.length,
                itemBuilder: ((context, index, realIndex) {
                  return TopInfoItems(index: index);
                }),
                options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currIdx = index;
                    });
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                  width: 8,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currIdx == 0 ? Colors.black : Colors.grey),
                ),
                Container(
                  height: 8,
                  width: 8,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currIdx == 1 ? Colors.black : Colors.grey),
                ),
                Container(
                  height: 8,
                  width: 8,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currIdx == 2 ? Colors.black : Colors.grey),
                ),
                Container(
                  height: 8,
                  width: 8,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currIdx == 3 ? Colors.black : Colors.grey),
                ),
              ],
            )
          ],
        ));
  }
}
