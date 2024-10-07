class LatestNews {
  final String? articleId;
  final String? title;
  final String? link;
  final List<String?> keywords;
  final List<String?> creator;
  final dynamic videoUrl;
  final String? description;
  final String? content;
  final DateTime? pubDate;
  final String? pubDateTz;
  final String? imageUrl;
  final String? sourceId;
  final int? sourcePriority;
  final String? sourceName;
  final String? sourceUrl;
  final String? sourceIcon;
  final String? language;
  final List<String?> country;
  final List<String?> category;

  LatestNews({
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
  });
}
