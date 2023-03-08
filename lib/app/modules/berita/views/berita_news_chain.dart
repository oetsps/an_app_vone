import 'dart:convert';
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../../data/mockdata/singlenews_dummy.dart';
import '../../../routes/app_bottom_bar.dart';
import '../../../routes/app_menu.dart';
import '../../login/views/login_antara.dart';
import '../../resource/color.dart';
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
          Column(
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
                          : GestureDetector(
                        // onTap: () {},
                        onTap: () => {
                          postData.setSingleNewsView(i)
                        },
                        child: Image.network(
                          postData.urlNewsListPhotoSmall(i),
                          alignment:Alignment.center,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            // onTap: () {},
                            onTap: () => {
                              postData.setSingleNewsView(i)
                            },
                            child: Container(
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
                          ),
                          SizedBox(
                            height: 14,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  child: Text(
                                    // postData.getReadNewsCategory(),
                                    postData.getNewsListCategory(i),
                                    style: TextStyle(
                                      fontSize: 8,
                                      // color: Colors.red,
                                      color: anTabBarColor[TopikCategory[postData.topik.index]],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                GestureDetector(
                                  // onTap: () {},
                                  onTap: (() => Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return const Login();
                                      }
                                  ))),
                                  child: SizedBox(
                                    width: 14,
                                    child: Image.asset(
                                      'assets/icons/ic_heart.png',
                                      fit: BoxFit.contain,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                SizedBox(
                                  width: 14,
                                  child: Image.asset(
                                    'assets/icons/ic_chat.png',
                                    fit: BoxFit.contain,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 4),
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
      ]),
    );
  }
}

class SingleNewsView extends StatelessWidget {
  const SingleNewsView({
    Key? key,
    required this.postData,
    // required this.idx,
  }) : super(key: key);

  final DataHome postData;
  // final int idx;

  @override
  Widget build(BuildContext context) {
    postData.rstSingleNewsView();
    // return postData.repChainNewsHtml[postData.singleNewsIdx].isNotEmpty ?

    // USE DUMMY
    return postData.getSingleNewsHtml().isNotEmpty ?
    CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                child: Image.network(
                  // postData.urlNewsListPhotoSmall(0),
                  // postData.urlNewsListPhotoMedium(0),
                  postData.getSinglePhotoMedium(),
                  // postData.getReadNewsPhoto(),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                child: Html(
                  data: postData.getSingleNewsHtml(),
                ),
              ),
            ]
            )
        )],
    )
        : const Center(
      child: Text(
        'Maaf sedang ada perbaikan.',
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
