import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF0B5D98),
        body: Center(
          child: SizedBox(
            width: Get.width * 0.8,
            height: Get.width * 0.8,
            // child: Image.asset('assets/logo/logo_splash.png'),
            child: Image.asset(
              'assets/images/antara-id.png',
              fit: BoxFit.contain,
              height: 500,
            ),
          ),
        ),
      ),
    );
  }
}