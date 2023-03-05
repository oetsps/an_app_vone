import 'package:an_app_vone/app/modules/resource/color.dart';
import 'package:an_app_vone/app/modules/resource/string.dart';
import 'package:an_app_vone/app/modules/savednews/savednews_antara.dart';
import 'package:an_app_vone/app/routes/app_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../routes/app_menu.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/search_page.dart';

class RubrikView extends StatefulWidget {
  const RubrikView({Key? key}) : super(key: key);

  @override
  State<RubrikView> createState() => _RubrikViewState();
}

class _RubrikViewState extends State<RubrikView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: ColorClass.BROKEN_WHITE_APPBAR,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 4,),
              Image.asset(
                'assets/images/text_antara_appbar.png',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverGrid.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    children: List.generate(
                      choices.length,
                      (index) {
                        return Center(
                          child: GestureDetector(
                            onTap: () {
                              var reDirect = true;
                              switch(index) {
                                case 0:
                                  anTopik = AppTopik.Berita;
                                  anRouteTopik = Routes.BERITA;
                                  break;
                                case 1:
                                  anTopik = AppTopik.Ekonomi;
                                  anRouteTopik = Routes.BISNIS;
                                  break;
                                case 2:
                                  anTopik = AppTopik.Sport;
                                  anRouteTopik = Routes.SPORT;
                                  break;
                                case 3:
                                  anTopik = AppTopik.Bola;
                                  anRouteTopik = Routes.BOLA;
                                  break;
                                case 4:
                                  anTopik = AppTopik.Lifestyle;
                                  anRouteTopik = Routes.LIFESTYLE;
                                  break;
                                case 5:
                                  anTopik = AppTopik.Foto;
                                  anRouteTopik = Routes.FOTO;
                                  break;
                                default:
                                  reDirect = false;
                                  break;
                              }
                              if(reDirect) {
                                anPageState = PageTopik(anTopik);
                                Get.offAllNamed(anRouteTopik);
                              }
                            },
                            child: SelectCard(
                              choice: choices[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ]
              ),
            ),
            const BottomBar(),
          ]
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String? title;
  final String? icon;
}

List<Choice> choices = <Choice>[
  Choice(
      title: StringClass.BERITA_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_berita.png'),
  Choice(
      title: StringClass.BISNIS_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_bisnis.png'),
  Choice(
      title: StringClass.SPORTS_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_sports.png'),
  Choice(
      title: StringClass.BOLA_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_bola.png'),
  Choice(
      title: StringClass.LIFESTYLE_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_lifestyle.png'),
  Choice(
      title: StringClass.FOTO_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_foto.png'),
  Choice(
      title: StringClass.VIDEO_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_video.png'),
  Choice(
      title: StringClass.ANTARA_GRAFIK_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_antaragrafik.png'),
  Choice(
      title: StringClass.MORE_GRID_TITLE_TEXT,
      icon: 'assets/icons/icon_more.png'),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              choice.icon ?? "",
              fit: BoxFit.contain,
            ),
            Text(
              choice.title ?? "",
            ),
          ],
        ),
      ),
    );
  }
}
