import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_stick_standing/Controllers/2p_controller.dart';

//mandar.r.sonawne@gmail.com
class P2GameBoard extends GetView<P2Controller> {
  const P2GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Text(
                "21 Sticks",
                style: TextStyle(
                  fontSize: size.height * .03,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Total Sticks Remaining : ${controller.totalSticks.value}"),
              Container(
                height: size.height * .35,
                color: Colors.brown.withOpacity(.2),
              ),
              Divider(
                thickness: size.height * .0035,
                color: Colors.black54,
                height: size.height * .01,
              ),
              Container(
                //make a widget list of text and keep adding more text with parameters of values of how many sticks are picked and in ui use listview builder
                height: size.height * .19,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: size.height * .01),
                color: Colors.brown.withOpacity(.2),
                child: ListView.builder(
                  itemCount: controller.console.length,
                  // physics: BouncingScrollPhysics(),
                  controller: controller.scrollController,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return controller.console[index];
                  },
                ),
              ),
              Divider(
                thickness: size.height * .0035,
                color: Colors.black54,
                height: 0,
              ),
              Expanded(
                child: Container(
                  // height: size.height * .2,
                  width: double.infinity,
                  color: Colors.brown.withOpacity(.2),
                  child: controller.winner != ""
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Congrulations ${controller.winner} Wins!!!",
                              style: TextStyle(
                                fontSize: size.height * .03,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Since opponent is left with last stick, You win",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: size.height * .025,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FilledButton.tonal(
                                  onPressed: () {
                                    controller.onClear();
                                  },
                                  child: const Text("Play Again"),
                                ),
                                FilledButton.tonal(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text("HomePage"),
                                )
                              ],
                            )
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Obx(
                              () => Text(
                                controller.isPlayerOneTurn.value ? "Player 1 Turn" : "Player 2 Turn",
                                style: TextStyle(
                                  fontSize: size.height * .03,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              "How many Sticks do you wish to Pick?",
                              style: TextStyle(
                                fontSize: size.height * .025,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Obx(() => FilledButton.tonal(
                                      onPressed: () {
                                        var value = 1;
                                        controller.onP1ValuePicked(value);
                                      },
                                      style: FilledButton.styleFrom(
                                          backgroundColor: controller.isPlayerOneTurn.value
                                              ? Colors.blue.shade400.withOpacity(.8)
                                              : Colors.red.withOpacity(.7)),
                                      child: const Text("1"),
                                    )),
                                Obx(() => FilledButton.tonal(
                                      onPressed: () {
                                        var value = 2;
                                        controller.onP1ValuePicked(value);
                                      },
                                      style: FilledButton.styleFrom(
                                          backgroundColor: controller.isPlayerOneTurn.value
                                              ? Colors.blue.shade400.withOpacity(.8)
                                              : Colors.red.withOpacity(.7)),
                                      child: const Text("2"),
                                    )),
                                Obx(() => FilledButton.tonal(
                                      onPressed: () {
                                        var value = 3;
                                        controller.onP1ValuePicked(value);
                                      },
                                      style: FilledButton.styleFrom(
                                          backgroundColor: controller.isPlayerOneTurn.value
                                              ? Colors.blue.shade400.withOpacity(.8)
                                              : Colors.red.withOpacity(.7)),
                                      child: const Text("3"),
                                    )),
                                Obx(() => FilledButton.tonal(
                                      onPressed: () {
                                        var value = 4;
                                        controller.onP1ValuePicked(value);
                                      },
                                      style: FilledButton.styleFrom(
                                          backgroundColor: controller.isPlayerOneTurn.value
                                              ? Colors.blue.shade400.withOpacity(.8)
                                              : Colors.red.withOpacity(.7)),
                                      child: const Text("4"),
                                    )),
                              ],
                            ),
                          ],
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
