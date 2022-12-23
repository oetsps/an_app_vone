import 'package:get/get.dart';

import '../modules/bisnis/bindings/bisnis_binding.dart';
import '../modules/bisnis/views/bisnis_view.dart';
import '../modules/bola/bindings/bola_binding.dart';
import '../modules/bola/views/bola_view.dart';
import '../modules/english/bindings/english_binding.dart';
import '../modules/english/views/english_view.dart';
import '../modules/foto/bindings/foto_binding.dart';
import '../modules/foto/views/foto_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/infografik/bindings/infografik_binding.dart';
import '../modules/infografik/views/infografik_view.dart';
import '../modules/lifestyle/bindings/lifestyle_binding.dart';
import '../modules/lifestyle/views/lifestyle_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/more/bindings/more_binding.dart';
import '../modules/more/views/more_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/sport/bindings/sport_binding.dart';
import '../modules/sport/views/sport_view.dart';
import '../modules/video/bindings/video_binding.dart';
import '../modules/video/views/video_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.rHOME;
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BISNIS,
      page: () => BisnisView(),
      binding: BisnisBinding(),
    ),
    GetPage(
      name: _Paths.SPORT,
      page: () => SportView(),
      binding: SportBinding(),
    ),
    GetPage(
      name: _Paths.BOLA,
      page: () => BolaView(),
      binding: BolaBinding(),
    ),
    GetPage(
      name: _Paths.LIFESTYLE,
      page: () => LifestyleView(),
      binding: LifestyleBinding(),
    ),
    GetPage(
      name: _Paths.FOTO,
      page: () => FotoView(),
      binding: FotoBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO,
      page: () => VideoView(),
      binding: VideoBinding(),
    ),
    GetPage(
      name: _Paths.INFOGRAFIK,
      page: () => InfografikView(),
      binding: InfografikBinding(),
    ),
    GetPage(
      name: _Paths.ENGLISH,
      page: () => EnglishView(),
      binding: EnglishBinding(),
    ),
    GetPage(
      name: _Paths.MORE,
      page: () => MoreView(),
      binding: MoreBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
  ];
}
