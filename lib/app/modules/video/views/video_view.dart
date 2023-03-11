import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/auth_controller.dart';
import '../../../routes/app_bottom_bar.dart';
import '../../../routes/app_menu.dart';
import 'video_repository.dart';
import 'video_content.dart';

// Berita Screen
class VideoView extends StatefulWidget {
  const VideoView({Key? key}) : super(key: key);
  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> with SingleTickerProviderStateMixin {
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
        create: ((context) => DataVideo()),
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
                    child: VideoNewsList(tabController: _tabController, tabList: tabList, pageState: pageState),
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
