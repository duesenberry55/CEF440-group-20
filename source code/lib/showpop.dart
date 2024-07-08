import 'package:flutter/material.dart';

void showPopupMessage(BuildContext context, String title, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('$title: $msg'),
    ),
  );
}
