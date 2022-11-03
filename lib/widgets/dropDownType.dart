import 'package:flutter/material.dart';

class DropDownType extends StatefulWidget {
  const DropDownType(
      {super.key, required this.district, required this.selectedType});
  final ValueChanged<String?> selectedType;
  final String? district;

  @override
  State<DropDownType> createState() => _DropDownTypeState();
}

class _DropDownTypeState extends State<DropDownType> {
  String? _value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 7, bottom: 7),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 204, 0, 109), //background color of dropdown button
          border: Border.all(
              color: Colors.white,
              width: 3), //border of dropdown button
          borderRadius:
              BorderRadius.circular(10), //border raiuds of dropdown button
        ),
        child: Container(
          height: 50,
          width: 350,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: widget.district == null
                ? const Center(child: Text("Please Select District", style: TextStyle(color: Colors.white),))
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
                      "Select Type",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: _value,
                    onChanged: ((value) {
                      setState(() {
                        _value = value;
                        widget.selectedType(value);
                      });
                    }),
                    items: [
                      "Public",
                      "Private(For Profit)",
                      "Private(Not For Profit)",
                      "Not Mentioned"
                    ].map((names) {
                      return DropdownMenuItem<String?>(
                          value: names, child: Text(names));
                    }).toList()),
          ),
        ),
      ),
    );
  }
}
