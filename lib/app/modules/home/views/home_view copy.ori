import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/app_menu.dart';
import '../../../routes/search_help.dart';
import '../views/home_repository.dart';
import 'home_content.dart';

// Berita Screen
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  PageTopik pageState = PageTopik(AppTopik.Berita);
  String routeTopik = Routes.HOME;

  late final TabController _tabController;
  // late WebViewController _controller;
  final authC = Get.find<AuthController>();

  @override
  void initState() {
    _tabController = TabController(length: pageState.subTopik[AppTopik.Berita.index].length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabList = List.generate(
      pageState.subTopik[AppTopik.Berita.index].length,
      (index) => pageState.subTopik[AppTopik.Berita.index][index]
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
                    height: 70,
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 30,
                            padding: const EdgeInsets.all(4),
                            child: Image.asset(
                              'assets/images/antara-id.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          child: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              showSearch(
                                context: context,
                                delegate: CustomSearchDelegate(),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          child: PopupMenuButton(
                            icon: const Icon(Icons.list),
                            itemBuilder: (context) =>
                              // userLog ? popupMenuLoggedIn : popupMenu,
                              authC.getLoginStatus() ? popupMenuLoggedIn : popupMenu,
                            onSelected: (String newValue) {
                              if (newValue != routeTopik) {
                                // Navigator.of(context).pushNamed(newValue);
                                Get.offAllNamed(newValue);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 34,
                    color: Color.fromARGB(255, 156, 27, 18),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        controller: _tabController,
                        indicatorColor: Colors.orangeAccent,
                        indicatorWeight: 4,
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
                  Expanded(
                    child: HomeNewsList(tabController: _tabController, tabList: tabList, pageState: pageState),
                  ),
                ],
              ),
            ),
          ),
      )
    );
  }
}
