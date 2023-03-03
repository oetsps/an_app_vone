import 'package:an_app_vone/app/modules/home/views/rubrik_antara.dart';
import 'package:an_app_vone/app/routes/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/auth_controller.dart';
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

  late final TabController _tabController;
  final authC = Get.find<AuthController>();

  @override
  void initState() {
    topik = anTopik;
    pageState = anPageState;
    routeTopik = anRouteTopik;
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
                            onPressed: () { },
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
                                // Declare as below in case common page applied
                                switch(newValue) {
                                  case Routes.HOME:
                                    anTopik = AppTopik.Berita;
                                    anPageState = PageTopik(anTopik);
                                    anRouteTopik = newValue;
                                    break;
                                  case Routes.BERITA:
                                    anTopik = AppTopik.Berita;
                                    anPageState = PageTopik(anTopik);
                                    anRouteTopik = newValue;
                                    break;
                                  case Routes.BISNIS:
                                    anTopik = AppTopik.Ekonomi;
                                    anPageState = PageTopik(anTopik);
                                    anRouteTopik = newValue;
                                    break;
                                  case Routes.SPORT:
                                    anTopik = AppTopik.Sport;
                                    anPageState = PageTopik(anTopik);
                                    anRouteTopik = newValue;
                                    break;
                                  case Routes.BOLA:
                                    anTopik = AppTopik.Bola;
                                    anPageState = PageTopik(anTopik);
                                    anRouteTopik = newValue;
                                    break;
                                  default:
                                    break;
                                }
                                Get.offAllNamed(newValue);
                              }
                            },
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
                        decoration: const BoxDecoration (
                          color: Color.fromARGB(0xFF, 0xA3, 0x09, 0x30),
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
                        color: const Color.fromARGB(0xFF, 0xA3, 0x09, 0x30),
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
                ],
              ),
            ),
          ),
      )
    );
  }
}
