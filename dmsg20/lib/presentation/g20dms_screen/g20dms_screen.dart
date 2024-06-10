import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';

class G20dmsScreen extends StatelessWidget {
  const G20dmsScreen({Key? key})
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
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle1,
                        height: 160.v,
                        width: 395.h,
                        radius: BorderRadius.circular(
                          1.h,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      Container(
                        width: 396.h,
                        margin: EdgeInsets.only(
                          left: 8.h,
                          right: 5.h,
                        ),
                        child: Text(
                          "Empowering Communities, Saving Lives ",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.displaySmall,
                        ),
                      ),
                      SizedBox(height: 22.v),
                      Container(
                        width: 402.h,
                        margin: EdgeInsets.only(right: 7.h),
                        child: Text(
                          "Your Ultimate Solution for Comprehensive Disaster Preparedness, Timely Alerts, and Effective Response Strategies",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(height: 72.v),
                      CustomElevatedButton(
                        height: 64.v,
                        width: 241.h,
                        text: "Get Started",
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
                          onTapGetstarted(context);
                        },
                      ),
                      SizedBox(height: 4.v)
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

  /// Navigates to the welcomeScreen when the action is triggered.
  onTapGetstarted(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.welcomeScreen);
  }
}
