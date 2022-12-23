import 'package:get/get.dart';

import '../controllers/infografik_controller.dart';

class InfografikBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfografikController>(
      () => InfografikController(),
    );
  }
}
