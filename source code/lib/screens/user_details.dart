import 'package:flutter/material.dart';
import 'package:g20dms/screens/user_dashboard.dart';
import '../auth_button.dart';
import '../custom_textfield.dart';

class UserDetailsScreen extends StatefulWidget {
  static const id = '/userdetails';

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _locationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      print('Name: ${_nameController.text}');
      print('Number: ${_numberController.text}');
      print('Location: ${_locationController.text}');
      Navigator.pushNamed(context, UserDashboardScreen.id, arguments: 'user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
        title: Text(
          'User',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  const Text(
                    'Enter Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30),
                  // Form
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Name TextField
                          CustomTextField(
                            label: 'Name',
                            hint: 'Value',
                            controller: _nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          // Number TextField
                          CustomTextField(
                            label: 'Number',
                            hint: 'Value',
                            controller: _numberController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          // Location TextField
                          CustomTextField(
                            label: 'Location',
                            hint: 'Value',
                            controller: _locationController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your location';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          // Submit Button
                          AuthButton(
                            text: 'Submit',
                            onPressed: _submitForm,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
