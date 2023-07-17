import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Scaffold(
      backgroundColor: Colors.brown.shade300,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Welcome To 21 Sticks Game",
            style: TextStyle(
                fontSize: size.height * .03, fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * .02),
            child: SizedBox(
              width: size.width,
              child: Column(
                children: [
                  Text(
                    "> There are 21 sticks on the table.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.height * .02,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "> You can pick up 1 to 4 sticks at a time.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.height * .02,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "> The player who picks up the last stick loses the game.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.height * .02,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: size.height * .0025,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "2 Players :",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.height * .025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FilledButton.tonal(
                  onPressed: () {
                    Get.toNamed("/P2GameBoard");
                  },
                  style: FilledButton.styleFrom(
                      backgroundColor: Colors.green.shade300),
                  child: const Text("PLAY"),
                )
              ],
            ),
          ),
          Divider(
            thickness: size.height * .002,
            color: Colors.blueGrey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Play With Ai :",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.height * .025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FilledButton.tonal(
                  onPressed: () {
                    Get.toNamed("/AiGameBoard");
                  },
                  style: FilledButton.styleFrom(
                      backgroundColor: Colors.green.shade300),
                  child: const Text("PLAY"),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
