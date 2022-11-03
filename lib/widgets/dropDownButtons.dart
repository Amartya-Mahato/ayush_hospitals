import 'package:ayush_hospitals/widgets/DropDownType.dart';
import 'package:ayush_hospitals/widgets/dropDownDistrict.dart';
import 'package:ayush_hospitals/widgets/dropDownState.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DropDownButtons extends StatefulWidget {
  const DropDownButtons({super.key, required this.sortedMarkerSet});
  final ValueChanged<List<LatLng>> sortedMarkerSet;

  @override
  State<DropDownButtons> createState() => _DropDownButtonsState();
}

class _DropDownButtonsState extends State<DropDownButtons> {
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
            height: expand ? 250 : 40,
            duration: const Duration(milliseconds: 300),
            child: Container(
              color: Color.fromARGB(255, 204, 0, 109).withOpacity(0.6),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      if (expand) {
                        if (state != null && district != null && type != null) {
                          getSortedMarkers(state!, district!, type!);
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
        : Future.delayed(const Duration(milliseconds: 300), () {
            buttons = buttons ? false : true;
            setState(() {});
          });
  }

  List<LatLng> getSortedMarkers(String state, String district, String type) {
    return [];
  }
}
