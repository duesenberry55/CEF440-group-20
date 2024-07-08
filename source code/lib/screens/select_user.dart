import 'package:flutter/material.dart';
import 'package:g20dms/custom_button.dart';
import 'package:g20dms/screens/admin_signup.dart';
import 'package:g20dms/screens/respondent_sigup.dart';
import 'package:g20dms/screens/user_details.dart';

class SelectRoleScreen extends StatelessWidget {
  static const id = '/select';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button press
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title
                const Text(
                  'SELECT YOUR ROLE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                // User Button
                CustomButton(
                  text: 'USER',
                  onPressed: () {
                    // Handle User button press
                    Navigator.pushNamed(context, UserDetailsScreen.id);
                  },
                ),
                SizedBox(height: 20),
                // Authority Button
                CustomButton(
                  text: 'AUTHORITY',
                  onPressed: () {
                    // Handle Authority button press
                    Navigator.pushNamed(context, AdminSignUpScreen.id);
                  },
                ),
                SizedBox(height: 20),
                // Respondent Button
                CustomButton(
                  text: 'RESPONDENT',
                  onPressed: () {
                    // Handle Respondent button press
                    Navigator.pushNamed(context, RespondSignUpScreen.id);

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
