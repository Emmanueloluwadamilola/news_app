// To parse this JSON data, do
//
//     final fetchNewsDto = fetchNewsDtoFromJson(jsonString);


import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:news_app/features/home/domain/entities/model/fetch_news.dart';

part 'fetch_news_dto.g.dart';

FetchNewsDto fetchNewsDtoFromJson(String str) =>
    FetchNewsDto.fromJson(json.decode(str));

String fetchNewsDtoToJson(FetchNewsDto data) => json.encode(data.toJson());

@JsonSerializable()
class FetchNewsDto {
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "totalResults")
  final int totalResults;
  @JsonKey(name: "articles")
  final List<ArticleDto> articles;

  FetchNewsDto({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory FetchNewsDto.fromJson(Map<String, dynamic> json) =>
      _$FetchNewsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FetchNewsDtoToJson(this);
}

@JsonSerializable()
class ArticleDto {
  @JsonKey(name: "source")
  final SourceDto source;
  @JsonKey(name: "author")
  final String? author;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "urlToImage")
  final String? urlToImage;
  @JsonKey(name: "publishedAt")
  final DateTime? publishedAt;
  @JsonKey(name: "content")
  final String? content;

  ArticleDto({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Article toArticle() {
    return Article(
        source: source.toSource(),
        author: author ?? 'null',
        title: title ?? 'null',
        description: description ?? 'null',
        url: url ?? 'null',
        urlToImage: urlToImage ?? 'null',
        publishedAt: publishedAt ?? DateTime.now(),
        content: content ?? 'null');
  }

  factory ArticleDto.fromJson(Map<String, dynamic> json) =>
      _$ArticleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDtoToJson(this);
}

@JsonSerializable()
class SourceDto {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;

  SourceDto({
    required this.id,
    required this.name,
  });

  Source toSource() {
    return Source(id: id ?? 'null', name: name ?? 'null');
  }

  factory SourceDto.fromJson(Map<String, dynamic> json) =>
      _$SourceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SourceDtoToJson(this);
}
