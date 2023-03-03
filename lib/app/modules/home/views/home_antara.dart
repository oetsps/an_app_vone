import 'package:an_app_vone/app/modules/login/views/login_antara.dart';
import 'package:an_app_vone/app/modules/profile/views/profile_antara.dart';
import 'package:an_app_vone/app/routes/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/app_menu.dart';
import '../../../routes/search_help.dart';
import '../../resource/color.dart';
import '../views/home_repository.dart';
import 'home_content.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  PageTopik pageState = PageTopik(AppTopik.Berita);
  String routeTopik = Routes.HOME;

  late final TabController _tabController;
  // late WebViewController _controller;
  final authC = Get.find<AuthController>();

  @override
  void initState() {
    _tabController = TabController(
        length: pageState.subTopik[AppTopik.Berita.index].length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabList = List.generate(
        pageState.subTopik[AppTopik.Berita.index].length,
        (index) => pageState.subTopik[AppTopik.Berita.index][index]);

    return ChangeNotifierProvider(
      create: ((context) => DataHome()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: pageState.subTopikLength(),
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: ColorClass.BROKEN_WHITE_APPBAR,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/text_antara_appbar.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size(double.infinity, 57),
                child: Material(
                  color: ColorClass.RED_TAB_BAR,
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SearchPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "ParentRubrik",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: TabBar(
                            controller: _tabController,
                            indicatorColor: Colors.white,
                            indicatorWeight: 1,
                            isScrollable: true,
                            tabs: [
                              ...tabList.map(
                                (label) => Tab(
                                  child: Text(label),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // backgroundColor: const Color(0xff6ae792),
            ),
            body: HomeNewsList(
                tabController: _tabController,
                tabList: tabList,
                pageState: pageState),
          ),
        ),
      ),
    );
  }
}

// indicator: const BoxDecoration(
// border: Border(
// right: BorderSide(
// color: Colors.white,
// width: 1,
// style: BorderStyle.solid,
// ),
// ),
// ),
