import 'package:flutter/material.dart';
import 'package:g20dms/custom_button.dart';
import 'package:g20dms/custom_textfield.dart';

class SendReportScreen extends StatelessWidget {
  static const id = 'sendreport';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          // padding: EdgeInsets.all(0),
        ),
        title: const Text(
          'Send Report',
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
                controller: TextEditingController(),
              ),
              SizedBox(height: 20),
              // Location TextField
              CustomTextField(
                label: 'Location',
                hint: 'eg Buea Town, Buea',
                controller: TextEditingController(),
              ),
              SizedBox(height: 20),
              // Incident Type TextField
              CustomTextField(
                label: 'Incident type',
                hint: 'eg Fire, Flood, Landslide etc',
                controller: TextEditingController(),
              ),
              SizedBox(height: 20),
              // Note TextField
              CustomTextField(
                label: 'Note',
                hint: '',
                controller: TextEditingController(),
              ),
              SizedBox(height: 20),
              // File Upload Section
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: 'Upload document',
                      hint: 'Document name',
                      controller: TextEditingController(),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle file selection
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF003366),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Select file',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              // Submit Button
              Center(
                child: CustomButton(
                  text: 'Submit',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Unavailable'),
                          content: Text('This feature is not yet avaiblable🥲'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                    // Handle Submit button press
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
