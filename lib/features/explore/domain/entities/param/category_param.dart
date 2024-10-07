import 'package:news_app/core/domain/util/util.dart';

class CategoryPayload {
  final String category;
  final String language;
  final String apikey;

  CategoryPayload({
    required this.category,
    this.language = selectedLanguage,
    this.apikey = apiKeyNewsDataApi,
  });
}
