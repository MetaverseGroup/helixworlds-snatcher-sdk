


// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:helixworlds_snatcher_sdk/const/image_const.dart';
import 'package:helixworlds_snatcher_sdk/core/service_di.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/model/log_model.dart';
import 'package:helixworlds_snatcher_sdk/features/log/widget/history_item_widget.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/scan_screen_bloc.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/app_bar/appbar_image_1.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/app_bar/appbar_title.dart';
import 'package:helixworlds_snatcher_sdk/features/widgets/app_bar/custom_app_bar.dart';
import 'package:helixworlds_snatcher_sdk/utils/size_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
                leadingWidth: 20.h,
                height: 100,
                leading: AppbarImage1(
                    svgPath: ImageConstant.imgArrowleft,
                    margin:
                        EdgeInsets.only(left: 10.h, top: 1.v, bottom: 1.v),
                    onTap: () {
                      context.read<ScanScreenPageBloc>().add(ScanScreenGetStartedEvent());
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "Scan History"),
                styleType: Style.bgShadow),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 1.v),
                  Expanded(
                      child: BlocSelector<ScanScreenPageBloc, ScanScreenState,
                              List<MyLogModel>>(
                          selector: (state) => state is ScanScreenViewLogsState ? state.logs  : [],
                          builder: (context, historyModelObj) {
                            return ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 1.v);
                                },
                                itemCount:
                                    historyModelObj.length,
                                itemBuilder: (context, index) {
                                  return HistoryItemWidget(historyModelObj[index]);
                                });
                          })),
                  Container(
                      height: 130.v,
                      width: double.maxFinite,
                      decoration:
                          BoxDecoration(color: appTheme.gray900, boxShadow: [
                        BoxShadow(
                            color: appTheme.blueGray800,
                            spreadRadius: 2.h,
                            blurRadius: 2.h,
                            offset: const Offset(0, 1))
                      ]))
                ]))));
  }
}