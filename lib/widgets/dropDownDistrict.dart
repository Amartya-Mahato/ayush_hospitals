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
      padding: const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.3),
          border: Border.all(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: widget.state == null
              ? const SizedBox(
                height: 50,
                  child:  Center(
                    child: Text(
                      "Please Select Above",
                      style: TextStyle(color: Colors.white),
                    ),
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
                  dropdownColor: Colors.grey,
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
    );
  }
}
