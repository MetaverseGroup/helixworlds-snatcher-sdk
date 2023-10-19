import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helixworlds_snatcher_sdk/models/log_model.dart';
import 'package:helixworlds_snatcher_sdk/utils/object_image.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _GuidePageState();
}

class _GuidePageState extends State<HistoryPage> {
  late final SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
  }

  Future<List<LogModel>> getAllLogs() async {
    final prefs = await SharedPreferences.getInstance();

    var logsString = prefs.getString('logs');

    final logs = <LogModel>[];

    if (logsString != null) {
      final storedLogs = LogModel.decode(logsString);
      logs.addAll(storedLogs);
    }

    return logs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0E0725),
      body: Stack(children: [
        Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/particles.png')),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 48),
              child: SvgPicture.asset(
                'assets/logo.svg',
                width: 150,
              ),
            )),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 80),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Text(
            "You're Scan History",
            style: TextStyle(color: Color(0xffDEFE48), fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            margin: const EdgeInsets.only(top: 120),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: MediaQuery.of(context).size.height * 0.7,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff3F4358).withOpacity(0.6),
            ),
            child: FutureBuilder(
              builder: (context, snapshot) {
                // WHILE THE CALL IS BEING MADE AKA LOADING
                if (!snapshot.hasData) {
                  return const Center(child: Text('Loading'));
                }

                // WHEN THE CALL IS DONE BUT HAPPENS TO HAVE AN ERROR
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }

                // IF IT WORKS IT GOES HERE!
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final model = snapshot.data![index];

                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/${ObjectImage.getImage(model.id)}',
                              width: 50,
                              fit: BoxFit.fitWidth,
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
                                      model.name,
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
                                        model.date,
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
                                  model.game,
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
                                Navigator.of(context).pop(model);
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
                  },
                );
              },
              future: getAllLogs(),
            ),
          ),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.7 + 95,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
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
                  Container(
                    width: 100,
                  ),
                  Container(
                    width: 50,
                  )
                ],
              ),
            ))
      ]),
    );
  }
}
