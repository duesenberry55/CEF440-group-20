import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:g20dms/auth_button.dart';
import 'package:g20dms/constants.dart';
import 'package:g20dms/custom_textfield.dart';
import 'package:g20dms/screens/admin_login.dart';
import 'package:g20dms/screens/user_dashboard.dart';
// import 'package:g20dms/showpop.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AdminSignUpScreen extends StatefulWidget {
  static const id = 'adminsignup';

  @override
  _AdminSignUpScreenState createState() => _AdminSignUpScreenState();
}

class _AdminSignUpScreenState extends State<AdminSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _idNumberController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  late SharedPreferences prefs;
  bool loading = false;

  @override
  void initState() {
    initSharedPref();
    super.initState();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _idNumberController.dispose();
    _mobileNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = false;
      });
      // Handle form submission
      print('First Name: ${_firstNameController.text}');
      print('Last Name: ${_lastNameController.text}');
      print('ID Number: ${_idNumberController.text}');
      print('Mobile Number: ${_mobileNumberController.text}');
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');

      final name =
          '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}';
      final idNumber = _idNumberController.text.trim();
      final phone = _mobileNumberController.text.trim();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      final regBody = {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone.toString(),
        'idNumber': idNumber,
        'type': 'admin',
      };

      try {
        final response = await http.post(
          Uri.parse(registration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody),
        );

        print(response.body);

        final jsonResponse = jsonDecode(response.body);

        if (response.statusCode == 200) {
          final myToken = jsonResponse['token'];
          final id = jsonResponse['id'];

          prefs.setString('id', id);
          prefs.setString('idNumber', idNumber);
          prefs.setString('email', email);
          prefs.setString('name', name);
          prefs.setString('token', myToken);
          prefs.setString('phone', phone.toString());

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Successfully created account as admin'),
            ),
          );

          Navigator.pushNamed(
            context,
            UserDashboardScreen.id,
            arguments: 'admin',
          );
        } else {
          String title = 'Error';
          String msg = jsonResponse['message'] ?? '';

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$title: $msg'),
            ),
          );
          // showPopupMessage(context, title, msg);
        }
      } catch (e) {
        print(e);
      }
    setState(() {
      loading = false;
    });
    }

  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Handle back button press
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Authorities',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo
                  Image.asset(
                    'assets/logo.png', // Add your logo asset path here
                    height: 100,
                  ),
                  SizedBox(height: 20),
                  // Sign Up Title
                  const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Subtitle
                  const Text(
                    'Enter the information below to create an account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 30),
                  // Form
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextField(
                          label: 'First Name',
                          hint: 'Value',
                          controller: _firstNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          label: 'Last Name',
                          hint: 'Value',
                          controller: _lastNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          label: 'ID number',
                          hint: 'Value',
                          controller: _idNumberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your ID number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          label: 'Mobile Number',
                          hint: 'Value',
                          controller: _mobileNumberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your mobile number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          label: 'email',
                          hint: 'Value',
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          label: 'password',
                          hint: 'Value',
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          label: 'Confirm password',
                          hint: 'Value',
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        // Terms and Privacy Policy
                        const Text(
                          'By clicking continue, you agree to our Terms of Service and Privacy Policy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 20),
                        // Sign Up Button
                        AuthButton(
                          text: 'Sign up',
                          onPressed: _submitForm,
                        ),
                        SizedBox(height: 20),
                        // Login Link
                        Text.rich(
                          TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            children: [
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF003366),
                                  decoration: TextDecoration.underline,
                                ),
                                // Handle Login link press
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigate to login page
                                    Navigator.pushNamed(
                                        context, AdminLoginScreen.id);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
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
