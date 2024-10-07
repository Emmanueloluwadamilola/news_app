import 'package:news_app/core/domain/util/util.dart';

class QueryPayload {
  final String query;
  final String language;
  final String apikey;

  QueryPayload({
    required this.query,
    this.language = selectedLanguage,
    this.apikey = apiKeyNewsDataApi,
  });
}
