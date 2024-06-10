import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';

class AuthoritiesScreen extends StatelessWidget {
  const AuthoritiesScreen({Key? key})
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
                  padding: EdgeInsets.symmetric(vertical: 24.v),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "DASHBOARD",
                        style: theme.textTheme.displaySmall,
                      ),
                      SizedBox(height: 8.v),
                      _buildReportsStack(context),
                      SizedBox(height: 4.v),
                      Divider(
                        indent: 8.h,
                        endIndent: 7.h,
                      ),
                      SizedBox(height: 13.v),
                      Padding(
                        padding: EdgeInsets.only(left: 22.h),
                        child: _buildReportTitleRow(
                          context,
                          reporttitleOne: "Report title - Type",
                          descriptionOne: "Description, Location",
                        ),
                      ),
                      SizedBox(height: 7.v),
                      Divider(
                        indent: 8.h,
                        endIndent: 7.h,
                      ),
                      SizedBox(height: 13.v),
                      Padding(
                        padding: EdgeInsets.only(left: 22.h),
                        child: _buildReportTitleRow(
                          context,
                          reporttitleOne: "Report title - Type",
                          descriptionOne: "Description, Location",
                        ),
                      ),
                      SizedBox(height: 15.v),
                      CustomElevatedButton(
                        width: 250.h,
                        text: "see all",
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
                          onTapSeeall(context);
                        },
                      ),
                      SizedBox(height: 26.v),
                      _buildQuickActionsRow(context),
                      SizedBox(height: 26.v)
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
  Widget _buildReportsStack(BuildContext context) {
    return SizedBox(
      height: 93.v,
      width: 415.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "REPORTS",
              style: theme.textTheme.headlineSmall,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                SizedBox(height: 13.v),
                Padding(
                  padding: EdgeInsets.only(left: 14.h),
                  child: _buildReportTitleRow(
                    context,
                    reporttitleOne: "Report title - Type",
                    descriptionOne: "Description, Location",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildQuickActionsRow(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.fillPrimaryContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 114.v,
            width: 262.h,
            margin: EdgeInsets.only(bottom: 9.v),
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 21.h),
                    child: Text(
                      "Send alerts",
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Quick Actions",
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse4,
                  height: 65.adaptSize,
                  width: 65.adaptSize,
                  radius: BorderRadius.circular(
                    32.h,
                  ),
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(
                    left: 25.h,
                    bottom: 21.v,
                  ),
                  onTap: () {
                    onTapImgCircleimage(context);
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(left: 151.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse365x65,
                          height: 65.adaptSize,
                          width: 65.adaptSize,
                          radius: BorderRadius.circular(
                            32.h,
                          ),
                          onTap: () {
                            onTapImgCircleimage1(context);
                          },
                        ),
                        SizedBox(height: 3.v),
                        Text(
                          "Issue directives",
                          style: theme.textTheme.titleSmall,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 28.v,
              right: 27.h,
              bottom: 8.v,
            ),
            child: Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse3,
                  height: 65.adaptSize,
                  width: 65.adaptSize,
                  radius: BorderRadius.circular(
                    32.h,
                  ),
                  onTap: () {
                    onTapImgCircleimage2(context);
                  },
                ),
                SizedBox(height: 3.v),
                Text(
                  "Contact",
                  style: theme.textTheme.titleSmall,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildReportTitleRow(
    BuildContext context, {
    required String reporttitleOne,
    required String descriptionOne,
  }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgEllipse53,
          height: 48.adaptSize,
          width: 48.adaptSize,
          radius: BorderRadius.circular(
            24.h,
          ),
          margin: EdgeInsets.symmetric(vertical: 3.v),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.h),
          child: Column(
            children: [
              Text(
                reporttitleOne,
                style: theme.textTheme.headlineSmall!.copyWith(
                  color: appTheme.black900,
                ),
              ),
              Text(
                descriptionOne,
                style: theme.textTheme.titleLarge!.copyWith(
                  color: appTheme.black900,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  /// Navigates to the reportsScreen when the action is triggered.
  onTapSeeall(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.reportsScreen);
  }

  /// Navigates to the sendAlertScreen when the action is triggered.
  onTapImgCircleimage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.sendAlertScreen);
  }

  /// Navigates to the sendDirectivesScreen when the action is triggered.
  onTapImgCircleimage1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.sendDirectivesScreen);
  }

  /// Navigates to the authoritiesContactTeamsScreen when the action is triggered.
  onTapImgCircleimage2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.authoritiesContactTeamsScreen);
  }
}
