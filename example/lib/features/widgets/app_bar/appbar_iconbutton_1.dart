import 'package:flutter/material.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/custom_icon_button.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/custom_image_view.dart';
import 'package:helixworlds_snatcher_sdk/utils/size_utils.dart';

// ignore: must_be_immutable
class AppbarIconbutton1 extends StatelessWidget {
  AppbarIconbutton1({
    Key? key,
    this.imagePath,
    this.svgPath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  String? svgPath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 25.adaptSize,
          width: 25.adaptSize,
          padding: EdgeInsets.all(7.h),
          decoration: IconButtonStyleHelper.fillWhiteA,
          child: CustomImageView(
            svgPath: svgPath,
            imagePath: imagePath,
          ),
        ),
      ),
    );
  }
}
