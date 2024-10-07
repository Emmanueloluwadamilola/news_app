// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_source_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsSourceDto _$NewsSourceDtoFromJson(Map<String, dynamic> json) =>
    NewsSourceDto(
      status: json['status'] as String,
      sources: (json['sources'] as List<dynamic>)
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsSourceDtoToJson(NewsSourceDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'sources': instance.sources,
    };

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      category: json['category'] as String,
      language: json['language'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'category': instance.category,
      'language': instance.language,
      'country': instance.country,
    };
