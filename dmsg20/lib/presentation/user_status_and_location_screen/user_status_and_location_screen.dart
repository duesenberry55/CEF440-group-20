import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_search_view.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UserStatusAndLocationScreen extends StatelessWidget {
  UserStatusAndLocationScreen({Key? key})
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
                      SizedBox(height: 16.v),
                      Divider(
                        indent: 8.h,
                        endIndent: 7.h,
                      ),
                      SizedBox(height: 17.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 22.h,
                          right: 79.h,
                        ),
                        child: _buildIncidentRow(
                          context,
                          incidenttitle: "Incident Title - Type",
                          descriptionOne: "Description, Location",
                        ),
                      ),
                      SizedBox(height: 16.v),
                      Divider(
                        indent: 8.h,
                        endIndent: 7.h,
                      ),
                      SizedBox(height: 17.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 22.h,
                          right: 79.h,
                        ),
                        child: _buildIncidentRow(
                          context,
                          incidenttitle: "Incident Title - Type",
                          descriptionOne: "Description, Location",
                        ),
                      ),
                      SizedBox(height: 13.v),
                      Divider(
                        indent: 8.h,
                        endIndent: 7.h,
                      ),
                      SizedBox(height: 17.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 22.h,
                          right: 79.h,
                        ),
                        child: _buildIncidentRow(
                          context,
                          incidenttitle: "Incident Title - Type",
                          descriptionOne: "Description, Location",
                        ),
                      ),
                      SizedBox(height: 13.v),
                      Divider(
                        indent: 8.h,
                        endIndent: 7.h,
                      ),
                      SizedBox(height: 17.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 22.h,
                          right: 79.h,
                        ),
                        child: _buildIncidentRow(
                          context,
                          incidenttitle: "Incident Title - Type",
                          descriptionOne: "Description, Location",
                        ),
                      ),
                      SizedBox(height: 13.v),
                      Divider(
                        indent: 8.h,
                        endIndent: 7.h,
                      ),
                      SizedBox(height: 17.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 22.h,
                          right: 79.h,
                        ),
                        child: _buildIncidentRow(
                          context,
                          incidenttitle: "Incident Title - Type",
                          descriptionOne: "Description, Location",
                        ),
                      ),
                      SizedBox(height: 13.v),
                      Divider(
                        indent: 8.h,
                        endIndent: 7.h,
                      ),
                      SizedBox(height: 17.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 22.h,
                          right: 79.h,
                        ),
                        child: _buildIncidentRow(
                          context,
                          incidenttitle: "Incident Title - Type",
                          descriptionOne: "Description, Location",
                        ),
                      ),
                      SizedBox(height: 17.v),
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
                      SizedBox(height: 17.v)
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
        text: "USER STATUS AND LOCATION",
      ),
    );
  }

  /// Common widget
  Widget _buildIncidentRow(
    BuildContext context, {
    required String incidenttitle,
    required String descriptionOne,
  }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgEllipse51,
          height: 48.adaptSize,
          width: 48.adaptSize,
          radius: BorderRadius.circular(
            24.h,
          ),
          margin: EdgeInsets.only(bottom: 2.v),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: 26.h,
              top: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  incidenttitle,
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
          ),
        )
      ],
    );
  }

  /// Navigates to the respondentsScreen when the action is triggered.
  onTapHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.respondentsScreen);
  }
}
