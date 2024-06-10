import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class UserprofilelistItemWidget extends StatelessWidget {
  const UserprofilelistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 10.v,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse513,
            height: 48.adaptSize,
            width: 48.adaptSize,
            radius: BorderRadius.circular(
              24.h,
            ),
            margin: EdgeInsets.only(
              top: 7.v,
              bottom: 9.v,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              bottom: 7.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: theme.textTheme.headlineSmall,
                ),
                SizedBox(height: 2.v),
                Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Text(
                    "Description",
                    style: theme.textTheme.titleLarge,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
