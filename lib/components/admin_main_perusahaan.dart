import 'package:flutter/material.dart';

class Bulat extends StatelessWidget {
  final String child;

  Bulat({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.indigo[300],
        ),
        // child: Text(child),
        child: Center(child: Text(child)),
      ),
    );
  }
}
