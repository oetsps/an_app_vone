import 'dart:convert';

import 'package:an_app_vone/app/data/mockdata/dummy.dart';
import 'package:an_app_vone/app/modules/resource/color.dart';
import 'package:an_app_vone/app/modules/resource/string.dart';
import 'package:flutter/material.dart';
import './custom_bottomsheet.dart';
import 'app_bottom_bar.dart';

class SearchPage extends StatefulWidget {
  final String searchText;
  SearchPage({Key? key, required this.searchText}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/images/dummy_ads_one.png',
      'assets/images/dummy_ads_two.png'
    ];

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
              Image.asset(
                'assets/images/text_antara_appbar.png',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 52,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: ColorClass.GREY_BUTTON,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              widget.searchText,
                              style: const TextStyle(
                                fontSize: 11,
                                color: ColorClass.BLACK_TEXT,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButtonWOutline2(
                    icon: "assets/icons/icon_filter.png",
                    text: StringClass.FILTER_TEXT,
                    icon2: "assets/icons/icon_down_arrow.png",
                    determineAction: "PoppingOutBottomSheet",
                  ),
                ],
              ),
              GridView.builder(
                itemCount: images.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(
                          jsonEncode(Dummy.get_news[index]['photo_medium'])
                              .replaceAll("\"", "")),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          jsonEncode(Dummy.get_news[index]['title'])
                              .replaceAll("\"", ""),
                        ),
                      ),
                      subtitle: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Text("Berita"),
                              ),
                              GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child:
                                      Image.asset('assets/icons/ic_heart.png'),
                                ),
                                onTap: () {},
                              ),
                              GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child:
                                      Image.asset('assets/icons/ic_chat.png'),
                                ),
                                onTap: () {},
                              ),
                              GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child:
                                      Image.asset('assets/icons/ic_send.png'),
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child:
                                      Image.asset('assets/icons/ic_time.png'),
                                ),
                                onTap: () {},
                              ),
                              Text("17 Menit")
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: Dummy.get_news.length,
                ),
              ),
              const BottomBar(),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => const Login()),
              //     );
              //   },
              //   child: Text("Go To Login Page"),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showBottomSheet(
            context: context,
            builder: (context) => Container(
                  color: Colors.red,
                ));
      },
    );
  }
}
