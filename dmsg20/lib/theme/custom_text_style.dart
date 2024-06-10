import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get libreCaslonText {
    return copyWith(
      fontFamily: 'Libre Caslon Text',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 15.fSize,
      );
  static get bodyMediumBlack90015 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 15.fSize,
      );
  static get bodyMediumBlack900_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 15.fSize,
      );
  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
      );
// Headline text style
  static get headlineSmallOnPrimary => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
// Title text style
  static get titleLargeInterErrorContainer =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: theme.colorScheme.errorContainer,
        fontWeight: FontWeight.w500,
      );
  static get titleLargeInterOnPrimary =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumSemiBold => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallInterOnPrimary =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w500,
      );
}
