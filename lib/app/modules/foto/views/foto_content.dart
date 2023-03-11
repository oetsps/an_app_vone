import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../routes/app_menu.dart';
import '../../login/views/login_antara.dart';
import './foto_repository.dart';
import './foto_news_chain.dart';


class FotoNewsList extends StatelessWidget {
  const FotoNewsList({
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
              final postData = Provider.of<DataFoto>(context);
              postData.setSubTopik(label);
              Size screenSize() {
                return MediaQuery.of(context).size;
              }
              return Builder(
                  builder: (context) {
                    print(label);
                    return postData.getSingleNewsView() ?
                    Builder(
                        builder: (context) {return SingleNewsView(postData: postData);}
                    )
                    : postData.curSubTopik == "Foto Hardnews" ?
                    CustomScrollView(
                      slivers: [
                        const SliverPadding(padding: EdgeInsets.symmetric(vertical: 2)),
                        SliverGrid(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: (screenSize().width - 16*2) / 192,
                          ),
                          delegate: SliverChildBuilderDelegate (
                                (context, index) {
                              late WebViewController _controller;
                              postData.setSubTopik(label);
                              return postData.loading ?
                              SizedBox(
                                height: screenSize().width / 1.52,
                                child: SpinKitThreeBounce(
                                  duration: const Duration(seconds: 1),
                                  itemBuilder: (BuildContext context, int index) {
                                    return DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: index.isEven ? Colors.grey[600] : Colors.grey[200],
                                      ),
                                    );
                                  },
                                ),
                              )
                                  : GridTile(
                                // header: const SizedBox(height: 4,),
                                footer: Container(
                                  height: 67,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 32,),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                        width: 253,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 30,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                postData.getNewsListTitle(0),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 4,),
                                            Container(
                                              height: 14,
                                              alignment: Alignment.centerLeft,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 40,
                                                    child: Text(
                                                      postData.getNewsListCategory(0),
                                                      style: TextStyle(
                                                        fontSize: 9,
                                                        color: anTabBarColor[TopikCategory[postData.topik.index]],
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 2),
                                                  GestureDetector(
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
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 2),
                                                  SizedBox(
                                                    width: 14,
                                                    child: Image.asset(
                                                      'assets/icons/ic_chat.png',
                                                      fit: BoxFit.contain,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 2),
                                                  SizedBox(
                                                    width: 14,
                                                    child: Image.asset(
                                                      'assets/icons/ic_send.png',
                                                      fit: BoxFit.contain,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(),
                                                  ),
                                                  const Icon(
                                                    Icons.access_time,
                                                    color: Colors.white,
                                                    size: 14,
                                                  ),
                                                  const SizedBox(
                                                    width: 36,
                                                    child: Text(
                                                      '17 Menit',
                                                      style: TextStyle(
                                                        fontSize: 9,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                child: Container(
                                  height: 192,
                                  width: screenSize().width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8,),
                                  child: GestureDetector(
                                    onTap: () => {postData.setSingleNewsView(index)},
                                    child: Image.network(
                                      postData.urlNewsListPhotoMedium(index),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                            childCount: 1,
                          ),
                        ),
                        SliverGrid.count(
                          crossAxisCount: 2,
                          // mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                          childAspectRatio: 160 / 140,
                          // childAspectRatio: ((screenSize().width - 8) / 2) / 140,
                          children: [
                            postData.loading ?
                            SizedBox(
                              child: SpinKitThreeBounce(
                                duration: const Duration(seconds: 1),
                                itemBuilder: (BuildContext context, int index) {
                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: index.isEven ? Colors.grey[600] : Colors.grey[200],
                                    ),
                                  );
                                },
                              ),
                            )
                                : Container(
                              height: 140,
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => {postData.setSingleNewsView(1)},
                                      child: Image.network(
                                        postData.urlNewsListPhotoSmall(1),
                                        // postData.getReadNewsPhoto(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    // color: Colors.grey[300],
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                                      // color: Colors.grey[400],
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 28,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              postData.getNewsListTitle(1),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 4,),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 40,
                                                child: Text(
                                                  // postData.getReadNewsCategory(),
                                                  postData.getNewsListCategory(1),
                                                  style: TextStyle(
                                                    fontSize: 8,
                                                    // color: Colors.red,
                                                    color: anTabBarColor[TopikCategory[postData.topik.index]],
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 2),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            postData.loading ?
                            SizedBox(
                              child: SpinKitThreeBounce(
                                duration: const Duration(seconds: 1),
                                itemBuilder: (BuildContext context, int index) {
                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: index.isEven ? Colors.grey[600] : Colors.grey[200],
                                    ),
                                  );
                                },
                              ),
                            )
                                : Container(
                              height: 140,
                              padding: const EdgeInsets.only(right: 16),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => {postData.setSingleNewsView(2)},
                                      child: Image.network(
                                        postData.urlNewsListPhotoSmall(2),
                                        // postData.getReadNewsPhoto(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    // color: Colors.grey[300],
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                                      // color: Colors.grey[400],
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 28,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              postData.getNewsListTitle(2),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 4,),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 40,
                                                child: Text(
                                                  // postData.getReadNewsCategory(),
                                                  postData.getNewsListCategory(2),
                                                  style: TextStyle(
                                                    fontSize: 8,
                                                    // color: Colors.red,
                                                    color: anTabBarColor[TopikCategory[postData.topik.index]],
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 2),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            postData.loading ?
                            SizedBox(
                              child: SpinKitThreeBounce(
                                duration: const Duration(seconds: 1),
                                itemBuilder: (BuildContext context, int index) {
                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: index.isEven ? Colors.grey[600] : Colors.grey[200],
                                    ),
                                  );
                                },
                              ),
                            )
                                : Container(
                              height: 140,
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => {postData.setSingleNewsView(3)},
                                      child: Image.network(
                                        postData.urlNewsListPhotoSmall(3),
                                        // postData.getReadNewsPhoto(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    // color: Colors.grey[300],
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                                      // color: Colors.grey[400],
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 28,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              postData.getNewsListTitle(3),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 4,),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 40,
                                                child: Text(
                                                  // postData.getReadNewsCategory(),
                                                  postData.getNewsListCategory(3),
                                                  style: TextStyle(
                                                    fontSize: 8,
                                                    // color: Colors.red,
                                                    color: anTabBarColor[TopikCategory[postData.topik.index]],
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 2),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            postData.loading ?
                            SizedBox(
                              child: SpinKitThreeBounce(
                                duration: const Duration(seconds: 1),
                                itemBuilder: (BuildContext context, int index) {
                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: index.isEven ? Colors.grey[600] : Colors.grey[200],
                                    ),
                                  );
                                },
                              ),
                            )
                                : Container(
                              height: 140,
                              padding: const EdgeInsets.only(right: 16),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => {postData.setSingleNewsView(4)},
                                      child: Image.network(
                                        postData.urlNewsListPhotoSmall(4),
                                        // postData.getReadNewsPhoto(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    // color: Colors.grey[300],
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                                      // color: Colors.grey[400],
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 28,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              postData.getNewsListTitle(4),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 4,),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 40,
                                                child: Text(
                                                  // postData.getReadNewsCategory(),
                                                  postData.getNewsListCategory(4),
                                                  style: TextStyle(
                                                    fontSize: 8,
                                                    // color: Colors.red,
                                                    color: anTabBarColor[TopikCategory[postData.topik.index]],
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 2),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SliverPadding(padding: EdgeInsets.symmetric(vertical: 2)),
                        SliverList(
                          delegate: SliverChildListDelegate([
                            const SizedBox(height: 8,),
                            SizedBox(
                              height: 20,
                              child: Row(
                                children: [
                                  const SizedBox(width: 16,),
                                  const Text("Populer di ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                  Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8,),
                          ]),
                        ),
                        SliverGrid.count(
                          crossAxisCount: 2,
                          // mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                          childAspectRatio: 160 / 140,
                          // childAspectRatio: ((screenSize().width - 8) / 2) / 140,
                          children: [
                            postData.loading ?
                            SizedBox(
                              child: SpinKitThreeBounce(
                                duration: const Duration(seconds: 1),
                                itemBuilder: (BuildContext context, int index) {
                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: index.isEven ? Colors.grey[600] : Colors.grey[200],
                                    ),
                                  );
                                },
                              ),
                            )
                                : Container(
                              height: 140,
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => {postData.setSingleNewsView(5)},
                                      child: Image.network(
                                        postData.urlNewsListPhotoSmall(5),
                                        // postData.getReadNewsPhoto(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    // color: Colors.grey[300],
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                                      // color: Colors.grey[400],
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 28,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              postData.getNewsListTitle(5),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 4,),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 40,
                                                child: Text(
                                                  // postData.getReadNewsCategory(),
                                                  postData.getNewsListCategory(5),
                                                  style: TextStyle(
                                                    fontSize: 8,
                                                    // color: Colors.red,
                                                    color: anTabBarColor[TopikCategory[postData.topik.index]],
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 2),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            postData.loading ?
                            SizedBox(
                              child: SpinKitThreeBounce(
                                duration: const Duration(seconds: 1),
                                itemBuilder: (BuildContext context, int index) {
                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: index.isEven ? Colors.grey[600] : Colors.grey[200],
                                    ),
                                  );
                                },
                              ),
                            )
                                : Container(
                              height: 140,
                              padding: const EdgeInsets.only(right: 16),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => {postData.setSingleNewsView(6)},
                                      child: Image.network(
                                        postData.urlNewsListPhotoSmall(6),
                                        // postData.getReadNewsPhoto(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    // color: Colors.grey[300],
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                                      // color: Colors.grey[400],
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 28,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              postData.getNewsListTitle(6),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 4,),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 40,
                                                child: Text(
                                                  // postData.getReadNewsCategory(),
                                                  postData.getNewsListCategory(6),
                                                  style: TextStyle(
                                                    fontSize: 8,
                                                    // color: Colors.red,
                                                    color: anTabBarColor[TopikCategory[postData.topik.index]],
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 2),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            postData.loading ?
                            SizedBox(
                              child: SpinKitThreeBounce(
                                duration: const Duration(seconds: 1),
                                itemBuilder: (BuildContext context, int index) {
                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: index.isEven ? Colors.grey[600] : Colors.grey[200],
                                    ),
                                  );
                                },
                              ),
                            )
                                : Container(
                              height: 140,
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => {postData.setSingleNewsView(7)},
                                      child: Image.network(
                                        postData.urlNewsListPhotoSmall(7),
                                        // postData.getReadNewsPhoto(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    // color: Colors.grey[300],
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                                      // color: Colors.grey[400],
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 28,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              postData.getNewsListTitle(7),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 4,),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 40,
                                                child: Text(
                                                  // postData.getReadNewsCategory(),
                                                  postData.getNewsListCategory(7),
                                                  style: TextStyle(
                                                    fontSize: 8,
                                                    // color: Colors.red,
                                                    color: anTabBarColor[TopikCategory[postData.topik.index]],
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 2),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            postData.loading ?
                            SizedBox(
                              child: SpinKitThreeBounce(
                                duration: const Duration(seconds: 1),
                                itemBuilder: (BuildContext context, int index) {
                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: index.isEven ? Colors.grey[600] : Colors.grey[200],
                                    ),
                                  );
                                },
                              ),
                            )
                                : Container(
                              height: 140,
                              padding: const EdgeInsets.only(right: 16),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => {postData.setSingleNewsView(8)},
                                      child: Image.network(
                                        postData.urlNewsListPhotoSmall(8),
                                        // postData.getReadNewsPhoto(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    // color: Colors.grey[300],
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                                      // color: Colors.grey[400],
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 28,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              postData.getNewsListTitle(8),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 4,),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 40,
                                                child: Text(
                                                  // postData.getReadNewsCategory(),
                                                  postData.getNewsListCategory(8),
                                                  style: TextStyle(
                                                    fontSize: 8,
                                                    // color: Colors.red,
                                                    color: anTabBarColor[TopikCategory[postData.topik.index]],
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 2),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SliverPadding(padding: EdgeInsets.symmetric(vertical: 2)),
                        SliverList(
                          delegate: SliverChildListDelegate([
                            const SizedBox(height: 8,),
                            SizedBox(
                              height: 20,
                              child: Row(
                                children: [
                                  const SizedBox(width: 16,),
                                  const Text("Lini Masa ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                  Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8,),
                          ]),
                        ),
                        Builder(
                            builder: (context) {
                              return FotoNewsChain(label: label);
                            }
                        ),
                      ],
                    )
                    : postData.curSubTopik == "Foto" ?
                    CustomScrollView(
                      slivers: [
                        const SliverPadding(padding: EdgeInsets.symmetric(vertical: 2)),
                        SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: (screenSize().width - 16*2) / 192,
                        ),
                        delegate: SliverChildBuilderDelegate (
                              (context, index) {
                                late WebViewController _controller;
                                postData.setSubTopik(label);
                                return postData.loading ?
                                  SizedBox(
                                    height: screenSize().width / 1.52,
                                    child: SpinKitThreeBounce(
                                      duration: const Duration(seconds: 1),
                                      itemBuilder: (BuildContext context, int index) {
                                        return DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: index.isEven ? Colors.grey[600] : Colors.grey[200],
                                          ),
                                        );
                                        },
                                    ),
                                  )
                                : GridTile(
                                  footer: SizedBox(
                                    height: 67,
                                    child: Row(
                                      children: [
                                        SizedBox(width: 32,),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                          width: 253,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 30,
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  postData.getNewsListTitle(index),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 4,),
                                              Container(
                                                height: 14,
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 40,
                                                      child: Text(
                                                        postData.getNewsListCategory(index),
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                          color: anTabBarColor[TopikCategory[postData.topik.index]],
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 2),
                                                    GestureDetector(
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
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 2),
                                                    SizedBox(
                                                      width: 14,
                                                      child: Image.asset(
                                                        'assets/icons/ic_chat.png',
                                                        fit: BoxFit.contain,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 2),
                                                    SizedBox(
                                                      width: 14,
                                                      child: Image.asset(
                                                        'assets/icons/ic_send.png',
                                                        fit: BoxFit.contain,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(),
                                                    ),
                                                    const Icon(
                                                      Icons.access_time,
                                                      color: Colors.white,
                                                      size: 14,
                                                    ),
                                                    const SizedBox(
                                                      width: 36,
                                                      child: Text(
                                                        '17 Menit',
                                                        style: TextStyle(
                                                          fontSize: 9,
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  child: Container(
                                    height: 192,
                                    width: screenSize().width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8,),
                                    child: GestureDetector(
                                      onTap: () => {postData.setSingleNewsView(index)},
                                      child: Image.network(
                                        postData.urlNewsListPhotoMedium(index),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              childCount: 10,
                          ),
                        ),
                      ]
                    )
                    :
                    CustomScrollView(
                      slivers: [
                        for(int index=0 ; index < 5 ; index++)
                        SliverList(
                          delegate: SliverChildListDelegate([
                            // const SizedBox(height: 8,),
                            Container(
                              height: 432,
                              padding: const EdgeInsets.only(left: 16, top: 8, right: 16,),
                              child: Column(
                                children: [
                                  if(index == 0)
                                    Column(
                                      children: [
                                        Container(
                                          height: 20,
                                          alignment: Alignment.centerLeft,
                                          child: const Text(
                                            "Foto Story Terpopuler",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8,),
                                      ]
                                    ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 185,
                                      width: screenSize().width,
                                      child: GestureDetector(
                                        onTap: () => {postData.setSingleNewsView(index)},
                                        child: Image.network(
                                          postData.urlNewsListPhotoMedium(index),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                  SizedBox(
                                    height: 134,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 21,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            postData.getNewsListTitle(index),
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 2,),
                                        Container(
                                          height: 85,
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            postData.getNewsListCaption(index),
                                            style: const TextStyle(
                                              fontSize: 10,
                                            ),
                                            softWrap: true,
                                          ),
                                        ),
                                        Container(
                                          height: 22,
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 60,
                                                child: Text(
                                                  postData.getNewsListCategory(index),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: anTabBarColor[TopikCategory[postData.topik.index]],
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 6),
                                              GestureDetector(
                                                onTap: (() => Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (BuildContext context) {
                                                      return const Login();
                                                    }
                                                ))),
                                                child: SizedBox(
                                                  width: 16,
                                                  child: Image.asset(
                                                    'assets/icons/ic_heart.png',
                                                    fit: BoxFit.contain,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 6),
                                              SizedBox(
                                                width: 16,
                                                child: Image.asset(
                                                  'assets/icons/ic_chat.png',
                                                  fit: BoxFit.contain,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(width: 6),
                                              SizedBox(
                                                width: 16,
                                                child: Image.asset(
                                                  'assets/icons/ic_send.png',
                                                  fit: BoxFit.contain,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(),
                                              ),
                                              const Icon(
                                                Icons.access_time,
                                                color: Colors.black,
                                                size: 16,
                                              ),
                                              const SizedBox(width: 6),
                                              const SizedBox(
                                                width: 50,
                                                child: Text(
                                                  '17 Menit',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 31,
                                    width: screenSize().width,
                                    color: Colors.black,
                                    // decoration: const BoxDecoration(
                                    //   borderRadius: BorderRadius.all(Radius.circular(4)),
                                    // ),
                                    child: TextButton(
                                        onPressed: () => {postData.setSingleNewsView(index)},
                                        child: const Text(
                                            'Lihat selengkapnya',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                    ),
                                  ),
                                  const SizedBox(height: 20,),
                                ],
                              ),
                            )
                          ],),
                        ),
                        SliverGrid(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            // childAspectRatio: (screenSize().width - 16*2) / 192,
                            childAspectRatio: 1.52,
                          ),
                          delegate: SliverChildBuilderDelegate (
                                (context, index) {
                              late WebViewController _controller;
                              postData.setSubTopik(label);
                              return postData.loading ?
                              SizedBox(
                                height: screenSize().width / 1.52,
                                child: SpinKitThreeBounce(
                                  duration: const Duration(seconds: 1),
                                  itemBuilder: (BuildContext context, int index) {
                                    return DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: index.isEven ? Colors.grey[600] : Colors.grey[200],
                                      ),
                                    );
                                  },
                                ),
                              )
                                  : GridTile(
                                // header: const SizedBox(height: 4,),
                                footer: Container(
                                  height: 67,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 32,),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                        width: 253,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 30,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                postData.getNewsListTitle(index+1),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 4,),
                                            Container(
                                              height: 14,
                                              alignment: Alignment.centerLeft,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 40,
                                                    child: Text(
                                                      postData.getNewsListCategory(index+1),
                                                      style: TextStyle(
                                                        fontSize: 9,
                                                        color: anTabBarColor[TopikCategory[postData.topik.index]],
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 2),
                                                  GestureDetector(
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
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 2),
                                                  SizedBox(
                                                    width: 14,
                                                    child: Image.asset(
                                                      'assets/icons/ic_chat.png',
                                                      fit: BoxFit.contain,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 2),
                                                  SizedBox(
                                                    width: 14,
                                                    child: Image.asset(
                                                      'assets/icons/ic_send.png',
                                                      fit: BoxFit.contain,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(),
                                                  ),
                                                  const Icon(
                                                    Icons.access_time,
                                                    color: Colors.white,
                                                    size: 14,
                                                  ),
                                                  const SizedBox(
                                                    width: 36,
                                                    child: Text(
                                                      '17 Menit',
                                                      style: TextStyle(
                                                        fontSize: 9,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                child: Container(
                                  height: 192,
                                  width: screenSize().width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8,),
                                  child: GestureDetector(
                                    onTap: () => {postData.setSingleNewsView(index+1)},
                                    child: Image.network(
                                      postData.urlNewsListPhotoMedium(index+1),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                            childCount: 5,
                          ),
                        ),
                      ],
                    );
                    //    }
                  }
              );
            }
        )
        ),
      ],
    );
  }
}
