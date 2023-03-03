import 'package:an_app_vone/app/routes/app_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../model/an_response.dart';
import '../../../../network/an_get_services.dart';
import '../../../../network/an_api_params.dart';

class DataBola extends ChangeNotifier {
  final AppTopik topik = AppTopik.Bola;
  // String subTopik = 'Bisnis';
  String curSubTopik = '';
  int curSubTopikIdx = 0;
  bool loading = false;
  bool changeSubTopik = false;
  int reqNewsId = 0;
  RequestAnApi requestAnApi = RequestAnApi();

  late List<String> listSubTopik = [];
  late List<bool> repStatus = [];
  late List<String> repNewsHtml = [];
  late List<String> repChainNewsHtml = [];
  late List<GetNews?> repGetNews = [];
  late List<Readnews?> repReadNews = [];
  late Readnews? postRequestNews;
  late String onRequestNews = '';

  DataBola() {
    for (var str in menuSubTopik[AppTopik.Bola.index]) {
      listSubTopik.add(str);
      repStatus.add(false);
      repNewsHtml.add('');
    }

    for (var i=0 ; i < (GetNewsLimit - 1) ; i++) {
      repChainNewsHtml.add('');
    }

    repGetNews = List.generate(
      menuSubTopik[AppTopik.Bola.index].length,
      (index) => GetNews(
          '',
          null,
          List.generate(
              GetNewsLimit,
              (index) => DataGetNews(
                  0, 0, '', null, '', '', null, null, 0.0, '', '', '', ''))),
    );

    repReadNews = List.generate(
        menuSubTopik[AppTopik.Bola.index].length,
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

    if (!repStatus[curSubTopikIdx]) {
      String iUrl = requestAnApi.requestAnNews(
          action: 'get_news',
          category: 'Bola',
          subcategory: curSubTopik,
          top_news: 1
      );
      print('iUrl ====> $iUrl');
      if (iUrl == '') {
        print('Error get_news cause of invalid url');
        return null;
      } else {
        repGetNews[curSubTopikIdx] = (await getGetNews(iUrl));
        if (repGetNews[curSubTopikIdx] == null) {
          print('Error get news getting null.');
          return null;
        }
      }

      for (int i = 0; i < repGetNews[curSubTopikIdx]!.data.length; i++) {
        String url = requestAnApi.requestAnNews(
            action: 'read_news',
            category: 'Bola',
            subcategory: curSubTopik,
            news_id: repGetNews[curSubTopikIdx]!.data[i].id);
        if (url == '') {
          print('Error read_news cause of invalid url');
          continue;
        } else {
          repReadNews[curSubTopikIdx] = (await getReadNews(url));
          if (repReadNews[curSubTopikIdx] == null) {
            print('Error read news getting null.');
            continue;
          }
        }
        repGetNews[curSubTopikIdx]!.data.removeAt(i);
        break;
      }

      repNewsHtml[curSubTopikIdx] =
          formReadNewsToHtml(repReadNews[curSubTopikIdx]!);

      if (changeSubTopik) {
        for (int i = 0; i < repGetNews[curSubTopikIdx]!.data.length; i++) {
          repChainNewsHtml[i] = "";
          String url = requestAnApi.requestAnNews(
              action: 'read_news',
              category: curSubTopik,
              news_id: repGetNews[curSubTopikIdx]!.data[i].id);
          if (url == '') {
            print('Error read_news cause of invalid url');
            continue;
          } else {
            // print('==> $url');
            Readnews? tempReadNews = (await getReadNews(url));
            if (tempReadNews == null) {
              SingleReadnews? tempSingleReadNews = (await getSingleReadNews(url));
              if (tempSingleReadNews == null) {
                print('Error read news getting null.\nurl ::: $url');
                continue;
              }
              repChainNewsHtml[i] = formSingleNewsToHtml(tempSingleReadNews);
              continue;
            }
            repChainNewsHtml[i] = formReadNewsToHtml(tempReadNews);
          }
        }
      }

      repStatus[curSubTopikIdx] = true;
    }

    loading = false;
    notifyListeners();
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
    return repGetNews[curSubTopikIdx]!.data[idx].title;
  }

  String urlNewsListPhotoSmall(int idx) {
    return repGetNews[curSubTopikIdx]!.data[idx].photo_small;
  }

  int getNewListLength() {
    return repGetNews[curSubTopikIdx]!.data.length;
  }

  void setSubTopik(String labelSubTopik, [bool refresh = false]) async {
    loading = true;
    // changeSubTopik = true;
    if (curSubTopik != labelSubTopik) {
      changeSubTopik = true;
      curSubTopik = labelSubTopik;
    }

    // curSubTopik = labelSubTopik;
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

  void setReqNewsId(int id) {
    reqNewsId = id;
  }

  composeHtml() {
    if (repReadNews[listSubTopik.indexWhere((val) => val == curSubTopik)] ==
        null) {
      debugPrint("No data");
    }
    repNewsHtml[curSubTopikIdx] = formReadNewsToHtml(
        repReadNews[listSubTopik.indexWhere((val) => val == curSubTopik)]!);
    loading = false;
  }

  String getHtmlView() {
    return repNewsHtml[curSubTopikIdx];
  }

  String getHtmlOnRequestNews() {
    return onRequestNews;
  }
}
