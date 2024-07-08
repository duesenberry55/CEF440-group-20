import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key})
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
                      SizedBox(height: 5.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 143.h),
                          child: Text(
                            "ALERTS",
                            style: theme.textTheme.headlineSmall,
                          ),
                        ),
                      ),
                      Divider(
                        endIndent: 15.h,
                      ),
                      SizedBox(height: 13.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 14.h),
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgEllipse548x48,
                                height: 48.adaptSize,
                                width: 48.adaptSize,
                                radius: BorderRadius.circular(
                                  24.h,
                                ),
                                margin: EdgeInsets.symmetric(vertical: 3.v),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Alert title - Type",
                                      style: theme.textTheme.headlineSmall,
                                    ),
                                    Text(
                                      "Description, Location",
                                      style: theme.textTheme.titleLarge,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 4.v),
                      CustomElevatedButton(
                        width: 250.h,
                        text: "see all alerts",
                        margin: EdgeInsets.only(right: 79.h),
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
                          onTapSeeallalerts(context);
                        },
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: 7.v),
                      _buildQuickContactsSection(context),
                      SizedBox(height: 7.v),
                      _buildInformationSection(context),
                      SizedBox(height: 6.v),
                      _buildQuickActionsSection(context),
                      SizedBox(height: 6.v)
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
  Widget _buildQuickContactsSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.h,
        vertical: 1.v,
      ),
      decoration: AppDecoration.fillPrimaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick Contacts",
            style: theme.textTheme.headlineSmall,
          ),
          SizedBox(height: 5.v),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: 11.h,
                right: 21.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.v),
                    child: Column(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse1,
                          height: 65.adaptSize,
                          width: 65.adaptSize,
                          radius: BorderRadius.circular(
                            32.h,
                          ),
                          onTap: () {
                            onTapImgCircleimageone(context);
                          },
                        ),
                        SizedBox(height: 2.v),
                        Text(
                          "Fire rescue",
                          style: theme.textTheme.titleSmall,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 24.h,
                      top: 1.v,
                    ),
                    child: Column(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse265x65,
                          height: 65.adaptSize,
                          width: 65.adaptSize,
                          radius: BorderRadius.circular(
                            32.h,
                          ),
                          onTap: () {
                            onTapImgCircleimagetwo(context);
                          },
                        ),
                        SizedBox(height: 2.v),
                        Text(
                          "Ambulance",
                          style: theme.textTheme.titleSmall,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 29.h,
                        top: 1.v,
                      ),
                      child: _buildPoliceSection(
                        context,
                        police: "Hospital",
                        onTapCircleimage: () {
                          onTapCircleimage(context);
                        },
                      ),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: _buildPoliceSection(
                      context,
                      police: "Police",
                      onTapCircleimage: () {
                        onTapCircleimage1(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 14.v)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildInformationSection(BuildContext context) {
    return SizedBox(
      height: 143.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 6.h,
                vertical: 7.v,
              ),
              decoration: AppDecoration.fillPrimaryContainer,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 4.v),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Information",
                              style: theme.textTheme.headlineSmall,
                            ),
                          ),
                          SizedBox(height: 5.v),
                          Container(
                            width: 274.h,
                            margin: EdgeInsets.only(
                              left: 19.h,
                              right: 13.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgEllipse165x65,
                                  height: 65.adaptSize,
                                  width: 65.adaptSize,
                                  radius: BorderRadius.circular(
                                    32.h,
                                  ),
                                  onTap: () {
                                    onTapImgImage(context);
                                  },
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgEllipse32,
                                  height: 65.adaptSize,
                                  width: 65.adaptSize,
                                  radius: BorderRadius.circular(
                                    32.h,
                                  ),
                                  onTap: () {
                                    onTapImgImageone(context);
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 4.v),
                          Container(
                            width: 291.h,
                            margin: EdgeInsets.only(left: 15.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Safety tips",
                                  style: theme.textTheme.titleSmall,
                                ),
                                Text(
                                  "First aid tips",
                                  style: theme.textTheme.titleSmall,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 25.h,
                      top: 34.v,
                      bottom: 4.v,
                    ),
                    child: Column(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse41,
                          height: 65.adaptSize,
                          width: 65.adaptSize,
                          radius: BorderRadius.circular(
                            32.h,
                          ),
                          onTap: () {
                            onTapImgImagetwo(context);
                          },
                        ),
                        SizedBox(height: 3.v),
                        Text(
                          "News",
                          style: theme.textTheme.titleSmall,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 118.h,
                right: 213.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse21,
                    height: 65.adaptSize,
                    width: 65.adaptSize,
                    radius: BorderRadius.circular(
                      32.h,
                    ),
                    margin: EdgeInsets.only(left: 12.h),
                    onTap: () {
                      onTapImgImagethree(context);
                    },
                  ),
                  SizedBox(
                    width: 98.h,
                    child: Text(
                      "Emergency\npreparedness",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleSmall,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildQuickActionsSection(BuildContext context) {
    return Container(
      height: 141.v,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 9.h),
      decoration: AppDecoration.fillPrimaryContainer,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 96.h,
              margin: EdgeInsets.only(left: 107.h),
              child: Text(
                "Share real \ntime location",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleSmall,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 1.h,
                top: 8.v,
              ),
              child: Text(
                "Quick Actions",
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgEllipse22,
            height: 65.adaptSize,
            width: 65.adaptSize,
            radius: BorderRadius.circular(
              32.h,
            ),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 122.h),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(right: 316.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse2,
                    height: 65.adaptSize,
                    width: 65.adaptSize,
                    radius: BorderRadius.circular(
                      32.h,
                    ),
                    onTap: () {
                      onTapImgCircleimagesix(context);
                    },
                  ),
                  SizedBox(height: 2.v),
                  SizedBox(
                    width: 95.h,
                    child: Text(
                      "Report status \nand needs",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleSmall,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildPoliceSection(
    BuildContext context, {
    required String police,
    Function? onTapCircleimage,
  }) {
    return Column(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgEllipse465x65,
          height: 65.adaptSize,
          width: 65.adaptSize,
          radius: BorderRadius.circular(
            32.h,
          ),
          onTap: () {
            onTapCircleimage?.call();
          },
        ),
        SizedBox(height: 3.v),
        Text(
          police,
          style: theme.textTheme.titleSmall!.copyWith(
            color: appTheme.black900,
          ),
        )
      ],
    );
  }

  /// Navigates to the userAlertsScreen when the action is triggered.
  onTapSeeallalerts(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.userAlertsScreen);
  }

  /// Navigates to the contactsFireRescueScreen when the action is triggered.
  onTapImgCircleimageone(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.contactsFireRescueScreen);
  }

  /// Navigates to the contactsAmbulanceScreen when the action is triggered.
  onTapImgCircleimagetwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.contactsAmbulanceScreen);
  }

  /// Navigates to the contactsHospitalScreen when the action is triggered.
  onTapCircleimage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.contactsHospitalScreen);
  }

  /// Navigates to the contactsPoliceScreen when the action is triggered.
  onTapCircleimage1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.contactsPoliceScreen);
  }

  /// Navigates to the safetyTipsScreen when the action is triggered.
  onTapImgImage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.safetyTipsScreen);
  }

  /// Navigates to the firstAidTipsScreen when the action is triggered.
  onTapImgImageone(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.firstAidTipsScreen);
  }

  /// Navigates to the newsScreen when the action is triggered.
  onTapImgImagetwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.newsScreen);
  }

  /// Navigates to the emergencyPrepScreen when the action is triggered.
  onTapImgImagethree(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.emergencyPrepScreen);
  }

  /// Navigates to the reportStatusScreen when the action is triggered.
  onTapImgCircleimagesix(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.reportStatusScreen);
  }
}
