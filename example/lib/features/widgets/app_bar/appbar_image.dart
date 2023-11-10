import 'package:flutter/material.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/custom_image_view.dart';
import 'package:helixworlds_snatcher_sdk/utils/size_utils.dart';


// ignore: must_be_immutable
class AppbarImage extends StatelessWidget {
  AppbarImage({
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
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          svgPath: svgPath,
          imagePath: imagePath,
          height: 12.v,
          width: 5.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
