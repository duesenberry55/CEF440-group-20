// custom_textfield.dart

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? isSearch;

  CustomTextField({
    required this.label,
    required this.hint,
    this.controller,
    this.validator,
    this.isSearch,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: (isSearch??false)?Icon(Icons.search):null,
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
      ),
      validator: validator,
    );
  }
}
