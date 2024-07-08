import 'package:flutter/material.dart';
import 'package:g20dms/custom_button.dart';
import 'package:g20dms/custom_textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:g20dms/showpop.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:g20dms/constants.dart'; // Make sure this has the 'alerts' endpoint

class SendContactScreen extends StatefulWidget {
  static const id = 'sendcontact';

  final String type;

  SendContactScreen({required this.type});

  @override
  _SendContactScreenState createState() => _SendContactScreenState();
}

class _SendContactScreenState extends State<SendContactScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool loading = false;

  Future<void> submitContact(BuildContext context) async {
    final String title = titleController.text;
    final String location = locationController.text;
    final String phone = phoneController.text;
    String type = widget.type; // Assuming the type is always 'alert'

    setState(() {
      loading = true;
    });

    final response = await http.post(
      Uri.parse(contactsUrl), // Replace with your actual endpoint
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'location': location,
        'phone': phone,
        'type': type,
      }),
    );

    if (response.statusCode == 201) {
      // Successfully posted the alert
      showPopupMessage(context, 'Success', 'Contact was uploaded successfully');
    } else {
      // Failed to post the alert
      showPopupMessage(context, 'Error', 'Unable to upload contact');
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF003366),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Send Contact',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                // Title TextField
                CustomTextField(
                  label: 'Title',
                  hint: '',
                  controller: titleController,
                ),
                SizedBox(height: 20),
                // Location TextField
                CustomTextField(
                  label: 'Location',
                  hint: 'eg Buea Town, Buea',
                  controller: locationController,
                ),
                SizedBox(height: 20),
                // Note TextField
                CustomTextField(
                  label: 'Phone',
                  hint: 'eg 670000000',
                  controller: phoneController,
                ),
                SizedBox(height: 30),
                // Send Button
                Center(
                  child: CustomButton(
                    text: 'Send',
                    onPressed: () {
                      submitContact(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
