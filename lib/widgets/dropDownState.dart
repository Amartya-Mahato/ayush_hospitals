import 'package:flutter/material.dart';
import '../modules/dropDownItems/state_Items.dart';

class DropDownState extends StatefulWidget {
  const DropDownState({super.key, required this.selectedState});

  final ValueChanged<String?> selectedState;

  @override
  State<DropDownState> createState() => _DropDownStateState();
}

class _DropDownStateState extends State<DropDownState> {
  String? _value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 7),
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
            child: DropdownButton(
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
                  "Select State",
                  style: TextStyle(color: Colors.white),
                ),
                
                onChanged: ((value) {
                  setState(() {
                    _value = value;
                  });
                  widget.selectedState(value);
                  
                }),
                value: _value,
                items: StateItems.states.map((names) {
                  return DropdownMenuItem<String?>(
                      value: names, child: Text(names));
                }).toList()),
          ),
        ),
      ),
    );
  }
}
