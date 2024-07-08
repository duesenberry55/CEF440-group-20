import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';

class RespondentsScreen extends StatelessWidget {
  const RespondentsScreen({Key? key})
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
                      Text(
                        "USER STATUS AND LOCATION",
                        style: theme.textTheme.headlineSmall,
                      ),
                      Divider(
                        endIndent: 17.h,
                      ),
                      SizedBox(height: 13.v),
                      Padding(
                        padding: EdgeInsets.only(left: 12.h),
                        child: _buildUserStatusRow(
                          context,
                          statustitleOne: "Status title - Type",
                          descriptionOne: "Description, Location",
                        ),
                      ),
                      SizedBox(height: 7.v),
                      Divider(
                        endIndent: 16.h,
                      ),
                      SizedBox(height: 13.v),
                      Padding(
                        padding: EdgeInsets.only(left: 13.h),
                        child: _buildUserStatusRow(
                          context,
                          statustitleOne: "Status title - Type",
                          descriptionOne: "Description, Location",
                        ),
                      ),
                      SizedBox(height: 7.v),
                      Divider(
                        endIndent: 15.h,
                      ),
                      SizedBox(height: 13.v),
                      Padding(
                        padding: EdgeInsets.only(left: 14.h),
                        child: _buildUserStatusRow(
                          context,
                          statustitleOne: "Status title - Type",
                          descriptionOne: "Description, Location",
                        ),
                      ),
                      SizedBox(height: 8.v),
                      Divider(
                        endIndent: 19.h,
                      ),
                      SizedBox(height: 10.v),
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
                      SizedBox(height: 43.v),
                      _buildQuickActionsColumn(context),
                      SizedBox(height: 43.v)
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
  Widget _buildQuickActionsColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: AppDecoration.fillPrimaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 29.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quick Actions",
                      style: theme.textTheme.headlineSmall,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgEllipse2,
                      height: 65.adaptSize,
                      width: 65.adaptSize,
                      radius: BorderRadius.circular(
                        32.h,
                      ),
                      margin: EdgeInsets.only(left: 25.h),
                      onTap: () {
                        onTapImgCircleimage(context);
                      },
                    )
                  ],
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse3,
                  height: 65.adaptSize,
                  width: 65.adaptSize,
                  radius: BorderRadius.circular(
                    32.h,
                  ),
                  margin: EdgeInsets.only(top: 28.v),
                  onTap: () {
                    onTapImgCircleimage1(context);
                  },
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse4,
                  height: 65.adaptSize,
                  width: 65.adaptSize,
                  radius: BorderRadius.circular(
                    32.h,
                  ),
                  margin: EdgeInsets.only(top: 28.v),
                  onTap: () {
                    onTapImgCircleimage2(context);
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 3.v),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: 15.h,
                right: 28.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Send reports",
                    style: theme.textTheme.titleSmall,
                  ),
                  Spacer(
                    flex: 45,
                  ),
                  Text(
                    "Contact Teams",
                    style: theme.textTheme.titleSmall,
                  ),
                  Spacer(
                    flex: 54,
                  ),
                  Text(
                    "See alerts",
                    style: theme.textTheme.titleSmall,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 7.v)
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildUserStatusRow(
    BuildContext context, {
    required String statustitleOne,
    required String descriptionOne,
  }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgEllipse54,
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
                statustitleOne,
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

  /// Navigates to the userStatusAndLocationScreen when the action is triggered.
  onTapSeeall(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.userStatusAndLocationScreen);
  }

  /// Navigates to the sendReportScreen when the action is triggered.
  onTapImgCircleimage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.sendReportScreen);
  }

  /// Navigates to the respondentsContactTeamsScreen when the action is triggered.
  onTapImgCircleimage1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.respondentsContactTeamsScreen);
  }

  /// Navigates to the alertsScreen when the action is triggered.
  onTapImgCircleimage2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.alertsScreen);
  }
}
