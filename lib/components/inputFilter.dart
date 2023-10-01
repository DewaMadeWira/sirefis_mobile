import 'package:flutter/material.dart';

class InputFilter extends StatelessWidget {
  InputFilter({super.key, required this.controller});
  TextEditingController controller;

  void dispose(){
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
    );
  }
}
