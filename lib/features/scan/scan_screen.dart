
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helixworlds_snatcher_sdk/core/const.dart';
import 'package:helixworlds_snatcher_sdk/core/service_di.dart';
import 'package:helixworlds_snatcher_sdk/features/guide/guide_widget.dart';
import 'package:helixworlds_snatcher_sdk/features/log/widget/logs_screen_widget.dart';
import 'scan_screen_bloc.dart';

class ScanScreenWidget extends StatelessWidget {

  static Widget builder(BuildContext context) {
    return BlocProvider<ScanScreenPageBloc>(
        create: (context) => ScanScreenPageBloc(getUserDetailsRepo(), getLogLocalDS(), scanRepository(), getImagePicker(), getHelperUtil()),
        child: ScanScreenWidget()
    );
  }


  Widget content(BuildContext context){
    return BlocBuilder<ScanScreenPageBloc, ScanScreenState>(
          bloc: context.read<ScanScreenPageBloc>(),
          builder: (context, state) {
          if(state is ScanScreenLoadingState){
            return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              margin: const EdgeInsets.only(top: 120),
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff3F4358).withOpacity(0.6),
              ),
              child: const Center(child: CircularProgressIndicator()),
            ),
          );

        } else if(state is ScanScreenShowScannedObjectState){
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              margin: const EdgeInsets.only(top: 120),
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff3F4358).withOpacity(0.6),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.52,
                    width: double.infinity,
                    child: Center(
                      child: SvgPicture.asset(
                        "lib/assets/${state.object?.image ?? ""}",
                        width: MediaQuery.of(context).size.width - 100,
                        fit: BoxFit.fitWidth,
                        package: packageName,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      state.object?.name ?? "",
                      style: const TextStyle(fontSize: 40, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
      } else if(state is ScanScreenFailure){
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              margin: const EdgeInsets.only(top: 120),
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff3F4358).withOpacity(0.6),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 160,
                  ),
                  Text(
                    state.message,
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
      } else if(state is ScanScreenInitialState) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              margin: const EdgeInsets.only(top: 120),
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff3F4358).withOpacity(0.6),
              ),
              child: const Column(
                children: [
                  SizedBox(
                    height: 160,
                  ),
                  Text(
                    'Scan items',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'gain rewards',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
      } else if(state is ScanScreenShowGuideState) {
        return GuideDetailsWidget();
      } else if(state is ScanScreenViewLogsState){
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              margin: const EdgeInsets.only(top: 120),
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff3F4358).withOpacity(0.6),
              ),
              child: LogsHistoryWidget(state.logs),
            ),
          );
      } else {
        return Container();
      }
    });
  }


  Widget buttonPlacement(BuildContext context){
    return BlocBuilder<ScanScreenPageBloc, ScanScreenState>(builder: (context, state) {
      if(state is ScanScreenShowScannedObjectState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              InkWell(
                        onTap: () {
                          context.read<ScanScreenPageBloc>().add(ScanScreenBackEvent("/"));
                        },
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: Color(0xff3F4358),
                            child: Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                            ),
                          ),
                        ),
              ),
              InkWell(
                      onTap: () async {
                        context.read<ScanScreenPageBloc>().add(ScanScreenLaunchToUrlEvent(state.object!));
                      },
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 49,
                          backgroundColor: Color(0xffDEFE48),
                          child: Icon(Icons.shopify_outlined, size: 50)
                          // child: Image.asset(
                          //   shopIcon,
                          //   width: 50,
                          // ),
                        ),
                      ),
              ),
              const SizedBox(width:50),
           ]);
      } else if(state is ScanScreenInitialState || state is ScanScreenFailure) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
                    InkWell(
                        onTap: () async {
                          context.read<ScanScreenPageBloc>().add(ScanScreenViewLogsEvent());
                        },
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: Color(0xff3F4358),
                            child: Icon(Icons.history, size: 25)
                            // child: Image.asset(
                            //   helpIcon,
                            //   width: 25,
                            // ),
                          ),
                        ),
                    ),

                    InkWell(
                      onTap: () async {
                        context.read<ScanScreenPageBloc>().add(ScanScreenTakePictureEvent());
                      },
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 49,
                          backgroundColor: Color(0xffDEFE48),
                          child: Icon(Icons.camera_alt, size: 50)
                          // child: Image.asset(
                          //   cameraIcon,
                          //   width: 50,
                          // ),
                        ),
                      ),
                    ),

                    InkWell(
                        onTap: () async {
                          context.read<ScanScreenPageBloc>().add(ScanScreenViewGuideEvent());
                        },
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: Color(0xff3F4358),
                            child: Icon(Icons.help, size: 25)
                          ),
                        ),
                    )
        ]);         
      } else if(state is ScanScreenShowGuideState){
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            InkWell(
                          onTap: () async {
                            context.read<ScanScreenPageBloc>().add(ScanScreenBackEvent("/"));
                          },
                          child: const CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: Color(0xff3F4358),
                              child: Icon(Icons.arrow_back_ios)
                            ),
                          ),
          )
        ]);
      } else if(state is ScanScreenViewLogsState){
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            InkWell(
                          onTap: () async {
                            context.read<ScanScreenPageBloc>().add(ScanScreenBackEvent("/"));
                          },
                          child: const CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: Color(0xff3F4358),
                              child: Icon(Icons.arrow_back_ios)
                            ),
                          ),
          )
        ]);
      } else {
        return Container();
      }
    
    
    });
  }

  Widget userIdDetails(BuildContext context){
    return BlocBuilder<ScanScreenPageBloc, ScanScreenState>(builder: (context, state) {
      if(state is ScanScreenShowScannedObjectState) {
          return Positioned(
                  bottom: 40,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'UserId : ${state.userId.isNotEmpty ? state.userId : 'User Id not found'}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
          );
      } else {
        return Container();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build    
    return Scaffold(
      backgroundColor: const Color(0xff0E0725),
      body: Stack(children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 48),
              child: SvgPicture.asset(
                "lib/assets/logo.svg",
                width: 150,
                package: packageName,
              ),
        )),
        content(context),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.7 + 65,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width:MediaQuery.of(context).size.width * 0.79,
                    child:buttonPlacement(context)
                  ),
                ],
              ),
        )),
        userIdDetails(context)
      ]),
    );

  }


}