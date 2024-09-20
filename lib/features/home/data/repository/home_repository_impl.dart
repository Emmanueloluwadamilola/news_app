import 'package:injectable/injectable.dart';
import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/features/home/domain/entities/model/fetch_news.dart';
import 'package:news_app/features/home/domain/repository/home_repository.dart';
import 'package:news_app/services/api_service/api_manager.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final api = getIt.get<ApiManager>();

  @override
  Future<ApiResult<List<Article>>> fetchNews() async {
    // try {
      final result = await api.fetchNews();
      return ApiResult.success(
          result.articles.map((e) => e.toArticle()).toList());
    // } catch (e) {
    //   return ApiResult.failure(e);
    // }
  }
}
