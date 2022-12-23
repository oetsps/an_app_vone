import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:an_app_vone/app/widgets/splash.dart';

import 'app/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';


void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var scrollController = ScrollController();
  final authC = Get.put(AuthController(), permanent: true);

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            final authC = Get.find<AuthController>();
            return StreamBuilder<User?>(
              stream: authC.streamAuthStatus,
              builder: (context, snapshot) {
                authC.setLoginStatus(snapshot.data != null);
                // print('snapshot data: ${snapshot.data}');
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "Antara News",
                  initialRoute: Routes.HOME,
                  getPages: AppPages.routes,
                );
              }
            );
          }
        }
    );
  }
}
