
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:helixworlds_snatcher_sdk/core/const.dart';
import 'package:helixworlds_snatcher_sdk/core/service_di.dart';

import 'scan_screen_bloc.dart';

class ScanScreenWidget extends StatelessWidget {

  static Widget builder(BuildContext context) {
    
    return BlocProvider<ScanScreenPageBloc>(
        create: (context) =>
            ScanScreenPageBloc(getImageDetector(), getUserDetailsRepo(), getLogLocalDS()),
        child: ScanScreenWidget()
    );
  }


  Widget content(BuildContext context){
    return BlocBuilder<ScanScreenPageBloc, ScanScreenState>(
      bloc: context.read<ScanScreenPageBloc>(),
      builder: (context, state) {
      if(state is ScanScreenLoadingState){
        return const Center(child: CircularProgressIndicator());
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
                      child: Image.asset(
                        'assets/${state.object!.image}',
                        width: MediaQuery.of(context).size.width - 100,
                        fit: BoxFit.fitWidth,
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
      } else {
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
      }
    });
  }


  Widget buttonPlacement(BuildContext context){
    return BlocBuilder<ScanScreenPageBloc, ScanScreenState>(builder: (context, state) {
      if(state is ScanScreenShowScannedObjectState) {
          return
           Row(children:[
              InkWell(
                        onTap: () {
                          context.read<ScanScreenPageBloc>().add(ScanScreenBackEvent());
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
                        context.read<ScanScreenPageBloc>().add(ScanScreenLaunchToUrlEvent());
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 49,
                          backgroundColor: const Color(0xffDEFE48),
                          child: Image.asset(
                            shopIcon,
                            width: 50,
                          ),
                        ),
                      ),
              ),
              Container(
                      width: 50,
                    ),
                    InkWell(
                      onTap: () {
                        // go to guide page
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //       builder: (context) => const GuidePage()),
                        // );
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: const Color(0xff3F4358),
                          child: Image.asset(
                            helpIcon,
                            width: 25,
                          ),
                        ),
                      ),
                    )
           ]);
      } else if(state is ScanScreenInitialState) {
        return Row(children:[
                    InkWell(
                      onTap: () async {
                        context.read<ScanScreenPageBloc>().add(ScanScreenTakePictureEvent());
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 49,
                          backgroundColor: const Color(0xffDEFE48),
                          child: Image.asset(
                            cameraIcon,
                            width: 50,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () async {
                          context.read<ScanScreenPageBloc>().add(ScanScreenViewLogsEvent());
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: const Color(0xff3F4358),
                            child: Image.asset(
                              historyIcon,
                              width: 25,
                            ),
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
            alignment: Alignment.bottomCenter,
            child: Image.asset(particleBackground)),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 48),
              child: Image.asset(
                particleBackground,
                width: 150,
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
                  buttonPlacement(context),
                ],
              ),
        )),
        userIdDetails(context)
      ]),
    );

  }


}