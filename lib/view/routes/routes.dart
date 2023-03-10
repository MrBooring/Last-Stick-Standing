import 'package:get/get.dart';
import 'package:last_stick_standing/view/Binders/2p_game_binder.dart';
import 'package:last_stick_standing/view/Binders/ai_game_binnder.dart';
import 'package:last_stick_standing/view/pages/homescreen.dart';
import 'package:last_stick_standing/view/pages/with2player/2p_gamebord.dart';
import 'package:last_stick_standing/view/pages/withai/ai_gamebord.dart';

var routes = [
  GetPage(
    name: "/",
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: "/P2GameBoard",
    page: () => const P2GameBoard(),
    binding: P2GameBindings(),
  ),
  GetPage(
    name: "/AiGameBoard",
    page: () => const AiGameBoard(),
    binding: AiGameBindings(),
  ),
];
