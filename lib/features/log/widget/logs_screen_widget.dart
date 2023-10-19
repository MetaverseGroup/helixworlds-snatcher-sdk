


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child: const Text("Display logs", style: TextStyle(color: Colors.white)));
  }


}