import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class Contactlist5ItemWidget extends StatelessWidget {
  const Contactlist5ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 14.h,
          vertical: 11.v,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgEllipse512,
              height: 48.adaptSize,
              width: 48.adaptSize,
              radius: BorderRadius.circular(
                24.h,
              ),
              margin: EdgeInsets.symmetric(vertical: 6.v),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 26.h,
                bottom: 4.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact",
                    style: theme.textTheme.headlineSmall,
                  ),
                  Text(
                    "Number, Location",
                    style: theme.textTheme.titleLarge,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
