import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import '../model/an_html.dart';
import '../model/an_response.dart';


Future<GetNews?> getGetNews(String url) async {
  GetNews? result;
  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = GetNews.fromJson(item);
    } else {
      print('error');
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
  }

Future<Readnews?> getReadNews(String url) async {
  Readnews? result;
  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = Readnews.fromJson(item);
    } else {
      print('error');
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
}

Future<SingleReadnews?> getSingleReadNews(String url) async {
  SingleReadnews? result;
  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = SingleReadnews.fromJson(item);
    } else {
      print('error');
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
}

String formReadNewsToHtml(Readnews respData) {

  HtmlElement elements = HtmlElement(respData.data.photo, respData.data.title, respData.data.content, '');
  return elements.getHtmlText();
}

String formSingleNewsToHtml(SingleReadnews respData) {

  HtmlElement elements = HtmlElement(respData.data.photo, respData.data.title, respData.data.content, '');
  return elements.getHtmlText();
}
