import 'package:get/instance_manager.dart';
import 'package:last_stick_standing/Controllers/2p_controller.dart';

class P2GameBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<P2Controller>(() => P2Controller(), fenix: true);
  }
}
