// ignore_for_file: must_be_immutable
import 'package:helixworlds_snatcher_sdk/core/service_di.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/model/log_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/scan_screen_bloc.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/custom_image_view.dart';
import 'package:helixworlds_snatcher_sdk/theme/app_decoration.dart';
import 'package:helixworlds_snatcher_sdk/theme/custom_text_style.dart';
import 'package:helixworlds_snatcher_sdk/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryItemWidget extends StatelessWidget {
  final bool isLocal;
  HistoryItemWidget(
    this.historyItemModelObj, 
    { this.isLocal = true, 
      Key? key
    }
  ) : super(
          key: key,
  );

  MyLogModel historyItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 515.adaptSize,
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 30.v,
      ),
      decoration: AppDecoration.outlineBlueGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(children:[
              Container(
                height: 70.adaptSize,
                width: 70.adaptSize,
                padding: EdgeInsets.all(8.h),
                decoration: AppDecoration.fillBlueGray.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: CustomImageView(
                  svgPath: isLocal ? "" : "",
                  url: !isLocal ? historyItemModelObj.image : "",
                  height: 53.adaptSize,
                  width: 53.adaptSize,
                  alignment: Alignment.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.h,
                  top: 13.v,
                  bottom: 9.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                      Text(
                        historyItemModelObj.name ?? "",
                        style: CustomTextStyles.bodyLargeLimeA20018,
                      ),
                      SizedBox(height: 9.v),
                      Row(
                        children: [
                          Text(
                            historyItemModelObj.game ?? "",
                            style: theme.textTheme.labelLarge,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.h),
                            child: Text(
                              "/",
                              style: theme.textTheme.labelLarge,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.h),
                            child: Text(
                              getHelperUtil().formatDate(historyItemModelObj.date ?? ""),
                              style: theme.textTheme.labelLarge,
                            ),
                          ),
                        ],
                      ),

                  ],
                ),
              ),
            ]),

            InkWell(onTap:(){
              context.read<ScanScreenPageBloc>().add(ScanScreenRedirectToUrlEvent(historyItemModelObj.url ?? ""));
            }, child: Icon(Icons.arrow_forward_ios_rounded, size: 30.v, color: Colors.white))
        ],
      ),
    );
  }
}
