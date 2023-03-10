import 'package:flutter/material.dart';
import 'package:get/get.dart';

class P2Controller extends GetxController {
  var isPlayerOneTurn = true.obs;
  var totalSticks = 21.obs;
  var pickedSticks = 0.obs;
  var winner = "".obs;
  var console = <Widget>[const Text("New Game Started with 21 Sticks")].obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
  }

  onClear() {
    isPlayerOneTurn.value = true;
    totalSticks.value = 21;
    pickedSticks.value = 0;
    winner.value = "";
    console.value = [const Text("New Game Started with 21 Sticks")];
  }

  onP1ValuePicked(value) {
    if (totalSticks > 4) {
      pickedSticks.value = value;
      totalSticks.value = totalSticks.value - pickedSticks.value;
      consoleUpdate();
      isPlayerOneTurn.value = !isPlayerOneTurn.value;
      checkGameOver();
      print("total sticks is greater than 4");
    } else {
      if (totalSticks.value <= value) {
        Get.snackbar("Alert", "You must not pick all the sticks, that way you will lose");
      } else {
        pickedSticks.value = value;
        totalSticks.value = totalSticks.value - pickedSticks.value;
        consoleUpdate();
        isPlayerOneTurn.value = !isPlayerOneTurn.value;
        checkGameOver();
        print("total sticks is less than 4");
      }
    }
    print(totalSticks.value);
    print(pickedSticks.value);
  }

  checkGameOver() {
    if (totalSticks.value <= 1) {
      if (isPlayerOneTurn.value != true) {
        console.add(const Text("Player 1 Wins"));
        winner.value = "Player 1";
      } else {
        console.add(const Text("Player 2 Wins"));
        winner.value = "Player 2";
      }
    }
  }

  consoleUpdate() {
    if (totalSticks.value >= 1) {
      if (isPlayerOneTurn.value == true) {
        console.add(Text("Player 1 picked $pickedSticks Sticks"));
      } else {
        console.add(Text("Player 2 picked $pickedSticks Sticks"));
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
    // scrollController.keepScrollOffset;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
