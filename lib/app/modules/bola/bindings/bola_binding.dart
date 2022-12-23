import 'package:get/get.dart';

import '../controllers/bola_controller.dart';

class BolaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BolaController>(
      () => BolaController(),
    );
  }
}
