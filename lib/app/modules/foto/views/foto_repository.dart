import 'dart:convert';

import 'package:an_app_vone/app/data/mockdata/rubrik_dummy.dart';
import 'package:an_app_vone/app/data/mockdata/singlenews_dummy.dart';
import 'package:an_app_vone/app/routes/app_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../model/an_response.dart';

class DataFoto extends ChangeNotifier {
  AppTopik topik = anTopik;
  String curSubTopik = '';
  int curSubTopikIdx = 0;
  bool loading = false;
  bool changeSubTopik = false;
  int reqNewsId = 0;
  bool singleNewsView = false;
  int singleNewsIdx = 0;
  // RequestAnApi requestAnApi = RequestAnApi();

  late List<String> listSubTopik = [];
  late List<bool> repStatus = [];
  late List<String> repNewsHtml = [];
  late List<String> repChainNewsHtml = [];
  late List<GetNews?> repGetNews = [];
  late List<Readnews?> repReadNews = [];
  late Readnews? postRequestNews;
  late String onRequestNews = '';

  DataFoto() {
    for (var str in menuSubTopik[topik.index]) {
      listSubTopik.add(str);
      repStatus.add(false);
      repNewsHtml.add('');
    }

    // for (var i=0 ; i < (GetNewsLimit - 1) ; i++) {
    // Declare as below in case common page applied
    for (var i=0 ; i < (GetNewsLimit) ; i++) {
      repChainNewsHtml.add('');
    }

    repGetNews = List.generate(
      menuSubTopik[topik.index].length,
          (index) => GetNews(
          '',
          null,
          List.generate(
              GetNewsLimit,
                  (index) => DataGetNews(
                  0, 0, '', null, '', '', null, null, 0.0, '', '', '', ''))),
    );

    repReadNews = List.generate(
        menuSubTopik[topik.index].length,
            (index) => Readnews(
            '',
            null,
            DataReadNews(0, 0, '', null, '', '', '', '', null, '', null, '', 0, '', '', 0.0, '', '', '',
                List.generate(
                    GetNewsLimit,
                        (index) =>
                        RelatedNews(0, 0, '', null, '', '', '', '', 0.0)))));
  }

  getReadNewsData() async {
    loading = true;
    print('loading $curSubTopik');

    loading = false;
    // notifyListeners();
  }

  @override
  notifyListeners();

  String getSubTopik() {
    return curSubTopik;
  }

  int getSubTopikIndex() {
    return curSubTopikIdx;
  }

  String getNewsListTitle(int idx) {
    // return repGetNews[curSubTopikIdx]!.data[idx].title;

    // USE DUMMY
    return jsonEncode(RubrikNewsDummy.getRubrikDummy[TopikCategory[topik.index]]![idx]['title']).replaceAll("\"", "");
  }

  // USE DUMMY
  String getNewsListCaption(int idx) {
    return jsonEncode(RubrikNewsDummy.getRubrikDummy[TopikCategory[topik.index]]![idx]['caption']).replaceAll("\"", "");
  }

  String getNewsListCategory(int idx) {
    // return repGetNews[curSubTopikIdx]!.data[idx].category;

    // USE DUMMY
    return jsonEncode(RubrikNewsDummy.getRubrikDummy[TopikCategory[topik.index]]![idx]['category']).replaceAll("\"","");
  }

  String urlNewsListPhotoSmall(int idx) {
    // return repGetNews[curSubTopikIdx]!.data[idx].photo_small;

    // USE DUMMY
    return jsonEncode(RubrikNewsDummy.getRubrikDummy[TopikCategory[topik.index]]![idx]['photo_small']).replaceAll("\"","");
  }

  String urlNewsListPhotoMedium(int idx) {
    // return repGetNews[curSubTopikIdx]!.data[idx].photo_medium;

    // USE DUMMY
    return jsonEncode(RubrikNewsDummy.getRubrikDummy[TopikCategory[topik.index]]![idx]['photo_medium']).replaceAll("\"","");
  }

  // USE FOR DUMMY
  String getSingleNewsHtml() {
    return SingleNewsDummy.getSingleNewsDummy[TopikCategory[topik.index]]['content'];
  }

  // USE FOR DUMMY
  String getSinglePhotoMedium() {
    return SingleNewsDummy.getSingleNewsDummy[TopikCategory[topik.index]]['photo_medium'];
  }

  // USE FOR DUMMY
  String getSinglePhotoSmall() {
    return SingleNewsDummy.getSingleNewsDummy[TopikCategory[topik.index]]['photo_small'];
  }

  int getNewListLength() {
    return repGetNews[curSubTopikIdx]!.data.length;
  }

  void setSubTopik(String labelSubTopik, [bool refresh = false]) async {
    loading = true;
    if (curSubTopik != labelSubTopik) {
      changeSubTopik = true;
      curSubTopik = labelSubTopik;
    }

    curSubTopikIdx = listSubTopik.indexWhere((val) => val == curSubTopik);
    if (refresh) {
      repStatus[curSubTopikIdx] = false;
    }
    if (!repStatus[curSubTopikIdx]) {
      await getReadNewsData();
    }

    changeSubTopik = false;
    loading = false;
    // notifyListeners();
  }

   // USE DUMMY
  bool getSingleNewsView() {
    return singleNewsView;
  }

  // USE DUMMY
  void rstSingleNewsView() {
    singleNewsView = false;
    // notifyListeners();
  }

  // USE DUMMY
  void setSingleNewsView(int idx) {
    singleNewsView = true;
    singleNewsIdx = idx;
    notifyListeners();
  }
}
