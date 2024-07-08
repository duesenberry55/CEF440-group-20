import 'package:flutter/material.dart';
import 'package:g20dms/screens/admin_login.dart';
import 'package:g20dms/screens/admin_signup.dart';
import 'package:g20dms/screens/alerts.dart';
import 'package:g20dms/screens/contacts.dart';
import 'package:g20dms/screens/emergencies.dart';
import 'package:g20dms/screens/inboard.dart';
import 'package:g20dms/screens/respondent_login.dart';
import 'package:g20dms/screens/respondent_sigup.dart';
import 'package:g20dms/screens/select_user.dart';
import 'package:g20dms/screens/send_alert.dart';
import 'package:g20dms/screens/send_emergency.dart';
import 'package:g20dms/screens/send_report.dart';
import 'package:g20dms/screens/user_dashboard.dart';
import 'package:g20dms/screens/user_details.dart';
import 'package:g20dms/screens/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        OnboardScreen.id: (context) => OnboardScreen(),
        SelectRoleScreen.id: (context) => SelectRoleScreen(),
        UserDetailsScreen.id:(context) => UserDetailsScreen(),
        AdminSignUpScreen.id: (context) => AdminSignUpScreen(),
        AdminLoginScreen.id:(context) => AdminLoginScreen(),
        RespondSignUpScreen.id:(context) => RespondSignUpScreen(),
        RespondLoginScreen.id:(context) => RespondLoginScreen(),
        UserDashboardScreen.id:(context) => UserDashboardScreen(),
        AlertScreen.id:(context) => AlertScreen(),
        EmergencyScreen.id:(context) => EmergencyScreen(),
        ContactListingScreen.id:(context) => ContactListingScreen(),
        SendAlertsScreen.id:(context) => SendAlertsScreen(),
        SendEmergencyScreen.id:(context) => SendEmergencyScreen(),
        SendReportScreen.id:(context) => SendReportScreen(),
      },
      title: 'G20dms',
      debugShowCheckedModeBanner: false,
    );
  }
}
