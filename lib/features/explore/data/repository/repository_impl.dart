import 'package:injectable/injectable.dart';
import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/core/domain/util/util.dart';
import 'package:news_app/features/explore/domain/entities/param/category_param.dart';
import 'package:news_app/features/explore/domain/entities/param/query_param.dart';
import 'package:news_app/features/explore/domain/repository/repository.dart';
import 'package:news_app/features/home/domain/entities/model/fetch_news.dart';
import 'package:news_app/services/api_service/api_manager.dart';

@LazySingleton(as: ExploreRepository)
class ExploreRepositoryImpl implements ExploreRepository {
  final api = getIt.get<ApiManager>();
  @override
  Future<ApiResult<List<Article>>> fetchNewsByCategory(
      CategoryPayload param) async {
    try {
      final result = await api.fetchNewsByCategory(category: param.category, language: selectedLanguage!);
      return ApiResult.success(
          result.articles.map((e) => e.toArticle()).toList());
    } catch (e) {
      return ApiResult.failure(e);
    }
  }

  @override
  Future<ApiResult<List<Article>>> fetchNewsByQuery(QueryPayload param) async {
    try {
      final result = await api.fetchNewsByQuery(keyword: param.query, language: selectedLanguage!);
      return ApiResult.success(
          result.articles.map((e) => e.toArticle()).toList());
    } catch (e) {
      return ApiResult.failure(e);
    }
  }
}
