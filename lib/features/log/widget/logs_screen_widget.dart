import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helixworlds_snatcher_sdk/core/const.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/model/log_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/scan_screen_bloc.dart';
import 'package:helixworlds_snatcher_sdk/utils/object_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ScanHistoryTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 80),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Text(
            "You're Scan History",
            style: TextStyle(color: Color(0xffDEFE48), fontSize: 20),
            textAlign: TextAlign.center,
          ),
    );
  }
}

class LogsHistoryWidget extends StatelessWidget {
  final List<MyLogModel> logs;
  const LogsHistoryWidget(this.logs, {super.key});

  Widget itemWidget(MyLogModel model, BuildContext context){
    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            context.read<ScanScreenPageBloc>().isLocalItemDetailsFetch ? 
                            
                            Container()
                            // SvgPicture.asset(
                            //   'lib/assets/${ObjectImage.getImage(model.id ?? "")}',
                            //   width: 50,
                            //   fit: BoxFit.fitWidth,
                            //   package: packageName,
                            // ) 
                            :
                            CachedNetworkImage(
                              imageUrl: model.image ?? "",
                              width: MediaQuery.of(context).size.width - 100,
                              fit: BoxFit.fitWidth,
                            ) 
                            ,
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      model.name ?? "",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        model.date ?? "",
                                        style: const TextStyle(
                                          fontSize: 8,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  model.game ?? "",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                context.read<ScanScreenPageBloc>().add(ScanScreenRedirectToUrlEvent(model.url ?? ""));
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            color: Colors.white,
                            height: 3,
                            thickness: 3,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
      );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> items = [];
    for(var i in logs){
      items.add(itemWidget(i, context));
    }

    return logs.isNotEmpty ? ListView(
              shrinkWrap: true,
              children: items,
            ) : const Center(child: Text("No Logs Yet", style: TextStyle(color: Colors.white)));
  }
}

class LogsScreen extends StatelessWidget {
  LogsScreen();

  Widget content(BuildContext context){
    return BlocBuilder<ScanScreenPageBloc, ScanScreenState>(
          bloc: context.read<ScanScreenPageBloc>(),
          builder: (context, state) {
       if(state is ScanScreenViewLogsState){
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
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
                  SizedBox(
                    width:MediaQuery.of(context).size.width * 0.79,
                    child:buttonPlacement(context)
                  ),
                ],
              ),
        )),
      ]),
    ),
    onWillPop: (){
      return Future.value(false);
    },
    
    );
  }

  Widget buttonPlacement(BuildContext context){
    return BlocBuilder<ScanScreenPageBloc, ScanScreenState>(builder: (context, state) {
      if(state is ScanScreenViewLogsState){
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            InkWell(
                          onTap: () async {
                            context.read<ScanScreenPageBloc>().add(ScanScreenBackEvent("/"));
                            Navigator.pop(context);
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


}