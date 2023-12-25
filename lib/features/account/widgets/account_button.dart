import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final String text;
  final VoidCallback voidCallback;
  const AccountButton({required this.text, required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.white, width: 0.0),
      //   borderRadius: BorderRadius.circular(50),
      //   color: Colors.white,
      // ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
         side: BorderSide(
          color: Colors.black12.withOpacity(0.30)
         )
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.normal, color: Colors.black),
        ),
        onPressed: voidCallback,
      ),
    );
  }
}
