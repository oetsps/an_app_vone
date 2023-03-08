import 'package:get/get.dart';

import '../modules/berita/bindings/berita_binding.dart';
import '../modules/berita/views/berita_view.dart';
import '../modules/english/bindings/english_binding.dart';
import '../modules/english/views/english_view.dart';
import '../modules/foto/bindings/foto_binding.dart';
import '../modules/foto/views/foto_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/infografik/bindings/infografik_binding.dart';
import '../modules/infografik/views/infografik_view.dart';
import '../modules/lifestyle/bindings/lifestyle_binding.dart';
import '../modules/lifestyle/views/lifestyle_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/more/bindings/more_binding.dart';
import '../modules/more/views/more_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_antara.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_antara.dart';
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
      // page: () => HomeView(),
      // binding: HomeBinding(),
      page: () => const BeritaView(),
      binding: BeritaBinding(),
    ),
    GetPage(
      name: _Paths.BISNIS,
      // page: () => BisnisView(),
      // binding: BisnisBinding(),
      page: () => const BeritaView(),
      binding: BeritaBinding(),
    ),
    GetPage(
      name: _Paths.SPORT,
      // page: () => SportView(),
      // binding: SportBinding(),
      page: () => const BeritaView(),
      binding: BeritaBinding(),
    ),
    GetPage(
      name: _Paths.BOLA,
      // page: () => BolaView(),
      // binding: BolaBinding(),
      page: () => const BeritaView(),
      binding: BeritaBinding(),
    ),
    GetPage(
      name: _Paths.LIFESTYLE,
      // page: () => LifestyleView(),
      // binding: LifestyleBinding(),
      page: () => const BeritaView(),
      binding: BeritaBinding(),
    ),
    GetPage(
      name: _Paths.FOTO,
      // page: () => FotoView(),
      // binding: FotoBinding(),
      page: () => const BeritaView(),
      binding: BeritaBinding(),
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
      // page: () => const ProfileView(),
      page: () => const Profile(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      // page: () => SignupView(),
      page: () => SignUp(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.BERITA,
      page: () => const BeritaView(),
      binding: BeritaBinding(),
    ),
  ];
}
