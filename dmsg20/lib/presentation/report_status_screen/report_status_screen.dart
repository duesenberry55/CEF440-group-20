import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ReportStatusScreen extends StatelessWidget {
  ReportStatusScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController nameFieldController = TextEditingController();

  TextEditingController locationFieldController = TextEditingController();

  TextEditingController phoneFieldController = TextEditingController();

  TextEditingController incidentTypeFieldController = TextEditingController();

  TextEditingController descriptionFieldController = TextEditingController();

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
                  padding: EdgeInsets.symmetric(vertical: 18.v),
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
                            "Name",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildNameField(context),
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
                      SizedBox(height: 21.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 13.h),
                          child: Text(
                            "Phone",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildPhoneField(context),
                      SizedBox(height: 14.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 11.h),
                          child: Text(
                            "Incident type",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.v),
                      _buildIncidentTypeField(context),
                      SizedBox(height: 14.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 13.h),
                          child: Text(
                            "Description",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.v),
                      _buildDescriptionField(context),
                      SizedBox(height: 25.v),
                      _buildSubmitButton(context),
                      SizedBox(height: 49.v),
                      _buildHomeButton(context),
                      SizedBox(height: 49.v)
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
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "REPORT STATUS",
      ),
    );
  }

  /// Section Widget
  Widget _buildNameField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 7.h,
        right: 23.h,
      ),
      child: CustomTextFormField(
        controller: nameFieldController,
        hintText: "eg Jon Doe",
        hintStyle: CustomTextStyles.titleLargeInterErrorContainer,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 7.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLocationField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 13.h,
        right: 17.h,
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
  Widget _buildPhoneField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 13.h,
        right: 17.h,
      ),
      child: CustomTextFormField(
        controller: phoneFieldController,
        hintText: "+237670000000",
        hintStyle: CustomTextStyles.titleLargeInterErrorContainer,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 7.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildIncidentTypeField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 11.h,
        right: 17.h,
      ),
      child: CustomTextFormField(
        controller: incidentTypeFieldController,
        hintText: "eg Fire, Flood, Landslide etc",
        hintStyle: CustomTextStyles.titleLargeInterErrorContainer,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 7.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDescriptionField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 13.h,
        right: 15.h,
      ),
      child: CustomTextFormField(
        controller: descriptionFieldController,
        textInputAction: TextInputAction.done,
        borderDecoration: TextFormFieldStyleHelper.outlineGrayTL8,
      ),
    );
  }

  /// Section Widget
  Widget _buildSubmitButton(BuildContext context) {
    return CustomElevatedButton(
      height: 32.v,
      width: 197.h,
      text: "Submit",
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
    );
  }

  /// Navigates to the userScreen when the action is triggered.
  onTapHomeButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.userScreen);
  }
}
