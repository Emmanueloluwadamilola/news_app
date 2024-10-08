// ignore_for_file: annotate_overrides, overridden_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/features/favourite/domain/entity/model/favourite_model.dart';


// lib/infrastructure/models/news_article_model.dart


class NewsArticleDto extends NewsArticle {
  NewsArticleDto({
    required String source,
    String? author,
    String? title,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) : super(
          source: source,
          author: author,
          title: title,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );


        factory NewsArticleDto.fromNewsArticle(NewsArticle article) {
    return NewsArticleDto(
      source: article.source,
      author: article.author,
      title: article.title,
      url: article.url,
      urlToImage: article.urlToImage,
      publishedAt: article.publishedAt,
      content: article.content,
    );
  }

  factory NewsArticleDto.fromJson(Map<String, dynamic> json) {
    return NewsArticleDto(
      source: json['source'] as String,
      author: json['author'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'],
      content: json['content'] as String?,
    );
  }

  factory NewsArticleDto.fromFirestore(Map<String, dynamic> json, String id) {
    return NewsArticleDto(
      source: json['source'] as String,
      author: json['author'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: (json['publishedAt'] as Timestamp).toDate(),
      content: json['content'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source': source,
      'author': author,
      'title': title,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': Timestamp.fromDate(publishedAt!),
      'content': content,
    };
  }
}


// class NewsArticleDto extends NewsArticle {
//   @override
//   final String source;
//   final String? author;
//   final String? title;
//   final String? url;
//   final String? urlToImage;
//   final DateTime? publishedAt;
//   final String? content;

//   NewsArticleDto({
   
//     required this.source,
//     required this.author,
//     required this.title,
//     required this.url,
//     required this.urlToImage,
//     required this.publishedAt,
//     required this.content,
//   }) : super(
//             source: source,
//             author: author,
//             title: title,
//             url: url,
//             urlToImage: urlToImage,
//             publishedAt: publishedAt,
//             content: content);

//   factory NewsArticleDto.fromEntity(NewsArticle entity) {
//     return NewsArticleDto(
      
//         source: entity.source,
//         author: entity.author,
//         urlToImage: entity.urlToImage,
//         url: entity.url,
//         title: entity.title,
//         content: entity.content,
//         publishedAt: entity.publishedAt);
//   }

//   factory NewsArticleDto.fromFirestore(DocumentSnapshot doc) {
//     final data = doc.data() as Map<String, dynamic>;
//     return NewsArticleDto(
    
//       source: data['source'] ?? '',
//       author: data['author'] ?? '',
//       url: data['url'] ?? '',
//       title: data['title'] ?? '',
//       publishedAt: (data['publishedAt'] as Timestamp).toDate(),
//       urlToImage: data['urlToImage'],
//       content: data['content'] ?? '',
//     );
//   }

//   Map<String, dynamic> toFirestore() {
//     return {
     
//       'source': source,
//       'url': url,
//       'title': title,
//       'author': author,
//       'publishedAt': Timestamp.fromDate(publishedAt!),
//       'urlToImage': urlToImage,
//       'content': content,
//     };
//   }
// }
