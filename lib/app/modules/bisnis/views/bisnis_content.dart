import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../routes/app_menu.dart';
import 'bisnis_repository.dart';
import 'bisnis_news_chain.dart';


class BisnisNewsList extends StatelessWidget {
  const BisnisNewsList({
    Key? key,
    required TabController tabController,
    required this.tabList,
    required this.pageState,
  }) : _tabController = tabController, super(key: key);

  final TabController _tabController;
  final List<String> tabList;
  final PageTopik pageState;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        controller: _tabController,
        children: [
          // for (String str in tabList)
          ...tabList.map((label) => Builder(
            builder: (context) {
              final postData = Provider.of<DataBisnis>(context);
              postData.setSubTopik(label);
              // postData.getReadNewsData();
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 360,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(5.0),
                        scrollDirection: Axis.vertical,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          late WebViewController _controller;
                          // postData.setSubTopik(label);
                            return postData.loading ?
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                ),
                                height: 1000,
                                child: SpinKitThreeBounce(
                                  duration: const Duration(seconds: 2),
                                  itemBuilder: (BuildContext context, int index) {
                                    return DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: index.isEven ? Colors.black : Colors.grey,
                                      ),
                                    );
                                  },
                                ),
                              )
                              : Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                ),
                                height: 1400,
                                child: WebView(
                                  initialUrl: 'about:blank',
                                  javascriptMode: JavascriptMode.unrestricted,
                                  onWebViewCreated: (controller) {
                                    _controller = controller;
                                    _controller.loadUrl(
                                      Uri.dataFromString(
                                        postData.getHtmlView(),
                                        mimeType: 'text/html',
                                        encoding: Encoding.getByName('utf-8')
                                      ).toString()
                                    );
                                  },
                                ),
                              );
                          }
                        )
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      return NewsChain(label: label);
                    }
                  ),
                ],
              );
            }
          )
            ),
        ],
      );
  }
}
