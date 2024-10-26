import 'package:news_app/core/domain/util/util.dart';

class CategoryPayload {
  final String category;
  final String language;
  final String apikey;

  CategoryPayload({
    required this.category,
   required this.language,
    this.apikey = apiKeyNewsDataApi,
  });
}
