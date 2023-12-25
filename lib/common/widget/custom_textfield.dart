import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String inputType;
  final int maxLines;

  const CustomTextField(
      {super.key, required this.hintText, required this.controller, this.inputType ='text', this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: inputType == 'password' ? TextInputType.visiblePassword : TextInputType.text ,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 65, 61, 61)))),
    );
  }
}
