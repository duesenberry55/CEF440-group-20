import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: AppDecoration.fillOnPrimary,
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: " alerts ",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.alertsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "user status and location",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.userStatusAndLocationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "respondents_contact_ teams",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.respondentsContactTeamsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "SEND REPORT",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.sendReportScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "reports",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.reportsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "respondents_log_In",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.respondentsLogInScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "RESPONDENTS",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.respondentsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "g20dms",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.g20dmsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "WELCOME",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.welcomeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "authorities_contact_teams",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.authoritiesContactTeamsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "authorities_log_in",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.authoritiesLogInScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "AUTHORITIES",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.authoritiesScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "respondents_sign_up",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.respondentsSignUpScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "SEND ALERT",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.sendAlertScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "authorities _sign_up",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.authoritiesSignUpScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "USER",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.userScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "SEND DIRECTIVES",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.sendDirectivesScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "contacts_ambulance ",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.contactsAmbulanceScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "contacts_fire rescue ",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.contactsFireRescueScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "contacts_hospital ",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.contactsHospitalScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "contacts_police ",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.contactsPoliceScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: " user_alerts ",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.userAlertsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "safety tips",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.safetyTipsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "first aid tips",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.firstAidTipsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "NEWS",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.newsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "EMERGENCY PREP",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.emergencyPrepScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "REPORT STATUS",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.reportStatusScreen),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillOnPrimary,
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: appTheme.blueGray400,
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: appTheme.black900,
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        decoration: AppDecoration.fillOnPrimary,
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: appTheme.black900,
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: appTheme.blueGray400,
            )
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
