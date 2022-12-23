import 'package:get/get.dart';

import '../controllers/sport_controller.dart';

class SportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SportController>(
      () => SportController(),
    );
  }
}
