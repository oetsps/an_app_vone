import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'sport_repository.dart';

class NewsChain extends StatelessWidget {
  const NewsChain({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    final postData = Provider.of<DataSport>(context);
    return SliverList(
      delegate: SliverChildListDelegate([
        for (int i = 0; i < (postData.loading ? 0 : postData.getNewListLength()); i++)
          GestureDetector(
            onTap: (() => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) {
                return SingleNewsPage(postData: postData,idx: i);
              }
            ))),
            // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SingleNewsPage(idx: i))),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              padding: const EdgeInsets.only(
                top: 2.0, bottom: 2.0
              ),
              margin: const EdgeInsets.only(
                top: 2.0, bottom: 2.0
              ),
              child: SizedBox(
                height: 30,
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 30.0,
                      child: postData.loading
                        ? Image.asset(
                          'assets/images/antara.png',
                          alignment: Alignment.center,
                        )
                        : Image.network(
                          postData.urlNewsListPhotoSmall(i),
                          alignment:Alignment.center,
                        ),
                    ),
                    const SizedBox(width: 3,),
                    Expanded(
                      child: Text(
                        postData.getNewsListTitle(i),
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ]),
    );
  }
}

class SingleNewsPage extends StatelessWidget {
  const SingleNewsPage({
    Key? key,
    required this.postData,
    required this.idx,
  }) : super(key: key);

  final DataSport postData;
  final int idx;

  @override
  Widget build(BuildContext context) {
    // final postData = Provider.of<DataSport>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        // redAntara Color.fromARGB(255, 172, 7, 7),
        backgroundColor: const Color.fromARGB(255, 172, 7, 7),
        centerTitle: true,
        foregroundColor: Colors.white,
        title: SizedBox(
          width: 200,
          child: Image.asset('assets/images/antara_bg.png',)
          )
      ),
      body: postData.repChainNewsHtml[idx].isNotEmpty ?
      WebView(
        initialUrl: 'about:blank',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          WebViewController _controller = controller;
          _controller.loadUrl(
            Uri.dataFromString(
              postData.repChainNewsHtml[idx],
              mimeType: 'text/html',
              encoding: Encoding.getByName('utf-8')
            ).toString()
          );
        },
      )
      : const Center(
        child: Text(
          'Berita tidak ditemukan',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
