// ignore_for_file: depend_on_referenced_packages

import 'package:example/const/image_const.dart';
import 'package:example/features/scan/scan_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/custom_elevated_button.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/custom_image_view.dart';
import 'package:helixworlds_snatcher_sdk/theme/custom_text_style.dart';
import 'package:helixworlds_snatcher_sdk/utils/size_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          key:key,
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  const Spacer(),
                  CustomImageView(
                    svgPath: ImageConstant.imgVector,
                    height: 52.v,
                    width: 250.h,
                  ),
                  SizedBox(height: 23.v),
                  SizedBox(
                    width: 260.h,
                    child: Text(
                      "Create Immersive Experiences with Real-World Rewards",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodyLarge19.copyWith(
                        height: 1.58,
                      ),
                    ),
                  ),
                  SizedBox(height: 45.v),
                  CustomElevatedButton(
                    width: 158.h,
                    text: "Get Started ->",
                    onTap:(){
                      
                      context.read<ScanScreenPageBloc>().add(ScanScreenGetStartedEvent());
                      context.go("/home");
                    }
                  ),
                  SizedBox(height: 143.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgVector,
                    height: 228.v,
                    width: 393.h,
                  ),
                ],
              ),
            ),
          ),
        );
  }


}