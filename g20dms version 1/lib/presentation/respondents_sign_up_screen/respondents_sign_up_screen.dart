import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class RespondentsSignUpScreen extends StatelessWidget {
  RespondentsSignUpScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController firstNameFieldController = TextEditingController();

  TextEditingController lastNameFieldController = TextEditingController();

  TextEditingController idNumberFieldController = TextEditingController();

  TextEditingController mobileNumberFieldController = TextEditingController();

  TextEditingController emailFieldController = TextEditingController();

  TextEditingController passwordFieldController = TextEditingController();

  TextEditingController confirmPasswordFieldController =
      TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 51.h,
                vertical: 42.v,
              ),
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle3,
                    height: 94.v,
                    width: 222.h,
                  ),
                  SizedBox(height: 36.v),
                  Text(
                    "Sign up",
                    style: CustomTextStyles.titleMediumSemiBold,
                  ),
                  SizedBox(height: 5.v),
                  Text(
                    "Enter the information below to create an account",
                    style: CustomTextStyles.bodyMediumBlack900_1,
                  ),
                  SizedBox(height: 25.v),
                  _buildFirstNameField(context),
                  SizedBox(height: 16.v),
                  _buildLastNameField(context),
                  SizedBox(height: 16.v),
                  _buildIdNumberField(context),
                  SizedBox(height: 16.v),
                  _buildMobileNumberField(context),
                  SizedBox(height: 16.v),
                  _buildEmailField(context),
                  SizedBox(height: 16.v),
                  _buildPasswordField(context),
                  SizedBox(height: 16.v),
                  _buildConfirmPasswordField(context),
                  SizedBox(height: 16.v),
                  Container(
                    width: 311.h,
                    margin: EdgeInsets.only(
                      left: 7.h,
                      right: 8.h,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "By clicking continue, you agree to our ",
                            style: theme.textTheme.bodySmall,
                          ),
                          TextSpan(
                            text: "Terms of Service",
                            style: CustomTextStyles.bodySmallBlack900,
                          ),
                          TextSpan(
                            text: " and ",
                            style: theme.textTheme.bodySmall,
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: CustomTextStyles.bodySmallBlack900,
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 15.v),
                  _buildSignUpButton(context),
                  SizedBox(height: 27.v),
                  GestureDetector(
                    onTap: () {
                      onTapTxtAlreadyhavean(context);
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account? ",
                            style: CustomTextStyles.bodyMediumBlack900,
                          ),
                          TextSpan(
                            text: "Login",
                            style: CustomTextStyles.bodyMediumPrimary.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          )
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 5.v)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFirstNameField(BuildContext context) {
    return CustomTextFormField(
      controller: firstNameFieldController,
      hintText: "First Name",
    );
  }

  /// Section Widget
  Widget _buildLastNameField(BuildContext context) {
    return CustomTextFormField(
      controller: lastNameFieldController,
      hintText: "Last Name",
    );
  }

  /// Section Widget
  Widget _buildIdNumberField(BuildContext context) {
    return CustomTextFormField(
      controller: idNumberFieldController,
      hintText: "ID number",
      textInputType: TextInputType.number,
    );
  }

  /// Section Widget
  Widget _buildMobileNumberField(BuildContext context) {
    return CustomTextFormField(
      controller: mobileNumberFieldController,
      hintText: "Mobile Number",
      textInputType: TextInputType.phone,
    );
  }

  /// Section Widget
  Widget _buildEmailField(BuildContext context) {
    return CustomTextFormField(
      controller: emailFieldController,
      hintText: "email",
      textInputType: TextInputType.emailAddress,
    );
  }

  /// Section Widget
  Widget _buildPasswordField(BuildContext context) {
    return CustomTextFormField(
      controller: passwordFieldController,
      hintText: "password",
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
    );
  }

  /// Section Widget
  Widget _buildConfirmPasswordField(BuildContext context) {
    return CustomTextFormField(
      controller: confirmPasswordFieldController,
      hintText: "Confirm password",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
    );
  }

  /// Section Widget
  Widget _buildSignUpButton(BuildContext context) {
    return CustomElevatedButton(
      height: 40.v,
      text: "Sign up",
      buttonStyle: CustomButtonStyles.fillPrimaryTL8,
      buttonTextStyle: CustomTextStyles.titleSmallInterOnPrimary,
      onPressed: () {
        onTapSignUpButton(context);
      },
    );
  }

  /// Navigates to the respondentsScreen when the action is triggered.
  onTapSignUpButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.respondentsScreen);
  }

  /// Navigates to the respondentsLogInScreen when the action is triggered.
  onTapTxtAlreadyhavean(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.respondentsLogInScreen);
  }
}
