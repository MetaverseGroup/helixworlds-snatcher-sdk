// ignore_for_file: depend_on_referenced_packages
import 'package:example/const/image_const.dart';
import 'package:example/features/scan/scan_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:helixworlds_snatcher_sdk/core/service_di.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/data/model/scan_model.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/app_bar/appbar_image_1.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/app_bar/appbar_title.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/app_bar/custom_app_bar.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/custom_image_view.dart';
import 'package:helixworlds_snatcher_sdk/theme/custom_text_style.dart';
import 'package:helixworlds_snatcher_sdk/utils/size_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void myFunction(ImageProvider<Object> image) {}

class ViewProductScreen extends StatelessWidget {
  const ViewProductScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<ScanScreenPageBloc, ScanScreenState>(
      builder: (context, state) {
        InventoryItemModel model = const InventoryItemModel(images: []);
        if(state is ScanScreenShowScannedObjectState){
          model = state.object ?? const InventoryItemModel(images: []);
        }

        return SafeArea(
          child: Scaffold(
            appBar: CustomAppBar(
              leadingWidth: 20.h,
              height:100,
              leading: AppbarImage1(
                    svgPath: ImageConstant.imgArrowLeft,
                    margin:
                        EdgeInsets.only(left: 10.h, top: 0.v, bottom: 0.v),
                    onTap: () {
                      context.read<ScanScreenPageBloc>().add(ScanScreenGetStartedEvent());
                    }
              ),
              centerTitle: true,
              title: AppbarTitle(
                text: "Product",
              ),
              styleType: Style.bgShadow,
            ),
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  Container(
                    width: 286.h,
                    margin: EdgeInsets.only(
                      left: 54.h,
                      top: 43.v,
                      right: 52.h,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "You’ve successfully detected\n",
                            style: theme.textTheme.titleLarge,
                          ),
                          TextSpan(
                            text: model.title ?? "",
                            style: CustomTextStyles.bodyLargeLimeA200,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 15.v),
                  Text(
                    model.title ?? "",
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 64.v),
                  SizedBox(
                    height: 558.v,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          bottom:-120,
                          left:10,
                          right:10,
                          child: CustomImageView(
                              svgPath: ImageConstant.imgGroup1,
                              height: 600.adaptSize,
                              width: double.maxFinite,
                              alignment: Alignment.bottomCenter,
                        )),


                        Positioned(
                          top: -5.h,
                          child: CustomImageView(
                          imagePath: context.read<ScanScreenPageBloc>().isLocalItemDetailsFetch() ? model.images?.first.file.downloadUrl : "",
                          url: !(context.read<ScanScreenPageBloc>().isLocalItemDetailsFetch()) ? model.images?.first.file.downloadUrl ?? "" : "",
                          height: 351.adaptSize,
                          width: 351.adaptSize,
                        )),

                        Positioned(
                          bottom: 100.adaptSize,
                          child: InkWell(
                                      onTap: () async {
                                        context.read<ScanScreenPageBloc>().add(ScanScreenLaunchToUrlEvent(model));
                                      },
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          radius: 49,
                                          backgroundColor: appTheme.limeA200,
                                          child: const Icon(Icons.store_mall_directory_outlined, size: 50)
                                        ),
                                      ),
                        ))

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
