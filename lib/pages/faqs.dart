import 'package:ayush_hospitals/modules/faqsItems/faqs_items.dart';
import 'package:flutter/material.dart';

class Faqs extends StatefulWidget {
  const Faqs({super.key});

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( backgroundColor: Colors.teal, title: const Text("FAQs", style: TextStyle(fontStyle: FontStyle.italic),), elevation: 0,),
        body: SingleChildScrollView(
          child: ExpansionPanelList(
              elevation: 3,
              expansionCallback: (index, isExpanded) {
                setState(() {
                  FaqsItems.faqItems[index]['isExpanded'] = !isExpanded;
                });
              },
              animationDuration: const Duration(milliseconds: 600),
              children: FaqsItems.faqItems
                  .map(
                    (item) => ExpansionPanel(
                      canTapOnHeader: true,
                      backgroundColor: item['isExpanded'] == true
                          ? Colors.teal.shade100
                          : Colors.white,
                      headerBuilder: (_, isExpanded) => Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Text(
                          item['title'],
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                        ),
                      ),
                      body: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Text(item['description']),
                      ),
                      isExpanded: item['isExpanded'],
                    ),
                  )
                  .toList()),
        ));
  }
}
