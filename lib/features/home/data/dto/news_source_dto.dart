// To parse this JSON data, do
//
//     final newsSourceDto = newsSourceDtoFromJson(jsonString);


import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:news_app/features/home/domain/entities/model/news_source.dart';

part 'news_source_dto.g.dart';

NewsSourceDto newsSourceDtoFromJson(String str) =>
    NewsSourceDto.fromJson(json.decode(str));

String newsSourceDtoToJson(NewsSourceDto data) => json.encode(data.toJson());

@JsonSerializable()
class NewsSourceDto {
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "sources")
  final List<Source> sources;

  NewsSourceDto({
    required this.status,
    required this.sources,
  });

  factory NewsSourceDto.fromJson(Map<String, dynamic> json) =>
      _$NewsSourceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NewsSourceDtoToJson(this);
}

@JsonSerializable()
class Source {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "category")
  final String category;
  @JsonKey(name: "language")
  final String language;
  @JsonKey(name: "country")
  final String country;

  Source({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  NewsSource toNewsSource() {
    return NewsSource(
        id: id,
        name: name,
        url: url,
     );
  }

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
