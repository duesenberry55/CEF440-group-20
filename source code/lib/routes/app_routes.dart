import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../presentation/alerts_screen/alerts_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/authorities_contact_teams_screen/authorities_contact_teams_screen.dart';
import '../presentation/authorities_log_in_screen/authorities_log_in_screen.dart';
import '../presentation/authorities_screen/authorities_screen.dart';
import '../presentation/authorities_sign_up_screen/authorities_sign_up_screen.dart';
import '../presentation/contacts_ambulance_screen/contacts_ambulance_screen.dart';
import '../presentation/contacts_fire_rescue_screen/contacts_fire_rescue_screen.dart';
import '../presentation/contacts_hospital_screen/contacts_hospital_screen.dart';
import '../presentation/contacts_police_screen/contacts_police_screen.dart';
import '../presentation/emergency_prep_screen/emergency_prep_screen.dart';
import '../presentation/first_aid_tips_screen/first_aid_tips_screen.dart';
import '../presentation/g20dms_screen/g20dms_screen.dart';
import '../presentation/news_screen/news_screen.dart';
import '../presentation/report_status_screen/report_status_screen.dart';
import '../presentation/reports_screen/reports_screen.dart';
import '../presentation/respondents_contact_teams_screen/respondents_contact_teams_screen.dart';
import '../presentation/respondents_log_in_screen/respondents_log_in_screen.dart';
import '../presentation/respondents_screen/respondents_screen.dart';
import '../presentation/respondents_sign_up_screen/respondents_sign_up_screen.dart';
import '../presentation/safety_tips_screen/safety_tips_screen.dart';
import '../presentation/send_alert_screen/send_alert_screen.dart';
import '../presentation/send_directives_screen/send_directives_screen.dart';
import '../presentation/send_report_screen/send_report_screen.dart';
import '../presentation/user_alerts_screen/user_alerts_screen.dart';
import '../presentation/user_screen/user_screen.dart';
import '../presentation/user_status_and_location_screen/user_status_and_location_screen.dart';
import '../presentation/welcome_screen/welcome_screen.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String alertsScreen = '/alerts_screen';

  static const String userStatusAndLocationScreen =
      '/user_status_and_location_screen';

  static const String respondentsContactTeamsScreen =
      '/respondents_contact_teams_screen';

  static const String sendReportScreen = '/send_report_screen';

  static const String reportsScreen = '/reports_screen';

  static const String respondentsLogInScreen = '/respondents_log_in_screen';

  static const String respondentsScreen = '/respondents_screen';

  static const String g20dmsScreen = '/g20dms_screen';

  static const String welcomeScreen = '/welcome_screen';

  static const String authoritiesContactTeamsScreen =
      '/authorities_contact_teams_screen';

  static const String authoritiesLogInScreen = '/authorities_log_in_screen';

  static const String authoritiesScreen = '/authorities_screen';

  static const String respondentsSignUpScreen = '/respondents_sign_up_screen';

  static const String sendAlertScreen = '/send_alert_screen';

  static const String authoritiesSignUpScreen = '/authorities_sign_up_screen';

  static const String userScreen = '/user_screen';

  static const String sendDirectivesScreen = '/send_directives_screen';

  static const String contactsAmbulanceScreen = '/contacts_ambulance_screen';

  static const String contactsFireRescueScreen = '/contacts_fire_rescue_screen';

  static const String contactsHospitalScreen = '/contacts_hospital_screen';

  static const String contactsPoliceScreen = '/contacts_police_screen';

  static const String userAlertsScreen = '/user_alerts_screen';

  static const String safetyTipsScreen = '/safety_tips_screen';

  static const String firstAidTipsScreen = '/first_aid_tips_screen';

  static const String newsScreen = '/news_screen';

  static const String emergencyPrepScreen = '/emergency_prep_screen';

  static const String reportStatusScreen = '/report_status_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    alertsScreen: (context) => AlertsScreen(),
    userStatusAndLocationScreen: (context) => UserStatusAndLocationScreen(),
    respondentsContactTeamsScreen: (context) => RespondentsContactTeamsScreen(),
    sendReportScreen: (context) => SendReportScreen(),
    reportsScreen: (context) => ReportsScreen(),
    respondentsLogInScreen: (context) => RespondentsLogInScreen(),
    respondentsScreen: (context) => RespondentsScreen(),
    g20dmsScreen: (context) => G20dmsScreen(),
    welcomeScreen: (context) => WelcomeScreen(),
    authoritiesContactTeamsScreen: (context) => AuthoritiesContactTeamsScreen(),
    authoritiesLogInScreen: (context) => AuthoritiesLogInScreen(),
    authoritiesScreen: (context) => AuthoritiesScreen(),
    respondentsSignUpScreen: (context) => RespondentsSignUpScreen(),
    sendAlertScreen: (context) => SendAlertScreen(),
    authoritiesSignUpScreen: (context) => AuthoritiesSignUpScreen(),
    userScreen: (context) => UserScreen(),
    sendDirectivesScreen: (context) => SendDirectivesScreen(),
    contactsAmbulanceScreen: (context) => ContactsAmbulanceScreen(),
    contactsFireRescueScreen: (context) => ContactsFireRescueScreen(),
    contactsHospitalScreen: (context) => ContactsHospitalScreen(),
    contactsPoliceScreen: (context) => ContactsPoliceScreen(),
    userAlertsScreen: (context) => UserAlertsScreen(),
    safetyTipsScreen: (context) => SafetyTipsScreen(),
    firstAidTipsScreen: (context) => FirstAidTipsScreen(),
    newsScreen: (context) => NewsScreen(),
    emergencyPrepScreen: (context) => EmergencyPrepScreen(),
    reportStatusScreen: (context) => ReportStatusScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => G20dmsScreen()
  };
}
