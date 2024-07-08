// custom_button.dart

import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  AuthButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF003366), // Background color
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
