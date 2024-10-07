import 'package:uuid/uuid.dart';

class NewsArticle {
  final String source;
  final String? author;
  final String? title;

  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  NewsArticle({
    required this.source,
    required this.author,
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
}

class ArticleId {
  final String title;

  ArticleId({
    required this.title,
  });
}


//UniqueKey uniqueKey = UniqueKey();
