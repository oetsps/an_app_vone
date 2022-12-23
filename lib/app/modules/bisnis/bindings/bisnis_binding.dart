import 'package:get/get.dart';

import '../controllers/bisnis_controller.dart';

class BisnisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BisnisController>(
      () => BisnisController(),
    );
  }
}
