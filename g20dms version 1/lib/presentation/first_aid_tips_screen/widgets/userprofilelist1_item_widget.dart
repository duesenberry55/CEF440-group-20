import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class Userprofilelist1ItemWidget extends StatelessWidget {
  const Userprofilelist1ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse514,
            height: 48.adaptSize,
            width: 48.adaptSize,
            radius: BorderRadius.circular(
              24.h,
            ),
            margin: EdgeInsets.only(
              top: 18.v,
              bottom: 2.v,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 10.v,
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
