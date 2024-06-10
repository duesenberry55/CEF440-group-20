import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SendDirectivesScreen extends StatelessWidget {
  SendDirectivesScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController fieldOneController = TextEditingController();

  TextEditingController locationFieldController = TextEditingController();

  TextEditingController fieldthreeController = TextEditingController();

  TextEditingController fieldFiveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: 887.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgVector1,
                height: 772.v,
                width: 414.h,
                alignment: Alignment.topCenter,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 7.h,
                    vertical: 18.v,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "SEND DIRECTIVES",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                      SizedBox(height: 63.v),
                      Text(
                        "Title",
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(height: 9.v),
                      _buildFieldOne(context),
                      SizedBox(height: 20.v),
                      Padding(
                        padding: EdgeInsets.only(left: 6.h),
                        child: Text(
                          "Location",
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildLocationField(context),
                      SizedBox(height: 22.v),
                      _buildIncidentInputSection(context),
                      SizedBox(height: 5.v),
                      Padding(
                        padding: EdgeInsets.only(left: 6.h),
                        child: Text(
                          "Note",
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildFieldFive(context),
                      SizedBox(height: 23.v),
                      _buildSendButton(context),
                      Spacer(
                        flex: 49,
                      ),
                      _buildHomeButton(context),
                      Spacer(
                        flex: 50,
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

  /// Section Widget
  Widget _buildFieldOne(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.h),
      child: CustomTextFormField(
        controller: fieldOneController,
      ),
    );
  }

  /// Section Widget
  Widget _buildLocationField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 6.h,
        right: 10.h,
      ),
      child: CustomTextFormField(
        controller: locationFieldController,
        hintText: "eg Buea Town, Buea",
        hintStyle: CustomTextStyles.titleLargeInterErrorContainer,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 7.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildIncidentInputSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6.h),
            child: Text(
              "Incident type",
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 8.v),
          Padding(
            padding: EdgeInsets.only(left: 6.h),
            child: CustomTextFormField(
              controller: fieldthreeController,
              hintText: "eg Fire, Flood, Landslide etc",
              hintStyle: CustomTextStyles.titleLargeInterErrorContainer,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.h,
                vertical: 7.v,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFieldFive(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 6.h,
        right: 10.h,
      ),
      child: CustomTextFormField(
        controller: fieldFiveController,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  /// Section Widget
  Widget _buildSendButton(BuildContext context) {
    return CustomElevatedButton(
      height: 47.v,
      width: 205.h,
      text: "Send",
      margin: EdgeInsets.only(left: 90.h),
    );
  }

  /// Section Widget
  Widget _buildHomeButton(BuildContext context) {
    return CustomElevatedButton(
      width: 250.h,
      text: "HOME",
      leftIcon: Container(
        margin: EdgeInsets.only(right: 10.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgArrowRightUndefined,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      onPressed: () {
        onTapHomeButton(context);
      },
      alignment: Alignment.center,
    );
  }

  /// Navigates to the authoritiesScreen when the action is triggered.
  onTapHomeButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.authoritiesScreen);
  }
}
