import 'package:flutter/material.dart';
import 'package:sirefis_mobile/filter.dart';
import 'package:sirefis_mobile/home.dart';
import 'package:sirefis_mobile/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/': (context) => Home()},
      title: 'SIREFIS',
      theme: ThemeData(),
    );
  }
}
