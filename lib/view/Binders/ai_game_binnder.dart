import 'package:get/instance_manager.dart';
import 'package:last_stick_standing/Controllers/ai_controller.dart';

class AiGameBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiController>(() => AiController(), fenix: true);
  }
}
