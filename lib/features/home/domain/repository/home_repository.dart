import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/features/home/domain/entities/model/fetch_news.dart';

abstract class HomeRepository{
  Future<ApiResult<List<Article>>> fetchNews();
}