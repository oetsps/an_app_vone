import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'an_response.g.dart';


@JsonSerializable(explicitToJson: true)
class GetCategory {
  String status;
  String? message;
  List<DataGetCategory> data;

  GetCategory(this.status, this.message, this.data);
  factory GetCategory.fromJson(Map<String, dynamic> json) => _$GetCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$GetCategoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DataGetCategory {
  final String id;
  final String name;
  final String url;
  final List<DataGetSubCategory>? subcategory;

  DataGetCategory(this.id, this.name, this.url, this.subcategory);
  factory DataGetCategory.fromJson(Map<String, dynamic> json) => _$DataGetCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$DataGetCategoryToJson(this);
}

@JsonSerializable()
class DataGetSubCategory {
  final String id;
  final String name;
  final String url;

  DataGetSubCategory(this.id, this.name, this.url);
  factory DataGetSubCategory.fromJson(Map<String, dynamic> json) => _$DataGetSubCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$DataGetSubCategoryToJson(this);
}


@JsonSerializable(explicitToJson: true)
class NewsType {
    final String status;
    String? message;
    List<DataNewsType> data;

  NewsType(this.status, this.data);
  factory NewsType.fromJson(Map<String, dynamic> json) => _$NewsTypeFromJson(json);
  Map<String, dynamic> toJson() => _$NewsTypeToJson(this);
}

@JsonSerializable()
class DataNewsType {
    final int id;
    final String name;

  DataNewsType(this.id, this.name);
  factory DataNewsType.fromJson(Map<String, dynamic> json) => _$DataNewsTypeFromJson(json);
  Map<String, dynamic> toJson() => _$DataNewsTypeToJson(this);
}


@JsonSerializable(explicitToJson: true)
class TopNews {
    final String status;
    String? message;
    List<DataTopNews> data;

  TopNews(this.status, this.data);
  factory TopNews.fromJson(Map<String, dynamic> json) => _$TopNewsFromJson(json);
  Map<String, dynamic> toJson() => _$TopNewsToJson(this);
}

@JsonSerializable()
class DataTopNews {
    final int id;
    final int news_type;
    final String category;
    final String subcategory;
    final String city;
    final String title;
    final String caption;
    final int topnews;
    final String photo_small;
    final String photo_medium;
    final String photo_big;
    final double timestamp;

  DataTopNews(this.id, this.news_type, this.category, this.subcategory, this.city, this.title, this.caption, this.topnews, this.photo_small, this.photo_medium, this.photo_big, this.timestamp);
  factory DataTopNews.fromJson(Map<String, dynamic> json) => _$DataTopNewsFromJson(json);
  Map<String, dynamic> toJson() => _$DataTopNewsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetNews {
  final String status;
  String? message;
  final List<DataGetNews> data;

  GetNews(this.status, this.message, this.data);
  factory GetNews.fromJson(Map<String, dynamic> json) => _$GetNewsFromJson(json);
  Map<String, dynamic> toJson() => _$GetNewsToJson(this);
}

@JsonSerializable()
class DataGetNews {
    int id;
    int news_type;
    String category;
    String? subcategory;
    String city;
    String title;
    String? caption;
    int? topnews;
    double timestamp;
    String photo_small;
    String photo_medium;
    String original_url;

  DataGetNews(this.id, this.news_type, this.category, this.subcategory, this.city, this.title, this.caption, this.topnews, this.timestamp, this.photo_small, this.photo_medium, this.original_url);

  factory DataGetNews.fromJson(Map<String, dynamic> json) => _$DataGetNewsFromJson(json);

  Map<String, dynamic> toJson() => _$DataGetNewsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Readnews {
  final String status;
  String? message;
  final DataReadNews data;

  Readnews(this.status, this.message, this.data);
  factory Readnews.fromJson(Map<String, dynamic> json) => _$ReadnewsFromJson(json);
  Map<String, dynamic> toJson() => _$ReadnewsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DataReadNews {
    int id;
    int news_type;
    String category;
    String? subcategory;
    String city;
    String title;
    String? dateline_city;
    String content;
    String? quote;
    String photo;
    String? caption;
    String keyword;
    int views;
    String redaktur;
    String pewarta;
    double timestamp;
    String photo_small;
    String photo_medium;
    String original_url;
    List<RelatedNews?> related;

  DataReadNews(this.id, this.news_type, this.category, this.subcategory, this.city, this.title, this.dateline_city, this.content, this.quote, this.photo, this.caption, this.keyword, this.views, this.redaktur, this.pewarta, this.timestamp, this.photo_small, this.photo_medium, this.original_url, this.related);

  factory DataReadNews.fromJson(Map<String, dynamic> json) => _$DataReadNewsFromJson(json);

  Map<String, dynamic> toJson() => _$DataReadNewsToJson(this);
}

@JsonSerializable()
class RelatedNews {
  final int id;
  final int news_type;
  String category;
  String? subcategory;
  String title;
  final String photo_small;
  final String photo_medium;
  final String photo_big;
  final double timestamp;

  RelatedNews(this.id, this.news_type, this.category, this.subcategory, this.title, this.photo_small, this.photo_medium, this.photo_big, this.timestamp);

  factory RelatedNews.fromJson(Map<String, dynamic> json) => _$RelatedNewsFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedNewsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SingleReadnews {
  final String status;
  String? message;
  final DataSingleReadNews data;

  SingleReadnews(this.status, this.message, this.data);
  factory SingleReadnews.fromJson(Map<String, dynamic> json) => _$SingleReadnewsFromJson(json);
  Map<String, dynamic> toJson() => _$SingleReadnewsToJson(this);
}

@JsonSerializable()
class DataSingleReadNews {
    int id;
    int news_type;
    String category;
    String? subcategory;
    String city;
    String title;
    String? dateline_city;
    String content;
    String? quote;
    String photo;
    String? caption;
    String keyword;
    int views;
    String redaktur;
    String pewarta;
    double timestamp;
    String photo_small;
    String photo_medium;
    String original_url;

  DataSingleReadNews(this.id, this.news_type, this.category, this.subcategory, this.city, this.title, this.dateline_city, this.content, this.quote, this.photo, this.caption, this.keyword, this.views, this.redaktur, this.pewarta, this.timestamp, this.photo_small, this.photo_medium, this.original_url);

  factory DataSingleReadNews.fromJson(Map<String, dynamic> json) => _$DataSingleReadNewsFromJson(json);

  Map<String, dynamic> toJson() => _$DataSingleReadNewsToJson(this);
}
