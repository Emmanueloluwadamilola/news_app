import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/features/home/domain/entities/model/fetch_news.dart';
import 'package:news_app/features/home/domain/entities/model/latest_news.dart';
import 'package:news_app/features/home/domain/entities/model/news_source.dart';

abstract class HomeRepository {
  Future<ApiResult<List<Article>>> fetchNews();
  Future<ApiResult<List<NewsSource>>> fetchNewsSource();

  Future<ApiResult<List<LatestNews>>> fetchLatestNews();
}
