import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/app_menu.dart';
import '../../../routes/search_help.dart';
import 'sport_repository.dart';
import 'sport_content.dart';

// Sport Screen
class SportView extends StatefulWidget {
  const SportView({Key? key}) : super(key: key);
  @override
  State<SportView> createState() => _SportViewState();
}

class _SportViewState extends State<SportView> with SingleTickerProviderStateMixin {
  PageTopik pageState = PageTopik(AppTopik.Sport);
  String routeTopik = Routes.SPORT;

  late final TabController _tabController;
  // late WebViewController _controller;
  final authC = Get.find<AuthController>();

  @override
  void initState() {
    _tabController = TabController(length: pageState.subTopik[AppTopik.Sport.index].length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabList = List.generate(
      pageState.subTopik[AppTopik.Sport.index].length,
      (index) => pageState.subTopik[AppTopik.Sport.index][index]
    );
    return ChangeNotifierProvider(
      create: ((context) => DataSport()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(/*brightness: Brightness.dark, */primaryColor: Colors.red, primarySwatch: Colors.blue),
          home: DefaultTabController(
            length: pageState.subTopikLength(),
            child: Scaffold(
              body: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  // final postData = Provider.of<DataSport>(context);
                  return [
                    SliverAppBar(
                      leading: PopupMenuButton(
                        color: const Color.fromARGB(255, 241, 220, 218),
                        icon: const Icon(Icons.list),
                        itemBuilder: (context) =>
                            authC.getLoginStatus() ? popupMenuLoggedIn : popupMenu,
                        onSelected: (String newValue) {
                          if (newValue != routeTopik) {
                            // Navigator.of(context).pushNamed(newValue);
                            Get.offAllNamed(newValue);
                          }
                        },
                      ),
                      expandedHeight: 200.0,
                      floating: true,
                      pinned: true,
                      snap: true,
                      actionsIconTheme: const IconThemeData(opacity: 0.7),
                      title: Text(
                        pageState.getName(),
                        style: const TextStyle(color: Colors.orangeAccent),
                      ),
                      actions: [
                        IconButton(
                          color: Colors.white,
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            showSearch(
                              context: context,
                              delegate: CustomSearchDelegate(),
                            );
                          },
                        ),
                      ],
                      flexibleSpace: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Image.asset(
                              'assets/images/antara_bg.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      bottom: TabBar(
                        controller: _tabController,
                        indicatorColor: Colors.orangeAccent,
                        indicatorWeight: 4,
                        isScrollable: true,
                        tabs: [
                          ...tabList.map((label) => Tab(
                                child: Text(label),
                              )),
                        ],
                      ),
                    ),
                  ];
                },
                body: SportNewsList(tabController: _tabController, tabList: tabList, pageState: pageState),
              ),
            ),
          ),
      )
    );
  }
}
