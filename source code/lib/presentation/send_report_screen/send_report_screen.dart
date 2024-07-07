import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SendReportScreen extends StatelessWidget {
  SendReportScreen({Key? key})
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
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(right: 15.h),
                  padding: EdgeInsets.symmetric(vertical: 18.v),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        ImageConstant.imgVector1,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildAppBar(context),
                      SizedBox(height: 63.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 7.h),
                          child: Text(
                            "Title",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildFieldOne(context),
                      SizedBox(height: 20.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 13.h),
                          child: Text(
                            "Location",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildLocationField(context),
                      SizedBox(height: 22.v),
                      _buildIncidentInputSection(context),
                      SizedBox(height: 5.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 13.h),
                          child: Text(
                            "Note",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildFieldFive(context),
                      SizedBox(height: 24.v),
                      _buildDocumentUploadSection(context),
                      SizedBox(height: 56.v),
                      _buildSubmitButton(context),
                      SizedBox(height: 56.v)
                    ],
                  ),
                ),
              ),
              _buildHomeButton(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "SEND REPORT",
      ),
    );
  }

  /// Section Widget
  Widget _buildFieldOne(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.h),
      child: CustomTextFormField(
        controller: fieldOneController,
      ),
    );
  }

  /// Section Widget
  Widget _buildLocationField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 13.h,
        right: 1.h,
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Incident type",
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 8.v),
          Padding(
            padding: EdgeInsets.only(right: 4.h),
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
        left: 13.h,
        right: 1.h,
      ),
      child: CustomTextFormField(
        controller: fieldFiveController,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  /// Section Widget
  Widget _buildSelectfile(BuildContext context) {
    return CustomElevatedButton(
      height: 62.v,
      width: 101.h,
      text: "Select file",
      margin: EdgeInsets.only(left: 16.h),
      buttonStyle: CustomButtonStyles.outlineBlack,
      buttonTextStyle: CustomTextStyles.titleLargeInterOnPrimary,
    );
  }

  /// Section Widget
  Widget _buildDocumentUploadSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 13.h,
        right: 1.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 281.h,
            margin: EdgeInsets.symmetric(vertical: 8.v),
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 8.v,
            ),
            decoration: AppDecoration.outlineGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: Text(
              "upload document",
              style: CustomTextStyles.titleLargeInterErrorContainer,
            ),
          ),
          _buildSelectfile(context)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSubmitButton(BuildContext context) {
    return CustomElevatedButton(
      height: 64.v,
      width: 211.h,
      text: "Submit",
    );
  }

  /// Section Widget
  Widget _buildHomeButton(BuildContext context) {
    return CustomElevatedButton(
      width: 250.h,
      text: "HOME",
      margin: EdgeInsets.only(bottom: 5.v),
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
      alignment: Alignment.bottomCenter,
    );
  }

  /// Navigates to the respondentsScreen when the action is triggered.
  onTapHomeButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.respondentsScreen);
  }
}
