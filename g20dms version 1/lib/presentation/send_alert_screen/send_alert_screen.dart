import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SendAlertScreen extends StatelessWidget {
  SendAlertScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController titleFieldController = TextEditingController();

  TextEditingController locationFieldController = TextEditingController();

  TextEditingController incidenttypeexaController = TextEditingController();

  TextEditingController noteFieldController = TextEditingController();

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAppBar(context),
                      SizedBox(height: 63.v),
                      Padding(
                        padding: EdgeInsets.only(left: 7.h),
                        child: Text(
                          "Title",
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildTitleField(context),
                      SizedBox(height: 20.v),
                      Padding(
                        padding: EdgeInsets.only(left: 13.h),
                        child: Text(
                          "Location",
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildLocationField(context),
                      SizedBox(height: 22.v),
                      _buildIncidentTypeSection(context),
                      SizedBox(height: 5.v),
                      Padding(
                        padding: EdgeInsets.only(left: 13.h),
                        child: Text(
                          "Note",
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildNoteField(context),
                      SizedBox(height: 23.v),
                      _buildSendButton(context),
                      Spacer(
                        flex: 42,
                      ),
                      _buildHomeButton(context),
                      Spacer(
                        flex: 57,
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
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "SEND ALERT",
      ),
    );
  }

  /// Section Widget
  Widget _buildTitleField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 7.h,
        right: 23.h,
      ),
      child: CustomTextFormField(
        controller: titleFieldController,
        alignment: Alignment.center,
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
        alignment: Alignment.center,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 7.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildIncidentTypeSection(BuildContext context) {
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
          CustomTextFormField(
            controller: incidenttypeexaController,
            hintText: "eg Fire, Flood, Landslide etc",
            hintStyle: CustomTextStyles.titleLargeInterErrorContainer,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 7.v,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNoteField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 13.h,
        right: 17.h,
      ),
      child: CustomTextFormField(
        controller: noteFieldController,
        textInputAction: TextInputAction.done,
        alignment: Alignment.center,
      ),
    );
  }

  /// Section Widget
  Widget _buildSendButton(BuildContext context) {
    return CustomElevatedButton(
      height: 47.v,
      width: 205.h,
      text: "Send",
      margin: EdgeInsets.only(left: 97.h),
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
