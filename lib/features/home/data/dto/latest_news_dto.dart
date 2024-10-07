// To parse this JSON data, do
//
//     final latestNewsDto = latestNewsDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:news_app/features/home/domain/entities/model/latest_news.dart';

part 'latest_news_dto.g.dart';

LatestNewsDto latestNewsDtoFromJson(String str) =>
    LatestNewsDto.fromJson(json.decode(str));

String latestNewsDtoToJson(LatestNewsDto data) => json.encode(data.toJson());

@JsonSerializable()
class LatestNewsDto {
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "totalResults")
  final int totalResults;
  @JsonKey(name: "results")
  final List<Result> results;
  @JsonKey(name: "nextPage")
  final String nextPage;

  LatestNewsDto({
    required this.status,
    required this.totalResults,
    required this.results,
    required this.nextPage,
  });

  factory LatestNewsDto.fromJson(Map<String, dynamic> json) =>
      _$LatestNewsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LatestNewsDtoToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "article_id")
  final String? articleId;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "link")
  final String? link;
  @JsonKey(name: "keywords")
  final List<String?> keywords;
  @JsonKey(name: "creator")
  final List<String?> creator;
  @JsonKey(name: "video_url")
  final dynamic videoUrl;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "content")
  final String? content;
  @JsonKey(name: "pubDate")
  final DateTime? pubDate;
  @JsonKey(name: "pubDateTZ")
  final String? pubDateTz;
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "source_id")
  final String? sourceId;
  @JsonKey(name: "source_priority")
  final int? sourcePriority;
  @JsonKey(name: "source_name")
  final String? sourceName;
  @JsonKey(name: "source_url")
  final String? sourceUrl;
  @JsonKey(name: "source_icon")
  final String? sourceIcon;
  @JsonKey(name: "language")
  final String? language;
  @JsonKey(name: "country")
  final List<String?> country;
  @JsonKey(name: "category")
  final List<String?> category;
  @JsonKey(name: "ai_tag")
  final String? aiTag;
  @JsonKey(name: "sentiment")
  final String? sentiment;
  @JsonKey(name: "sentiment_stats")
  final String? sentimentStats;
  @JsonKey(name: "ai_region")
  final String? aiRegion;
  @JsonKey(name: "ai_org")
  final String? aiOrg;
  @JsonKey(name: "duplicate")
  final bool duplicate;

  Result({
    required this.articleId,
    required this.title,
    required this.link,
    required this.keywords,
    required this.creator,
    required this.videoUrl,
    required this.description,
    required this.content,
    required this.pubDate,
    required this.pubDateTz,
    required this.imageUrl,
    required this.sourceId,
    required this.sourcePriority,
    required this.sourceName,
    required this.sourceUrl,
    required this.sourceIcon,
    required this.language,
    required this.country,
    required this.category,
    required this.aiTag,
    required this.sentiment,
    required this.sentimentStats,
    required this.aiRegion,
    required this.aiOrg,
    required this.duplicate,
  });

  LatestNews toLatestNews() {
    return LatestNews(
        articleId: articleId,
        title: title,
        link: link,
        keywords: keywords,
        creator: creator,
        videoUrl: videoUrl,
        description: description,
        content: content,
        pubDate: pubDate,
        pubDateTz: pubDateTz,
        imageUrl: imageUrl,
        sourceId: sourceId,
        sourcePriority: sourcePriority,
        sourceName: sourceName,
        sourceUrl: sourceUrl,
        sourceIcon: sourceIcon,
        language: language,
        country: country,
        category: category);
  }

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
