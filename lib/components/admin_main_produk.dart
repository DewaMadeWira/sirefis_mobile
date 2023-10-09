import 'package:flutter/material.dart';

class Kotak extends StatelessWidget {
  final String child;

  Kotak({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.blue[200],
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(6, 9),
              spreadRadius: 0,
              blurRadius: 9.0,
            ),
          ],
        ),
        height: 200,

        // child: Text(child),
        child: Center(
            child: Text(
          child,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
