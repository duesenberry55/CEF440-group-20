import 'package:flutter/material.dart';
import '../custom_button.dart'; // Import the custom button component

class OnboardScreen extends StatelessWidget {

  static const id = '/onboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.all(16),
              // decoration: BoxDecoration(
              //   border: Border.all(color: Color(0xFF003366), width: 2),
              //   borderRadius: BorderRadius.circular(10),
              // ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo
                  Image.asset(
                    'assets/logo.png', // Add your logo asset path here
                    height: 100,
                  ),
                  SizedBox(height: 20),
                  // Title
                  const Text(
                    'Empowering Communities, Saving Lives',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Description
                  const Text(
                    'Your Ultimate Solution for Comprehensive Disaster Preparedness, Timely Alerts, and Effective Response Strategies',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30),
                  // Get Started Button
                  CustomButton(
                    text: 'Get Started',
                    onPressed: () {
                      // Handle Get Started button press
                    },
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