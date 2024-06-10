import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AuthoritiesLogInScreen extends StatelessWidget {
  AuthoritiesLogInScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailFieldController = TextEditingController();

  TextEditingController passwordFieldController = TextEditingController();

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
                  SizedBox(height: 95.v),
                  Text(
                    "Login",
                    style: CustomTextStyles.titleMediumSemiBold,
                  ),
                  SizedBox(height: 6.v),
                  Text(
                    "Enter your email and password to login",
                    style: CustomTextStyles.bodyMediumBlack900_1,
                  ),
                  SizedBox(height: 24.v),
                  _buildEmailField(context),
                  SizedBox(height: 16.v),
                  _buildPasswordField(context),
                  SizedBox(height: 16.v),
                  _buildLoginButton(context),
                  SizedBox(height: 26.v),
                  Text(
                    "Do not have an account?",
                    style: CustomTextStyles.bodyMediumBlack90015,
                  ),
                  SizedBox(height: 25.v),
                  _buildSignUpButton(context),
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
  Widget _buildEmailField(BuildContext context) {
    return CustomTextFormField(
      controller: emailFieldController,
      hintText: "email@domain.com",
      textInputType: TextInputType.emailAddress,
    );
  }

  /// Section Widget
  Widget _buildPasswordField(BuildContext context) {
    return CustomTextFormField(
      controller: passwordFieldController,
      hintText: "password",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
    );
  }

  /// Section Widget
  Widget _buildLoginButton(BuildContext context) {
    return CustomElevatedButton(
      height: 40.v,
      text: "Login",
      buttonStyle: CustomButtonStyles.fillPrimaryTL8,
      buttonTextStyle: CustomTextStyles.titleSmallInterOnPrimary,
      onPressed: () {
        onTapLoginButton(context);
      },
    );
  }

  /// Section Widget
  Widget _buildSignUpButton(BuildContext context) {
    return CustomElevatedButton(
      height: 40.v,
      text: "Sign Up",
      buttonStyle: CustomButtonStyles.fillPrimaryTL8,
      buttonTextStyle: CustomTextStyles.titleSmallInterOnPrimary,
      onPressed: () {
        onTapSignUpButton(context);
      },
    );
  }

  /// Navigates to the authoritiesScreen when the action is triggered.
  onTapLoginButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.authoritiesScreen);
  }

  /// Navigates to the authoritiesSignUpScreen when the action is triggered.
  onTapSignUpButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.authoritiesSignUpScreen);
  }
}
