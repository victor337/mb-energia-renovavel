import 'package:flutter/material.dart';


class DropDown extends StatelessWidget {

  final String title;
  final List<String> options;
  final Function(String) onChanged;
  final String value;
  
  const DropDown({
    @required this.title,
    @required this.options,
    @required this.onChanged,
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            dropdownColor: Colors.white,
            isDense: true,
            underline: Visibility(visible: false, child: Container()),
            items: options.map((String dropDownStringItem){
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem),
              );
            }).toList(),
            onChanged: onChanged,
            value: value,
          ),
        ),
      ],
    );
  }
}