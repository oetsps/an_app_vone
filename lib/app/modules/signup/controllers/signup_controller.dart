import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var markCheckBox = false.obs;
  
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  void onClose() {
    nameC.dispose();
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
