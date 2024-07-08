import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:g20dms/auth_button.dart';
import 'package:g20dms/constants.dart';
import 'package:g20dms/custom_textfield.dart';
import 'package:g20dms/screens/user_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;

class RespondLoginScreen extends StatefulWidget {
  static const id = 'respondlogin';

  @override
  _RespondLoginScreenState createState() => _RespondLoginScreenState();
}

class _RespondLoginScreenState extends State<RespondLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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

  Future<void> _submitForm() async {
    
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = false;
      });
      // Handle form submission
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');

      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      final regBody = {
        'email': email,
        'password': password,
        'type': 'respond',
      };

      try {
        final response = await http.post(
          Uri.parse(login),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody),
        );

        print(response.body);

        final jsonResponse = jsonDecode(response.body);

        if (response.statusCode == 200) {
          final myToken = jsonResponse['token'];
          final user = jsonResponse['user'];

          final id = user['id'];
          final idNumber = user['idNumber'];
          final name = user['name'];
          final phone = user['phone'].toString();

          prefs.setString('id', id);
          prefs.setString('idNumber', idNumber);
          prefs.setString('email', email);
          prefs.setString('name', name);
          prefs.setString('token', myToken);
          prefs.setString('phone', phone.toString());
          prefs.setString('type', 'admin');

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Successfully Login as admin'),
            ),
          );

          Navigator.pushNamed(
            context,
            UserDashboardScreen.id,
            arguments: 'respond',
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
            'Responders',
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
                  // Login Title
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Subtitle
                  const Text(
                    'Enter your email and password to login',
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
                          label: 'email@domain.com',
                          hint: 'email@domain.com',
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
                          hint: 'password',
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        // Login Button
                        AuthButton(
                          text: 'Login',
                          onPressed: _submitForm,
                        ),
                        SizedBox(height: 20),
                        // Sign Up Link
                        Text.rich(
                          TextSpan(
                            text: 'Do not have an account? ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF003366),
                                  decoration: TextDecoration.underline,
                                ),
                                // Handle Sign Up link press
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, RespondLoginScreen.id);

                                    // Navigate to sign-up page
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
