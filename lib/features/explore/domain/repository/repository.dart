import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/features/explore/domain/entities/param/category_param.dart';
import 'package:news_app/features/explore/domain/entities/param/query_param.dart';
import 'package:news_app/features/home/domain/entities/model/fetch_news.dart';

abstract class ExploreRepository {
  Future<ApiResult<List<Article>>> fetchNewsByCategory(CategoryPayload param);

  Future<ApiResult<List<Article>>> fetchNewsByQuery(QueryPayload param);
}
