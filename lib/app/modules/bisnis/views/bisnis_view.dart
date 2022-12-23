import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/app_menu.dart';
import '../../../routes/search_help.dart';
import 'bisnis_repository.dart';
import 'bisnis_content.dart';

// Bisnis Screen
class BisnisView extends StatefulWidget {
  const BisnisView({Key? key}) : super(key: key);
  @override
  State<BisnisView> createState() => _BisnisViewState();
}

class _BisnisViewState extends State<BisnisView> with SingleTickerProviderStateMixin {
  PageTopik pageState = PageTopik(AppTopik.Ekonomi);
  String routeTopik = Routes.BISNIS;

  late final TabController _tabController;
  // late WebViewController _controller;
  final authC = Get.find<AuthController>();

  @override
  void initState() {
    _tabController = TabController(length: pageState.subTopik[AppTopik.Ekonomi.index].length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabList = List.generate(
      pageState.subTopik[AppTopik.Ekonomi.index].length,
      (index) => pageState.subTopik[AppTopik.Ekonomi.index][index]
    );
    return ChangeNotifierProvider(
      create: ((context) => DataBisnis()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(/*brightness: Brightness.dark, */primaryColor: Colors.red, primarySwatch: Colors.blue),
          home: DefaultTabController(
            length: pageState.subTopikLength(),
            child: Scaffold(
              body: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  // final postData = Provider.of<DataBisnis>(context);
                  return [
                    SliverAppBar(
                      leading: PopupMenuButton(
                        color: const Color.fromARGB(255, 241, 220, 218),
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
                body: BisnisNewsList(tabController: _tabController, tabList: tabList, pageState: pageState),
              ),
            ),
          ),
      )
    );
  }
}
