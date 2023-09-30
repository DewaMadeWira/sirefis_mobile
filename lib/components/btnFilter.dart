import 'package:flutter/material.dart';
import 'package:sirefis_mobile/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BtnFilter extends StatelessWidget {
  final String text;
  const BtnFilter({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 10,
        ),
      ),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          backgroundColor: backgroundColor,
          foregroundColor: Colors.black,
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
    );
  }
}
