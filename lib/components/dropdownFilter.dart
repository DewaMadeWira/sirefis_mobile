import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors.dart';

class DropDownFilter extends StatefulWidget {
  DropDownFilter(
      {super.key,
      required this.item,
      required this.itemList,
      required this.onChange});
  String item;
  Function onChange;
  final List<String> itemList;

  @override
  State<DropDownFilter> createState() => _DropDownFilterState();
}

class _DropDownFilterState extends State<DropDownFilter> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: backgroundColor,
      style: GoogleFonts.inter(fontSize: 14, color: Colors.black),
      // padding: EdgeInsets.all(1),
      items: widget.itemList.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (String? newValue) {
        widget.onChange(newValue);
      },
      value: widget.item,
      // icon: Icon(Icons.arrow_drop_down),
    );
  }
}
