import 'package:ayush_hospitals/modules/dropDownItems/districts_Item.dart';
import 'package:flutter/material.dart';

class DropDownDistrict extends StatefulWidget {
  DropDownDistrict({
    super.key,
    required this.state,
    required this.selectedDistrict,
  });
  String? state;
  final ValueChanged<String?> selectedDistrict;

  @override
  State<DropDownDistrict> createState() => _DropDownDistrictState();
}

class _DropDownDistrictState extends State<DropDownDistrict> {
  String? values;
  String? saveState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 7, bottom: 7),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 204, 0, 109),
          border: Border.all(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 50,
          width: 350,
          // color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: widget.state == null
                ? const Center(
                    child: Text(
                      "Please Select State",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : DropdownButton(
                    underline: Container(),
                    isExpanded: true,
                    iconSize: 30,
                    icon: const Icon(
                      Icons.arrow_drop_up_rounded,
                      color: Colors.white,
                    ),
                    dropdownColor: Color.fromARGB(255, 232, 0, 124),
                    style: const TextStyle(color: Colors.white),
                    hint: const Text(
                      "Select District",
                      style: TextStyle(color: Colors.white),
                    ),
                    onChanged: ((value) {
                      setState(() {
                        values = value;
                        saveState = widget.state;
                        widget.selectedDistrict(value);
                      });
                    }),
                    value: widget.state != saveState ? null : values,
                    items: DistrictItem.ofState(widget.state!).map((names) {
                      return DropdownMenuItem<String?>(
                          value: names, child: Text(names));
                    }).toList()),
          ),
        ),
      ),
    );
  }
}
