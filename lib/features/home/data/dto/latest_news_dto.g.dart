// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_news_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestNewsDto _$LatestNewsDtoFromJson(Map<String, dynamic> json) =>
    LatestNewsDto(
      status: json['status'] as String,
      totalResults: (json['totalResults'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPage: json['nextPage'] as String,
    );

Map<String, dynamic> _$LatestNewsDtoToJson(LatestNewsDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'results': instance.results,
      'nextPage': instance.nextPage,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      articleId: json['article_id'] as String?,
      title: json['title'] as String?,
      link: json['link'] as String?,
      keywords:
          (json['keywords'] as List<dynamic>).map((e) => e as String?).toList(),
      creator:
          (json['creator'] as List<dynamic>).map((e) => e as String?).toList(),
      videoUrl: json['video_url'],
      description: json['description'] as String?,
      content: json['content'] as String?,
      pubDate: json['pubDate'] == null
          ? null
          : DateTime.parse(json['pubDate'] as String),
      pubDateTz: json['pubDateTZ'] as String?,
      imageUrl: json['image_url'] as String?,
      sourceId: json['source_id'] as String?,
      sourcePriority: (json['source_priority'] as num?)?.toInt(),
      sourceName: json['source_name'] as String?,
      sourceUrl: json['source_url'] as String?,
      sourceIcon: json['source_icon'] as String?,
      language: json['language'] as String?,
      country:
          (json['country'] as List<dynamic>).map((e) => e as String?).toList(),
      category:
          (json['category'] as List<dynamic>).map((e) => e as String?).toList(),
      aiTag: json['ai_tag'] as String?,
      sentiment: json['sentiment'] as String?,
      sentimentStats: json['sentiment_stats'] as String?,
      aiRegion: json['ai_region'] as String?,
      aiOrg: json['ai_org'] as String?,
      duplicate: json['duplicate'] as bool,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'article_id': instance.articleId,
      'title': instance.title,
      'link': instance.link,
      'keywords': instance.keywords,
      'creator': instance.creator,
      'video_url': instance.videoUrl,
      'description': instance.description,
      'content': instance.content,
      'pubDate': instance.pubDate?.toIso8601String(),
      'pubDateTZ': instance.pubDateTz,
      'image_url': instance.imageUrl,
      'source_id': instance.sourceId,
      'source_priority': instance.sourcePriority,
      'source_name': instance.sourceName,
      'source_url': instance.sourceUrl,
      'source_icon': instance.sourceIcon,
      'language': instance.language,
      'country': instance.country,
      'category': instance.category,
      'ai_tag': instance.aiTag,
      'sentiment': instance.sentiment,
      'sentiment_stats': instance.sentimentStats,
      'ai_region': instance.aiRegion,
      'ai_org': instance.aiOrg,
      'duplicate': instance.duplicate,
    };
