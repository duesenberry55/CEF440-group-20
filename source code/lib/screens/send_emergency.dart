import 'package:flutter/material.dart';
import 'package:g20dms/constants.dart';
import 'package:g20dms/custom_button.dart';
import 'package:g20dms/custom_textfield.dart';
import 'package:g20dms/showpop.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SendEmergencyScreen extends StatefulWidget {
  static const id = 'sendemergency';

  @override
  State<SendEmergencyScreen> createState() => _SendEmergencyScreenState();
}

class _SendEmergencyScreenState extends State<SendEmergencyScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController incidentTypeController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  bool loading = false;

  Future<void> submitEmergency(context) async {
    final String title = nameController.text;
    final String location = locationController.text;
    final String phone = phoneController.text;
    const String type = "emergency"; // Assuming the type is always 'emergency'
    final String incidentType = incidentTypeController.text;
    final String note = descriptionController.text;

    setState(() {
      loading = true;
    });

    final response = await http.post(
      Uri.parse(alertsUrl), // Replace with your actual endpoint
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'phone': phone,
        'location': location,
        'type': type,
        'incidentType': incidentType,
        'note': note,
      }),
    );

    if (response.statusCode == 201) {
      // Successfully posted the contact
      showPopupMessage(
          context, 'Success', 'emergency was uploaded successfully');
    } else {
      // Failed to post the contact
      print('Failed to post contact');
      showPopupMessage(context, 'Error', 'unable to upload emergency');
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
            'Send Emergency',
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
                // Name TextField
                CustomTextField(
                  label: 'Name',
                  hint: 'eg Jon Doe',
                  controller: nameController,
                ),
                SizedBox(height: 20),
                // Location TextField
                CustomTextField(
                  label: 'Location',
                  hint: 'eg Buea Town, Buea',
                  controller: locationController,
                ),
                SizedBox(height: 20),
                // Phone TextField
                CustomTextField(
                  label: 'Phone',
                  hint: '+237670000000',
                  controller: phoneController,
                ),
                SizedBox(height: 20),
                // Incident Type TextField
                CustomTextField(
                  label: 'Incident type',
                  hint: 'eg Fire, Flood, Landslide etc',
                  controller: incidentTypeController,
                ),
                SizedBox(height: 20),
                // Description TextField
                CustomTextField(
                  label: 'Description',
                  hint: '',
                  controller: descriptionController,
                ),
                SizedBox(height: 30),
                // Send Button
                Center(
                  child: CustomButton(
                    text: 'Submit',
                    onPressed: () {
                      submitEmergency(context);
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
