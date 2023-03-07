import 'package:an_app_vone/app/modules/home/views/rubrik_antara.dart';
import 'package:an_app_vone/app/routes/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/auth_controller.dart';
import '../../../routes/app_bottom_bar.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/app_menu.dart';
import '../../../routes/search_help.dart';
import '../views/berita_repository.dart';
import 'berita_content.dart';

// Berita Screen
class BeritaView extends StatefulWidget {
  const BeritaView({Key? key}) : super(key: key);
  @override
  State<BeritaView> createState() => _BeritaViewState();
}

class _BeritaViewState extends State<BeritaView> with SingleTickerProviderStateMixin {
  late AppTopik topik;
  late PageTopik pageState;
  late String routeTopik;
  late bool singleView;

  late final TabController _tabController;
  final authC = Get.find<AuthController>();

  @override
  void initState() {
    topik = anTopik;
    pageState = anPageState;
    routeTopik = anRouteTopik;
    singleView = anSingleNewsView;
    _tabController = TabController(length: pageState.subTopik[topik.index].length, vsync: this);
    super.initState();
  }

  Size screenSize() {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    final tabList = List.generate(
      pageState.subTopik[topik.index].length,
      (index) => pageState.subTopik[topik.index][index]
    );
    // final postData = Provider.of<DataHome>(context);
    return ChangeNotifierProvider(
      create: ((context) => DataHome()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(/*brightness: Brightness.dark, */primaryColor: Colors.red, primarySwatch: Colors.blue),
          home: DefaultTabController(
            length: pageState.subTopikLength(),
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 89.48,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        SizedBox(
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              setState(() {

                              });
                            },
                          ),
                        ),
                        Expanded(
                          // height: 24.48,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            // height: 24.48,
                            children: [
                              // SizedBox(width: 100,),
                              SizedBox(
                                height: 24.48,
                                child: Image.asset(
                                  // 'assets/images/antara-id.png',
                                  'assets/images/antara.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(width: 4,),
                              SizedBox(
                                height: 24.48/2,
                                child: Image.asset(
                                  // 'assets/images/antara-id.png',
                                  'assets/images/text_antara_appbar.png',
                                  fit: BoxFit.contain,
                                  color: Colors.black,
                                ),
                              ),
                              // SizedBox(width: 90,),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: PopupMenuButton(
                            icon: const Icon(Icons.list),
                            itemBuilder: (context) =>
                              authC.getLoginStatus() ? popupMenuLoggedIn : popupMenu,
                            onSelected: (String newValue) {
                              if (newValue != routeTopik) {
                                var _change = false;
                                // Declare as below in case common page applied
                                switch(newValue) {
                                  case Routes.HOME:
                                    anTopik = AppTopik.Berita;
                                    _change = true;
                                    break;
                                  case Routes.BERITA:
                                    anTopik = AppTopik.Berita;
                                    _change = true;
                                    break;
                                  case Routes.BISNIS:
                                    anTopik = AppTopik.Ekonomi;
                                    _change = true;
                                    break;
                                  case Routes.SPORT:
                                    anTopik = AppTopik.Sport;
                                    _change = true;
                                    break;
                                  case Routes.BOLA:
                                    anTopik = AppTopik.Bola;
                                    _change = true;
                                    break;
                                  case Routes.LIFESTYLE:
                                    anTopik = AppTopik.Lifestyle;
                                    _change = true;
                                    break;
                                  case Routes.FOTO:
                                    anTopik = AppTopik.Foto;
                                    _change = true;
                                    break;
                                  default:
                                    break;
                                }
                                if(_change) {
                                  anPageState = PageTopik(anTopik);
                                  anSingleNewsView = false;
                                  anRouteTopik = newValue;
                                  Get.offAllNamed(newValue);
                                }
                              }
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 33,
                        // width: 58,
                        width: 58.8,
                        decoration: BoxDecoration (
                          color: anTabBarColor[TopikCategory[topik.index]],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 8,),
                            Text(
                              pageState.getName(),
                              style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 1,
                        color: Colors.white,
                      ),
                      Container(
                        // width: 301,
                        width: screenSize().width - (58.8 + 1),
                        height: 33,
                        color: anTabBarColor[TopikCategory[topik.index]],
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TabBar(
                            indicatorSize: TabBarIndicatorSize.label,
                            controller: _tabController,
                            padding: const EdgeInsets.only(bottom: 4, top: 4),
                            indicatorColor: Colors.white,
                            indicatorWeight: 1,
                            isScrollable: true,
                            tabs: [
                              ...tabList.map((label) => Tab(
                                    child: Text(label),
                                    // height: 30,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: HomeNewsList(tabController: _tabController, tabList: tabList, pageState: pageState),
                  ),
                  const BottomBar(),
                ],
              ),
            ),
          ),
      )
    );
  }
}
