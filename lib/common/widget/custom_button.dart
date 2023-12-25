import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onClick;
  final String text;
  const CustomButton({required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        )
      ),
    );
  }
}
