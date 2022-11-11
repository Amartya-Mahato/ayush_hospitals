import 'package:ayush_hospitals/modules/gridInfoModule/gridInfoItems.dart';
import 'package:flutter/material.dart';

class GridViewItems extends StatelessWidget {
  const GridViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
            itemBuilder: ((context, index) {
              return Container(
                decoration: BoxDecoration(
                  
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 3),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: GridItems(index: index),
              );
            })),
      ),
    );
  }
}
