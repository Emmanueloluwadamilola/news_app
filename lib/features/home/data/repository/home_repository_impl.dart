import 'package:injectable/injectable.dart';
import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/core/domain/util/util.dart';
import 'package:news_app/features/home/domain/entities/model/fetch_news.dart';
import 'package:news_app/features/home/domain/entities/model/latest_news.dart';
import 'package:news_app/features/home/domain/entities/model/news_source.dart';
import 'package:news_app/features/home/domain/repository/home_repository.dart';
import 'package:news_app/services/api_service/api_manager.dart';
import 'package:news_app/services/api_service/api_service.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final api = getIt.get<ApiManager>();
  final apiService = getIt.get<ApiService>();

  @override
  Future<ApiResult<List<Article>>> fetchNews() async {
    try {
      final result = await api.fetchNews(language: selectedLanguage!);
      return ApiResult.success(
          result.articles.map((e) => e.toArticle()).toList());
    } catch (e) {
      return ApiResult.failure(e);
    }
  }

  @override
  Future<ApiResult<List<LatestNews>>> fetchLatestNews() async {
    // try {
    final result = await apiService.fetchLatestNews();
    return ApiResult.success(
        result.results.map((e) => e.toLatestNews()).toList());
    // } catch (e) {
    //   return ApiResult.failure(e);
    // }
  }

  @override
  Future<ApiResult<List<NewsSource>>> fetchNewsSource() async {
    try {
      final result = await api.fetchNewsSource(language: selectedLanguage!);
      return ApiResult.success(
          result.sources.map((e) => e.toNewsSource()).toList());
    } catch (e) {
      return ApiResult.failure(e);
    }
  }
}
