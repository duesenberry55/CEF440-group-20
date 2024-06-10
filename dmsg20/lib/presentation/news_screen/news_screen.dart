import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_search_view.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key})
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
                      Divider(
                        indent: 8.h,
                        endIndent: 7.h,
                      ),
                      SizedBox(height: 9.v),
                      Padding(
                        padding: EdgeInsets.only(left: 22.h),
                        child: _buildRowTitle(
                          context,
                          titleOne: "Title",
                          descriptionOne: "Description",
                        ),
                      ),
                      SizedBox(height: 16.v),
                      Divider(
                        indent: 8.h,
                        endIndent: 7.h,
                      ),
                      SizedBox(height: 9.v),
                      Padding(
                        padding: EdgeInsets.only(left: 22.h),
                        child: _buildRowTitle(
                          context,
                          titleOne: "Title",
                          descriptionOne: "Description",
                        ),
                      ),
                      SizedBox(height: 16.v),
                      Divider(
                        indent: 8.h,
                        endIndent: 7.h,
                      ),
                      SizedBox(height: 9.v),
                      Padding(
                        padding: EdgeInsets.only(left: 22.h),
                        child: _buildRowTitle(
                          context,
                          titleOne: "Title",
                          descriptionOne: "Description",
                        ),
                      ),
                      SizedBox(height: 16.v),
                      Divider(
                        indent: 8.h,
                        endIndent: 7.h,
                      ),
                      SizedBox(height: 9.v),
                      Padding(
                        padding: EdgeInsets.only(left: 22.h),
                        child: _buildRowTitle(
                          context,
                          titleOne: "Title",
                          descriptionOne: "Description",
                        ),
                      ),
                      SizedBox(height: 16.v),
                      Divider(
                        indent: 8.h,
                        endIndent: 7.h,
                      ),
                      SizedBox(height: 9.v),
                      Padding(
                        padding: EdgeInsets.only(left: 22.h),
                        child: _buildRowTitle(
                          context,
                          titleOne: "Title",
                          descriptionOne: "Description",
                        ),
                      ),
                      SizedBox(height: 92.v),
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
                      SizedBox(height: 92.v)
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
        text: "NEWS",
      ),
    );
  }

  /// Common widget
  Widget _buildRowTitle(
    BuildContext context, {
    required String titleOne,
    required String descriptionOne,
  }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgEllipse515,
          height: 48.adaptSize,
          width: 48.adaptSize,
          radius: BorderRadius.circular(
            24.h,
          ),
          margin: EdgeInsets.only(
            top: 7.v,
            bottom: 2.v,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleOne,
                style: theme.textTheme.headlineSmall!.copyWith(
                  color: appTheme.black900,
                ),
              ),
              SizedBox(height: 2.v),
              Padding(
                padding: EdgeInsets.only(left: 3.h),
                child: Text(
                  descriptionOne,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: appTheme.black900,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  /// Navigates to the userScreen when the action is triggered.
  onTapHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.userScreen);
  }
}
