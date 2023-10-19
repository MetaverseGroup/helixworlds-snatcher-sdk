import 'package:flutter/material.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

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
              child: Image.asset(
                'assets/logo.png',
                width: 150,
              ),
            )),
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
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Guidance',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Snatcher is a product detection mobile application allowing you to gain in-game and real-world rewards for finding items as you play the games you love.',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Scan items using your phone and access rewards following the steps below. ',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: const Color(0xffDEFE48),
                        child: Image.asset(
                          'assets/camera.png',
                          width: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Flexible(
                      child: Text(
                        'To begin your journey and scan your first item, click the camera icon.',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: const Color(0xff3F4358),
                        child: Image.asset(
                          'assets/history.png',
                          width: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Flexible(
                      child: Text(
                        'To view your scan history and access your previous detections, click the history icon. ',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: const Color(0xffDEFE48),
                        child: Image.asset(
                          'assets/shop.png',
                          width: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Flexible(
                      child: Text(
                        'Having successfully scanned an item, you can access the brands online store by clicking the shop icon',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                const Row(
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
