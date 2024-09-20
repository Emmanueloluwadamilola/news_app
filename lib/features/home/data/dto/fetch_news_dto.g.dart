// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_news_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchNewsDto _$FetchNewsDtoFromJson(Map<String, dynamic> json) => FetchNewsDto(
      status: json['status'] as String,
      totalResults: (json['totalResults'] as num).toInt(),
      articles: (json['articles'] as List<dynamic>)
          .map((e) => ArticleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FetchNewsDtoToJson(FetchNewsDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

ArticleDto _$ArticleDtoFromJson(Map<String, dynamic> json) => ArticleDto(
      source: SourceDto.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$ArticleDtoToJson(ArticleDto instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'content': instance.content,
    };

SourceDto _$SourceDtoFromJson(Map<String, dynamic> json) => SourceDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SourceDtoToJson(SourceDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
