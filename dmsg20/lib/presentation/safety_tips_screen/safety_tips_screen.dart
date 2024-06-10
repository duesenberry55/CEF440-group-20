import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_search_view.dart';
import 'widgets/userprofilelist_item_widget.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class SafetyTipsScreen extends StatelessWidget {
  SafetyTipsScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

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
                      SizedBox(height: 12.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 26.h,
                          right: 37.h,
                        ),
                        child: CustomSearchView(
                          controller: searchController,
                          hintText: "Search",
                        ),
                      ),
                      SizedBox(height: 19.v),
                      _buildUserProfileList(context),
                      Spacer(
                        flex: 41,
                      ),
                      CustomElevatedButton(
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
                          onTapHome(context);
                        },
                      ),
                      Spacer(
                        flex: 58,
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
        text: "SAFETY TIPS",
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfileList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4.5.v),
            child: SizedBox(
              width: 415.h,
              child: Divider(
                height: 1.v,
                thickness: 1.v,
                color: appTheme.black900.withOpacity(0.23),
              ),
            ),
          );
        },
        itemCount: 6,
        itemBuilder: (context, index) {
          return UserprofilelistItemWidget();
        },
      ),
    );
  }

  /// Navigates to the userScreen when the action is triggered.
  onTapHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.userScreen);
  }
}
