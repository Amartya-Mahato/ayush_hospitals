import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:ayush_hospitals/widgets/DropDownType.dart';
import 'package:ayush_hospitals/widgets/dropDownDistrict.dart';
import 'package:ayush_hospitals/widgets/dropDownState.dart';

class DropDownButtons extends StatefulWidget {
  const DropDownButtons({
    Key? key,
    required this.sortedMarkerSet,
  }) : super(key: key);
  final ValueChanged<List<String>> sortedMarkerSet;

  @override
  State<DropDownButtons> createState() => _DropDownButtonsState();
}

class _DropDownButtonsState extends State<DropDownButtons> {
  List<LatLng> sortedMarkerLatLng = [];
  String? state;
  String? district;
  String? type;

  bool expand = false;
  bool buttons = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedContainer(
            height: expand ? 300 : 35,
            duration: const Duration(milliseconds: 50),
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      if (expand) {
                        if (state != null && district != null && type != null) {
                          setState(() {
                            widget.sortedMarkerSet([state!, district!, type!]);
                          });
                        }
                        state = null;
                        district = null;
                        type = null;
                      }
                      expand = expand ? false : true;
                      expanding();
                      setState(() {});
                    },
                    child: expand
                        ? const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Center(
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Center(
                              child: Icon(
                                Icons.filter_list_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ),
                  if (buttons)
                    DropDownState(
                      selectedState: ((value) {
                        setState(() {
                          state = value;
                          district = null;
                          type = null;
                        });
                      }),
                    ),
                  if (buttons)
                    DropDownDistrict(
                        state: state,
                        selectedDistrict: ((value) {
                          setState(() {
                            district = value;
                            type = null;
                          });
                        })),
                  if (buttons)
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
            )),
      ],
    );
  }

  void expanding() async {
    buttons
        ? buttons = buttons ? false : true
        : Future.delayed(const Duration(milliseconds: 70), () {
            buttons = buttons ? false : true;
            setState(() {});
          });
  }
}
