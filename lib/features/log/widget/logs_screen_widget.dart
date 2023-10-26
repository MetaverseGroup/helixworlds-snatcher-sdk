import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helixworlds_snatcher_sdk/core/const.dart';
import 'package:helixworlds_snatcher_sdk/features/log/data/model/log_model.dart';
import 'package:helixworlds_snatcher_sdk/features/scan/scan_screen_bloc.dart';
import 'package:helixworlds_snatcher_sdk/utils/object_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helixworlds_snatcher_sdk/utils/object_url.dart';


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
  LogsHistoryWidget(this.logs);

  Widget itemWidget(MyLogModel model, BuildContext context){
    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'lib/assets/${ObjectImage.getImage(model.id ?? "")}',
                              width: 50,
                              fit: BoxFit.fitWidth,
                              package: packageName,
                            ),
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
                                context.read<ScanScreenPageBloc>().add(ScanScreenRedirectToUrlEvent(ObjectUrl.getUrl(model.id ?? "")));
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
              children: items,
            ) : const Center(child: Text("No Logs Yet", style: TextStyle(color: Colors.white)));
  }


}