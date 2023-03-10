import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiController extends GetxController {
  var isPlayerOneTurn = true.obs;
  var totalSticks = 21.obs;
  var pickedSticks = 0.obs;
  var aiPickedSticks = 0.obs;
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
      computerTurn();
    } else {
      if (totalSticks.value <= value) {
        Get.snackbar("Alert", "You must not pick all the sticks, that way you will lose");
      } else {
        pickedSticks.value = value;
        totalSticks.value = totalSticks.value - pickedSticks.value;
        consoleUpdate();
        isPlayerOneTurn.value = !isPlayerOneTurn.value;
        checkGameOver();
        computerTurn();
      }
    }
  }

  computerTurn() {
    if (totalSticks.value > 1) {
      int max = 4;
      if (totalSticks.value >= 4) {
        aiPickedSticks.value = Random().nextInt(max) + 1;
        totalSticks.value = totalSticks.value - aiPickedSticks.value;
        consoleUpdate();
        isPlayerOneTurn.value = !isPlayerOneTurn.value;
        checkGameOver();
        print("object");
      } else {
        max = totalSticks.value;
        aiPickedSticks.value = Random().nextInt(max) + 1;
        totalSticks.value = totalSticks.value - aiPickedSticks.value;
        consoleUpdate();
        isPlayerOneTurn.value = !isPlayerOneTurn.value;
        checkGameOver();
      }
    }
  }

  checkGameOver() {
    if (totalSticks.value <= 1) {
      if (isPlayerOneTurn.value != true) {
        console.add(const Text("Player 1 Wins"));
        winner.value = "Player 1";
      } else {
        console.add(const Text("Ai Wins"));
        winner.value = "Ai";
      }
    }
  }

  consoleUpdate() {
    if (totalSticks.value >= 1) {
      if (isPlayerOneTurn.value == true) {
        console.add(Text("Player 1 picked $pickedSticks Sticks"));
        console.add(Text("Remaining Sticks = $totalSticks"));
      } else {
        console.add(Text("Ai picked $aiPickedSticks Sticks"));
        console.add(Text("Remaining Sticks = $totalSticks"));
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
