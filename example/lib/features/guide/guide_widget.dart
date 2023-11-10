import 'package:flutter/material.dart';

class GuideDetailsWidget extends StatelessWidget {
  const GuideDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: key,
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
            child: ListView(
              children: const [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Guidance',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Snatcher is a product detection mobile application allowing you to gain in-game and real-world rewards for finding items as you play the games you love.',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Scan items using your phone and access rewards following the steps below. ',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Color(0xffDEFE48),
                        child: Icon(Icons.camera_alt, size: 25),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Flexible(
                      child: Text(
                        'To begin your journey and scan your first item, click the camera icon.',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Color(0xff3F4358),
                        child: Icon(Icons.history, size: 25),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Flexible(
                      child: Text(
                        'To view your scan history and access your previous detections, click the history icon. ',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Color(0xffDEFE48),
                        child: Icon(Icons.shopify_outlined, size: 25),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Flexible(
                      child: Text(
                        'Having successfully scanned an item, you can access the brands online store by clicking the shop icon',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    CircleAvatar(
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
                    SizedBox(
                      width: 12,
                    ),
                    Flexible(
                      child: Text(
                        'You can return to a previous step at any time by clicking the return icon.',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
  }


}