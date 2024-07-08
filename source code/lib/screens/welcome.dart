import 'package:flutter/material.dart';
import 'package:g20dms/custom_button.dart';
import 'package:g20dms/screens/select_user.dart';

class WelcomeScreen extends StatelessWidget {
  static const id = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              // Logo
              Image.asset(
                'assets/logo.png', // Add your logo asset path here
                height: 100,
              ),
              SizedBox(height: 50),
              // English Button
              CustomButton(
                text: 'ENGLISH',
                onPressed: () {
                  Navigator.pushNamed(context, SelectRoleScreen.id);
                },
              ),
              SizedBox(height: 20),
              // French Button
              CustomButton(
                text: 'FRENCH',
                onPressed: () {},
              ),

              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
