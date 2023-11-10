
// ignore_for_file: depend_on_referenced_packages

import 'package:example/const/image_const.dart';
import 'package:example/features/error/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helixworlds_snatcher_sdk/core/service_di.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/app_bar/appbar_title.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/app_bar/custom_app_bar.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/custom_elevated_button.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/custom_image_view.dart';
import 'package:helixworlds_snatcher_sdk/theme/custom_button_style.dart';
import 'package:helixworlds_snatcher_sdk/utils/size_utils.dart';
import 'scan_screen_bloc.dart';
import 'package:go_router/go_router.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocListener(
      bloc: context.read<ScanScreenPageBloc>(),
      listener: (context, state) {
        if(state is ScanScreenInitialState) {
          context.go("/home");
        } else if(state is ScanScreenViewLogsState){
          context.go("/home/logs");
        } else if(state is ScanScreenShowGuideState) {
          context.go("/home/guide");
        } else if(state is ScanScreenShowScannedObjectState){
          context.go("/home/product_details");
        }
      }, child: SafeArea(
          child: Scaffold(
            body: SizedBox(
              height: 813.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: 
                    CustomImageView(
                      imagePath: ImageConstant.imgGroup7,
                      width: double.maxFinite,
                      height: double.maxFinite
                    )
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: 
                    CustomImageView(
                      svgPath: ImageConstant.imgGroup8,
                      width: 400.v,
                      height: 400.h
                    )
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomAppBar(
                          centerTitle: true,
                          title: AppbarTitle(
                            text: "Home",
                          ),
                          styleType: Style.bgShadow,
                        ),
                        SizedBox(height: 37.v),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              height: 654.v,
                              width: double.maxFinite,
                              margin: EdgeInsets.only(bottom: 1.v),
                              padding: EdgeInsets.symmetric(horizontal: 40.h),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                          top: 40.v,
                                        ),
                                        child:const ErrorMessageWidget())
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 15.v),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children:[
                                                    InkWell(
                                                        onTap: () async {
                                                          context.read<ScanScreenPageBloc>().add(ScanScreenViewLogsEvent());
                                                        },
                                                        child: CircleAvatar(
                                                          radius: 25,
                                                          backgroundColor: Colors.white,
                                                          child: CircleAvatar(
                                                            radius: 24,
                                                            backgroundColor: appTheme.blueGray900,
                                                            child: const Icon(Icons.history, size: 25)
                                                          ),
                                                        ),
                                                    ),

                                                    InkWell(
                                                      onTap: () async {
                                                        context.read<ScanScreenPageBloc>().add(ScanScreenTakePictureEvent());
                                                      },
                                                      child: CircleAvatar(
                                                        radius: 50,
                                                        backgroundColor: Colors.white,
                                                        child: CircleAvatar(
                                                          radius: 49,
                                                          backgroundColor: appTheme.limeA200,
                                                          child: const Icon(Icons.camera_alt, size: 50)
                                                        ),
                                                      ),
                                                    ),

                                                    InkWell(
                                                        onTap: () async {
                                                          context.read<ScanScreenPageBloc>().add(ScanScreenViewGuideEvent());
                                                        },
                                                        child: CircleAvatar(
                                                          radius: 25,
                                                          backgroundColor: Colors.white,
                                                          child: CircleAvatar(
                                                            radius: 24,
                                                            backgroundColor: appTheme.blueGray900,
                                                            child: const Icon(Icons.help, size: 25)
                                                          ),
                                                        ),
                                                    )
                                        ]),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 70.h,
                                        vertical: 194.v,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Scan Items",
                                            style: theme.textTheme.displaySmall,
                                          ),
                                          CustomElevatedButton(
                                            height: 39.v,
                                            text: "GAIN REWARDS",
                                            margin: EdgeInsets.only(
                                              left: 17.h,
                                              top: 7.v,
                                              right: 16.h,
                                            ),
                                            buttonStyle:
                                                CustomButtonStyles.fillGray,
                                            buttonTextStyle:
                                                theme.textTheme.bodyLarge!,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      );
  }
}


