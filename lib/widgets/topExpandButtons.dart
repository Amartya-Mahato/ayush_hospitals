import 'package:flutter/material.dart';

import 'DropDownType.dart';
import 'dropDownDistrict.dart';
import 'dropDownState.dart';

class TopExpandButtons extends StatefulWidget {
  const TopExpandButtons({super.key, required this.sortedMarkerSet});
  final ValueChanged<List<String>> sortedMarkerSet;

  @override
  State<TopExpandButtons> createState() => _TopExpandButtonsState();
}

class _TopExpandButtonsState extends State<TopExpandButtons> {
  String? state;
  String? district;
  String? type;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionPanelList(
          elevation: 3,
          expansionCallback: (_, expended) {
            setState(() {
              isExpanded = !expended;
              if (state != null && district != null && type != null) {
                widget.sortedMarkerSet([state!, district!, type!]);
              }
            });
          },
          animationDuration: const Duration(milliseconds: 600),
          children: [
            ExpansionPanel(
              isExpanded: isExpanded,
              canTapOnHeader: true,
              backgroundColor: Colors.black,
              body: Column(
                children: [
                  DropDownState(
                    selectedState: ((value) {
                      setState(() {
                        state = value;
                        district = null;
                        type = null;
                      });
                    }),
                  ),
                  DropDownDistrict(
                      state: state,
                      selectedDistrict: ((value) {
                        setState(() {
                          district = value;
                          type = null;
                        });
                      })),
                  DropDownType(
                    district: district,
                    selectedType: ((value) {
                      setState(() {
                        type = value;
                      });
                    }),
                  )
                ],
              ),
              headerBuilder: (_, isExpanded) => Padding(
                padding: const EdgeInsets.only(left: 60),
                child: !isExpanded
                    ? const Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                      )
                    : Container(
                        alignment: Alignment.centerRight,
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.teal,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Center(
                          child: Text(
                            "Search",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
