// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'an_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategory _$GetCategoryFromJson(Map<String, dynamic> json) => GetCategory(
      json['status'] as String,
      json['message'] as String?,
      (json['data'] as List<dynamic>)
          .map((e) => DataGetCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCategoryToJson(GetCategory instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

DataGetCategory _$DataGetCategoryFromJson(Map<String, dynamic> json) =>
    DataGetCategory(
      json['id'] as String,
      json['name'] as String,
      json['url'] as String,
      (json['subcategory'] as List<dynamic>?)
          ?.map((e) => DataGetSubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataGetCategoryToJson(DataGetCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'subcategory': instance.subcategory?.map((e) => e.toJson()).toList(),
    };

DataGetSubCategory _$DataGetSubCategoryFromJson(Map<String, dynamic> json) =>
    DataGetSubCategory(
      json['id'] as String,
      json['name'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$DataGetSubCategoryToJson(DataGetSubCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
    };

NewsType _$NewsTypeFromJson(Map<String, dynamic> json) => NewsType(
      json['status'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => DataNewsType.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..message = json['message'] as String?;

Map<String, dynamic> _$NewsTypeToJson(NewsType instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

DataNewsType _$DataNewsTypeFromJson(Map<String, dynamic> json) => DataNewsType(
      json['id'] as int,
      json['name'] as String,
    );

Map<String, dynamic> _$DataNewsTypeToJson(DataNewsType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

TopNews _$TopNewsFromJson(Map<String, dynamic> json) => TopNews(
      json['status'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => DataTopNews.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..message = json['message'] as String?;

Map<String, dynamic> _$TopNewsToJson(TopNews instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

DataTopNews _$DataTopNewsFromJson(Map<String, dynamic> json) => DataTopNews(
      json['id'] as int,
      json['news_type'] as int,
      json['category'] as String,
      json['subcategory'] as String,
      json['city'] as String,
      json['title'] as String,
      json['caption'] as String,
      json['topnews'] as int,
      json['photo_small'] as String,
      json['photo_medium'] as String,
      json['photo_big'] as String,
      (json['timestamp'] as num).toDouble(),
    );

Map<String, dynamic> _$DataTopNewsToJson(DataTopNews instance) =>
    <String, dynamic>{
      'id': instance.id,
      'news_type': instance.news_type,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'city': instance.city,
      'title': instance.title,
      'caption': instance.caption,
      'topnews': instance.topnews,
      'photo_small': instance.photo_small,
      'photo_medium': instance.photo_medium,
      'photo_big': instance.photo_big,
      'timestamp': instance.timestamp,
    };

GetNews _$GetNewsFromJson(Map<String, dynamic> json) => GetNews(
      json['status'] as String,
      json['message'] as String?,
      (json['data'] as List<dynamic>)
          .map((e) => DataGetNews.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetNewsToJson(GetNews instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

DataGetNews _$DataGetNewsFromJson(Map<String, dynamic> json) => DataGetNews(
      json['id'] as int,
      json['news_type'] as int,
      json['category'] as String,
      json['subcategory'] as String?,
      json['city'] as String,
      json['title'] as String,
      json['caption'] as String?,
      json['topnews'] as int?,
      (json['timestamp'] as num).toDouble(),
      json['photo_small'] as String,
      json['photo_medium'] as String,
      json['original_url'] as String,
    );

Map<String, dynamic> _$DataGetNewsToJson(DataGetNews instance) =>
    <String, dynamic>{
      'id': instance.id,
      'news_type': instance.news_type,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'city': instance.city,
      'title': instance.title,
      'caption': instance.caption,
      'topnews': instance.topnews,
      'timestamp': instance.timestamp,
      'photo_small': instance.photo_small,
      'photo_medium': instance.photo_medium,
      'original_url': instance.original_url,
    };

Readnews _$ReadnewsFromJson(Map<String, dynamic> json) => Readnews(
      json['status'] as String,
      json['message'] as String?,
      DataReadNews.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReadnewsToJson(Readnews instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

DataReadNews _$DataReadNewsFromJson(Map<String, dynamic> json) => DataReadNews(
      json['id'] as int,
      json['news_type'] as int,
      json['category'] as String,
      json['subcategory'] as String?,
      json['city'] as String,
      json['title'] as String,
      json['dateline_city'] as String?,
      json['content'] as String,
      json['quote'] as String?,
      json['photo'] as String,
      json['caption'] as String?,
      json['keyword'] as String,
      json['views'] as int,
      json['redaktur'] as String,
      json['pewarta'] as String,
      (json['timestamp'] as num).toDouble(),
      json['photo_small'] as String,
      json['photo_medium'] as String,
      json['original_url'] as String,
      (json['related'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : RelatedNews.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataReadNewsToJson(DataReadNews instance) =>
    <String, dynamic>{
      'id': instance.id,
      'news_type': instance.news_type,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'city': instance.city,
      'title': instance.title,
      'dateline_city': instance.dateline_city,
      'content': instance.content,
      'quote': instance.quote,
      'photo': instance.photo,
      'caption': instance.caption,
      'keyword': instance.keyword,
      'views': instance.views,
      'redaktur': instance.redaktur,
      'pewarta': instance.pewarta,
      'timestamp': instance.timestamp,
      'photo_small': instance.photo_small,
      'photo_medium': instance.photo_medium,
      'original_url': instance.original_url,
      'related': instance.related.map((e) => e?.toJson()).toList(),
    };

RelatedNews _$RelatedNewsFromJson(Map<String, dynamic> json) => RelatedNews(
      json['id'] as int,
      json['news_type'] as int,
      json['category'] as String,
      json['subcategory'] as String?,
      json['title'] as String,
      json['photo_small'] as String,
      json['photo_medium'] as String,
      json['photo_big'] as String,
      (json['timestamp'] as num).toDouble(),
    );

Map<String, dynamic> _$RelatedNewsToJson(RelatedNews instance) =>
    <String, dynamic>{
      'id': instance.id,
      'news_type': instance.news_type,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'title': instance.title,
      'photo_small': instance.photo_small,
      'photo_medium': instance.photo_medium,
      'photo_big': instance.photo_big,
      'timestamp': instance.timestamp,
    };

SingleReadnews _$SingleReadnewsFromJson(Map<String, dynamic> json) =>
    SingleReadnews(
      json['status'] as String,
      json['message'] as String?,
      DataSingleReadNews.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleReadnewsToJson(SingleReadnews instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

DataSingleReadNews _$DataSingleReadNewsFromJson(Map<String, dynamic> json) =>
    DataSingleReadNews(
      json['id'] as int,
      json['news_type'] as int,
      json['category'] as String,
      json['subcategory'] as String?,
      json['city'] as String,
      json['title'] as String,
      json['dateline_city'] as String?,
      json['content'] as String,
      json['quote'] as String?,
      json['photo'] as String,
      json['caption'] as String?,
      json['keyword'] as String,
      json['views'] as int,
      json['redaktur'] as String,
      json['pewarta'] as String,
      (json['timestamp'] as num).toDouble(),
      json['photo_small'] as String,
      json['photo_medium'] as String,
      json['original_url'] as String,
    );

Map<String, dynamic> _$DataSingleReadNewsToJson(DataSingleReadNews instance) =>
    <String, dynamic>{
      'id': instance.id,
      'news_type': instance.news_type,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'city': instance.city,
      'title': instance.title,
      'dateline_city': instance.dateline_city,
      'content': instance.content,
      'quote': instance.quote,
      'photo': instance.photo,
      'caption': instance.caption,
      'keyword': instance.keyword,
      'views': instance.views,
      'redaktur': instance.redaktur,
      'pewarta': instance.pewarta,
      'timestamp': instance.timestamp,
      'photo_small': instance.photo_small,
      'photo_medium': instance.photo_medium,
      'original_url': instance.original_url,
    };
