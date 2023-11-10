
// ignore_for_file: depend_on_referenced_packages

import 'package:example/const/image_const.dart';
import 'package:example/features/scan/scan_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:helixworlds_snatcher_sdk/core/service_di.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/app_bar/appbar_image_1.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/app_bar/appbar_title.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/app_bar/custom_app_bar.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/custom_icon_button.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/custom_image_view.dart';
import 'package:helixworlds_snatcher_sdk/utils/size_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuidanceScreen extends StatelessWidget {
  const GuidanceScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
          child: Scaffold(
              appBar: CustomAppBar(
                  leadingWidth: 20.h,
                  height: 100,
                  leading: AppbarImage1(
                      svgPath: ImageConstant.imgArrowLeft,
                      margin:
                          EdgeInsets.only(left: 10.h, top: 0.v, bottom: 0.v),
                      onTap: () {
                        onTapArrowleftone(context);
                      }),
                  centerTitle: true,
                  title: AppbarTitle(text: "Guidance"),
                  styleType: Style.bgShadow),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 19.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: 340.h,
                                margin: EdgeInsets.only(
                                    left: 24.h, top: 13.v, right: 28.h),
                                child: Text("Snatcher is a product detection mobile application allowing you to gain in-game and real-world rewards for finding items as you play the games you love. ",
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyLarge!
                                        .copyWith(height: 1.56)))),
                        Container(
                            width: 291.h,
                            margin: EdgeInsets.only(
                                left: 24.h, top: 24.v, right: 77.h),
                            child: Text("Scan items using your phone and access rewards following the steps below. ",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(height: 1.56))),
                        SizedBox(height: 27.v),
                        const Divider(),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 24.h, top: 40.v, right: 36.h),
                            child: Row(children: [
                              CustomIconButton(
                                  height: 50.adaptSize,
                                  width: 50.adaptSize,
                                  padding: EdgeInsets.all(13.h),
                                  decoration: IconButtonStyleHelper.fillLimeA,
                                  child: CustomImageView(svgPath: ImageConstant.imgGroup2)),
                              Expanded(
                                  child: Container(
                                      width: 258.h,
                                      margin:
                                          EdgeInsets.only(left: 24.h, top: 2.v),
                                      child: Text(
                                          "To begin your journey and scan your first item, click the camera icon.",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.bodyLarge!
                                              .copyWith(height: 1.50))))
                            ])),
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 24.h, top: 39.v, right: 28.h),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // CustomIconButton(
                                      //     height: 50.adaptSize,
                                      //     width: 50.adaptSize,
                                      //     margin: EdgeInsets.only(bottom: 24.v),
                                      //     padding: EdgeInsets.all(13.h),
                                      //     child: CustomImageView(
                                      //         svgPath: ImageConstant.imagePath)),

                                  Padding(
                                      padding: EdgeInsets.only(bottom: 24.v),
                                      child: CustomIconButton(
                                          height: 50.adaptSize,
                                          width: 50.adaptSize,
                                          padding: EdgeInsets.all(13.h),
                                          child: CustomImageView(
                                              svgPath: ImageConstant.imgGroup6))),

                                      Expanded(
                                          child: Container(
                                              width: 264.h,
                                              margin: EdgeInsets.only(
                                                  left: 24.h, top: 2.v),
                                              child: Text(
                                                  "To view your scan history and access your previous detections, click the history icon.",
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: theme
                                                      .textTheme.bodyLarge!
                                                      .copyWith(height: 1.50))))
                                    ]))),
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 24.h, top: 37.v, right: 26.h),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomIconButton(
                                          height: 50.adaptSize,
                                          width: 50.adaptSize,
                                          margin: EdgeInsets.only(bottom: 24.v),
                                          padding: EdgeInsets.all(13.h),
                                          child: const Icon(Icons.supervised_user_circle_rounded, color: Colors.white)),
                                      Expanded(
                                          child: Container(
                                              width: 268.h,
                                              margin: EdgeInsets.only(
                                                  left: 24.h, top: 2.v),
                                              child: Text(
                                                  "Having successfully scanned an item, you can access the brands online store by clicking the shop icon.",
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: theme
                                                      .textTheme.bodyLarge!
                                                      .copyWith(height: 1.50))))
                                    ]))),
                        const Spacer(),
                        Container(
                            width: 320.h,
                            margin: EdgeInsets.only(left: 24.h, right: 48.h),
                            child: Text(
                                "You can return to a previous step at any time by clicking the return icon. ".toUpperCase(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.labelLarge!
                                    .copyWith(height: 2.00)))
                      ]))));

  }

  onTapArrowleftone(BuildContext context) {
    context.read<ScanScreenPageBloc>().add(ScanScreenGetStartedEvent());
  }
}
