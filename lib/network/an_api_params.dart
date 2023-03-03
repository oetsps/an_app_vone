
import 'package:an_app_vone/app/routes/app_menu.dart';

const String API_URL = 'https://www.antaranews.com/api/latest';
const String API_KEY = 'eb2b7bce10958893719e9c5906c8c651';
const String APP_VERSION = '1.102';

// Actions list
const String ActGetCategory = 'get_category';
const String ActGetNewsType = 'get_news_type';
const String ActGetNews = 'get_news';
const String ActSearchNews = 'search_news';
const String ActGetTopNews = 'get_topnews';
const String ActGetPopularNews = 'get_popular_news';
const String ActGetRelatedNews = 'get_related_news';
const String ActReadNews = 'read_news';
const String ActGetGallery = 'get_gallery';
const String ActGetPhotoGallery = 'get_photo_gallery';
const String ActGetRelatedGallery = 'get_related_gallery';
const String ActGetTopic = 'get_topic';
const String ActGetTopicNews = 'get_topic_news';
const String ActGetSpecialReport = 'get_special_report';
const String ActGetNewsSpecialReport = 'get_news_special_report';
const String ActGetVideo = 'get_video';
const String ActPlayVideo = 'play_video';
const String ActGetRelatedVideo = 'get_related_video';

Map<String, String> NewsCategory = {
  'Berita': 'TOP',
  'Top News': 'TOP',
  'Fokus Berita': 'FKS',
  'Terpopuler': 'POP',
  'Liputan Khusus': 'SCR',
  'Politik': 'PLK',
  'Hukum': 'HUK',
  'Metro': 'MET',
  'Humaniora': 'HNA',
  'Nusantara': 'TEK',     /* temporary, wait for design */
  'Ekonomi': 'EKB',
  'Sport': 'ORK',
  'Olahraga': 'ORK',
  'Bola': 'BOL',
  'Sepakbola': 'BOL',
  'Hiburan': 'SBH',
  'Dunia': 'INT',
  'Tekno': 'TEK',
  'Otomotif': 'AUT',
  'Warta Bumi': 'WBM',
  'Foto': 'FOT',
  'Antara TV': 'VID',
  'Streaming': 'VID',
  'Lifestyle': 'SBH',
};

Map<String, String> NewsSubCategory = {
  'Ekonomi': '',
  'Bisnis': 'BIS',
  'BUMN': 'BUN',
  'Bursa': 'BRS',
  'Finansial': 'INF',
  'Kriminalitas': 'KML',
  'Lenggang Jakarta': 'LJK',
  'Lintas Kota': 'BKT',
  'Sport': 'ALS',
  'Otosport': 'BLP',
  'Bola Basket': 'BAS',
  'Bulutangkis': 'BUL',
  'E-Sport': 'ESP',
  'Sportainment': 'SPT',
  'Tenis': 'TEN',
  'Bola': '',
  'Indonesia': 'LIN',
  'Internasional': 'LII',
  'Liga Inggris': 'LIG',
  'Liga Champions': 'LCH',
  'Bintang': 'BTG',
  'Lifestyle': 'SBH',
  'Foto': 'FOT',
  'Hiburan': 'SBH',
  'Foto Hardnews': 'FOT',
};

class ApiPars {
  Map<String, dynamic> pars = {};
  
  ApiPars();

  Map<String, dynamic> apiSetAction({
    required String valAction,
    String valNewsId = '',
    String valCategory = '',
    String valSubCategory = '',
    String valTopNews = '',
    String valPage = '',
    String valLimit = '',
    String valBrief = '',
    String valGalleryId = '',
    String valQuote = '',
    String valGet = '',
    String valKeyWord = '',
    String valDay = '',
    String valDateStart = '',
    String valDateEnd = '',
    String valTotalResult = '',
  }) => pars = 
      {
        'key': API_KEY,
        'app_version': APP_VERSION,
        'action': valAction,
        'news_id': valNewsId,
        'category': valCategory,
        'subcategory': valSubCategory,
        'top_news': valTopNews,
        'page': valPage,
        'limit': valLimit,
        'brief': valBrief,
        'gallery_id': valGalleryId,
        'quote': valQuote,
        'get': valGet,
        'keyword': valKeyWord,
        'day': valDay,
        'total_result': valTotalResult,
      };

  String composeApiRequest(Map<String, dynamic>? queryParameters) {
    String url = API_URL;
    if (queryParameters == null || queryParameters.isEmpty) {
      return url;
    }
    final StringBuffer stringBuffer = StringBuffer("$url?");
    queryParameters.forEach((key, value) {
      if (value.trim() == '') return;
      if (value.contains(' ')) throw Exception('Invalid Input Exception');
      stringBuffer.write('$key=$value&');
    });
    final result = stringBuffer.toString();
    return result.substring(0, result.length - 1);
  }
}


class RequestAnApi {

  RequestAnApi();

  String requestAnNews({required String action, required String category, String? subcategory, int? top_news, int? news_id, int? page, int? limit}) {
    ApiPars queryParams = ApiPars();
    String url = '';

    switch (action) {
      case 'read_news': {
        if (news_id == null) {
          print('news_id is required for action read_news!');
          return url;
        } else {
          queryParams.apiSetAction(
            valAction: action,
            valCategory: NewsCategory[category].toString(),
            valNewsId: news_id.toString(),
          );
        }
      }
        break;
      case 'get_news': {
        queryParams.apiSetAction(
          valAction: action,
          valCategory: NewsCategory[category].toString(),
          valSubCategory: (subcategory == null) ? '' : NewsSubCategory[subcategory].toString(),
          valTopNews: '1',
          // valLimit: '11',
          valLimit: GetNewsLimit.toString(),
        );
      }
        break;
      default:
        break;
    }

    return url = queryParams.composeApiRequest(queryParams.pars);
  }
}