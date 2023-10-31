// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:helixworlds_snatcher_sdk/core/service_di.dart';
import 'package:helixworlds_snatcher_sdk/utils/size_utils.dart';


/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge19 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 19.fSize,
      );
  static get errorLarge => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 19.fSize,
        color: Colors.red
  );
  static get bodyLargeLimeA200 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.limeA200,
        fontSize: 18.fSize,
      );
  static get bodyLargeLimeA20018 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.limeA200,
        fontSize: 18.fSize,
      );
  // Title text style
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 18.fSize,
      );
  static get titleMediumBlack90018 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 18.fSize,
      );
  static get titleMediumInterBlack900 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.black900,
        fontSize: 18.fSize,
      );
  static get titleSmallYellowA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.yellowA700,
        fontWeight: FontWeight.w700,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get figtree {
    return copyWith(
      fontFamily: 'Figtree',
    );
  }

  TextStyle get sFCompact {
    return copyWith(
      fontFamily: 'SF Compact',
    );
  }
}
