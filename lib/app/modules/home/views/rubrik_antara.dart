import 'package:an_app_vone/app/modules/resource/color.dart';
import 'package:an_app_vone/app/modules/resource/string.dart';
import 'package:an_app_vone/app/modules/savednews/savednews_antara.dart';
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

  Size screenSize() {
    return MediaQuery.of(context).size;
  }

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
              SizedBox(width: 2,),
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
                              switch(index) {
                                case 0:
                                  anTopik = AppTopik.Berita;
                                  anPageState = PageTopik(anTopik);
                                  anRouteTopik = Routes.BERITA;
                                  break;
                                case 1:
                                  anTopik = AppTopik.Ekonomi;
                                  anPageState = PageTopik(anTopik);
                                  anRouteTopik = Routes.BISNIS;
                                  break;
                                case 2:
                                  anTopik = AppTopik.Sport;
                                  anPageState = PageTopik(anTopik);
                                  anRouteTopik = Routes.SPORT;
                                  break;
                                case 3:
                                  anTopik = AppTopik.Bola;
                                  anPageState = PageTopik(anTopik);
                                  anRouteTopik = Routes.BOLA;
                                  break;
                                default:
                                  anTopik = AppTopik.Berita;
                                  anPageState = PageTopik(anTopik);
                                  anRouteTopik = Routes.BERITA;
                                  break;
                              }
                              Get.offAllNamed(anRouteTopik);
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
            SizedBox(
              height: 73,
              child: Container(
                padding: const EdgeInsets.only(top: 3),
                child: Row(
                    children: [
                      // const SizedBox(width: 36,),
                      Container(width: (screenSize().width - 56*5 - 10*4) / 2),
                      SizedBox(
                        width: 56,
                        height: 57,
                        // color: Colors.grey,
                        child: Row(
                          children: [
                            const SizedBox(width: 9,),
                            Expanded(
                              child: GestureDetector(
                                // onTap: () {},
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const RubrikView(),
                                    ),
                                  );
                                },
                                child: Column(
                                    children: [
                                      SizedBox(height: 6,),
                                      Container(
                                        height: 24,
                                        child: Image.asset(
                                          'assets/icons/Home.png',
                                          fit: BoxFit.contain,
                                          color: Colors.black,
                                        ),
                                      ),
                                      // Icon(Icons.favorite_outline),
                                      SizedBox(height: 8,),
                                      Text('Beranda', style: TextStyle(fontSize: 10),),
                                    ]
                                ),
                              ),
                            ),
                            const SizedBox(width: 9,),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 56,
                        height: 57,
                        // color: Colors.grey,
                        child: Row(
                          children: [
                            const SizedBox(width: 9,),
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SearchPage(),
                                    ),
                                  );
                                },
                                child: Column(
                                    children: [
                                      SizedBox(height: 6,),
                                      Container(
                                        height: 24,
                                        child: Image.asset(
                                          'assets/icons/Search.png',
                                          fit: BoxFit.contain,
                                          color: Colors.black,
                                        ),
                                      ),
                                      // Icon(Icons.favorite_outline),
                                      SizedBox(height: 8,),
                                      Text('Cari', style: TextStyle(fontSize: 10),),
                                    ]
                                ),
                              ),
                            ),
                            const SizedBox(width: 9,),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RubrikView(),
                            ),
                          );
                        },
                        child: Container(
                          width: 56,
                          height: 57,
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),
                          // color: Colors.black,
                          child: Row(
                            children: [
                              const SizedBox(width: 9,),
                              Expanded(
                                child: Column(
                                    children: [
                                      const SizedBox(height: 10,),
                                      SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 8.5,
                                                  height: 8.5,
                                                  decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.all(Radius.circular(2.0))
                                                  ),
                                                ),
                                                const SizedBox(width: 1,),
                                                Container(
                                                  width: 8.5,
                                                  height: 8.5,
                                                  decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.all(Radius.circular(2.0))
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 1,),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 8.5,
                                                  height: 8.5,
                                                  decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.all(Radius.circular(2.0))
                                                  ),
                                                ),
                                                const SizedBox(width: 1,),
                                                Container(
                                                  width: 8.5,
                                                  height: 8.5,
                                                  decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.all(Radius.circular(2.0))
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],

                                        ),
                                      ),
                                      const SizedBox(height: 6,),
                                      const Text('Rubrik', style: TextStyle(fontSize: 10, color: Colors.white),),
                                    ]
                                ),
                              ),
                              const SizedBox(width: 9,),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 56,
                        height: 57,
                        // color: Colors.grey,
                        child: Row(
                          children: [
                            const SizedBox(width: 9,),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Column(
                                    children: [
                                      SizedBox(height: 6,),
                                      Container(
                                        height: 24,
                                        child: Image.asset(
                                          'assets/icons/Heart.png',
                                          fit: BoxFit.contain,
                                          color: Colors.black,
                                        ),
                                      ),
                                      // Icon(Icons.favorite_outline),
                                      SizedBox(height: 8,),
                                      Text('Disuka', style: TextStyle(fontSize: 10),),
                                    ]
                                ),
                              ),
                            ),
                            const SizedBox(width: 9,),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 56,
                        height: 57,
                        padding: EdgeInsets.only(top: 4, bottom: 4),
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                              children: [
                                SizedBox(height: 2,),
                                Container(
                                  height: 26,
                                  child: Image.asset(
                                    'assets/icons/Profile.png',
                                    fit: BoxFit.contain,
                                    color: Colors.black,
                                  ),
                                ),
                                // Icon(Icons.favorite_outline),
                                SizedBox(height: 6,),
                                Text('Akun', style: TextStyle(fontSize: 10),),
                              ]
                          ),
                        ),
                      ),
                    ]
                ),
              ),
            ),
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
