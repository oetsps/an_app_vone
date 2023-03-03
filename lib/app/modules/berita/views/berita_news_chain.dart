import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../views/berita_repository.dart';

class NewsChain extends StatelessWidget {
  const NewsChain({Key? key, required this.label,}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    final postData = Provider.of<DataHome>(context);
    Size screenSize() {
      return MediaQuery.of(context).size;
    }
    return SliverList(
      delegate: SliverChildListDelegate([
        const SizedBox(height: 8),
        for (int i = 9; i < (postData.loading ? 5 : postData.getNewListLength()); i++)
          GestureDetector(
            onTap: (() => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) {
                return SingleNewsPage(postData: postData,idx: i);
              }
            ))),
            // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SingleNewsPage(idx: i))),
            child: Column(
              children: [
                SizedBox(
                  height: 59,
                  child: Row(
                    children: [
                      SizedBox(width: 16,),
                      Container(
                        width: 104,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: postData.loading ?
                        Image.asset(
                          'assets/images/antara.png',
                          alignment: Alignment.center,
                        )
                        : Image.network(
                          postData.urlNewsListPhotoSmall(i),
                          alignment:Alignment.center,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: 8,),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 45,
                              alignment: Alignment.topLeft,
                              child: Text(
                                postData.getNewsListTitle(i),
                                softWrap: true,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 14,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                    child: Text(
                                      postData.getReadNewsCategory(),
                                      style: const TextStyle(
                                        fontSize: 8,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  SizedBox(
                                    width: 14,
                                    child: Image.asset(
                                      'assets/icons/ic_heart.png',
                                      fit: BoxFit.contain,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  SizedBox(
                                    width: 14,
                                    child: Image.asset(
                                      'assets/icons/ic_chat.png',
                                      fit: BoxFit.contain,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  SizedBox(
                                    width: 12,
                                    child: Image.asset(
                                      'assets/icons/ic_send.png',
                                      fit: BoxFit.contain,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Expanded(child: Container(),),
                                  const Icon(
                                    Icons.access_time,
                                    color: Colors.black,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 2),
                                  const Text(
                                    '17 Menit',
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16,),
                    ],
                  ),
                ),
                SizedBox(height: 8,)
              ],
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

  final DataHome postData;
  final int idx;

  @override
  Widget build(BuildContext context) {
    // final postData = Provider.of<DataHome>(context, listen: false);
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
