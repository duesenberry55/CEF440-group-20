import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 887.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgVector1Onprimarycontainer,
                height: 829.v,
                width: 414.h,
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.h,
                    vertical: 112.v,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "SELECT YOUR ROLE",
                        style: theme.textTheme.displaySmall,
                      ),
                      Spacer(
                        flex: 41,
                      ),
                      CustomElevatedButton(
                        height: 71.v,
                        width: 250.h,
                        text: "USER",
                        rightIcon: Container(
                          margin: EdgeInsets.only(left: 9.h),
                          child: CustomImageView(
                            imagePath:
                                ImageConstant.imgArrowRightUndefinedOnprimary,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ),
                        onPressed: () {
                          onTapUser(context);
                        },
                      ),
                      SizedBox(height: 81.v),
                      CustomElevatedButton(
                        height: 71.v,
                        width: 250.h,
                        text: "AUTHORITY",
                        rightIcon: Container(
                          margin: EdgeInsets.only(left: 9.h),
                          child: CustomImageView(
                            imagePath:
                                ImageConstant.imgArrowRightUndefinedOnprimary,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ),
                        onPressed: () {
                          onTapAuthority(context);
                        },
                      ),
                      SizedBox(height: 62.v),
                      CustomElevatedButton(
                        height: 71.v,
                        width: 250.h,
                        text: "RESPONDENT",
                        rightIcon: Container(
                          margin: EdgeInsets.only(left: 10.h),
                          child: CustomImageView(
                            imagePath:
                                ImageConstant.imgArrowRightUndefinedOnprimary,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ),
                        onPressed: () {
                          onTapRespondent(context);
                        },
                      ),
                      Spacer(
                        flex: 58,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the userScreen when the action is triggered.
  onTapUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.userScreen);
  }

  /// Navigates to the authoritiesLogInScreen when the action is triggered.
  onTapAuthority(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.authoritiesLogInScreen);
  }

  /// Navigates to the respondentsLogInScreen when the action is triggered.
  onTapRespondent(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.respondentsLogInScreen);
  }
}
