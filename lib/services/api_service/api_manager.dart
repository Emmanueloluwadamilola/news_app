import 'package:news_app/core/domain/util/util.dart';
import 'package:news_app/features/home/data/dto/fetch_news_dto.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:news_app/features/home/data/dto/news_source_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: '')
abstract class ApiManager {
  factory ApiManager(Dio dio, {String baseUrl}) = _ApiManager;

  @GET('${newsData}language=en&apiKey=$apiKeyNewsDataApi')
  Future<FetchNewsDto> fetchNews();

  @GET(
      'https://newsapi.org/v2/top-headlines/sources?language=$selectedLanguage&apiKey=$apiKeyNewsDataApi')
  Future<NewsSourceDto> fetchNewsSource();

  @GET('https://newsapi.org/v2/top-headlines')
  Future<FetchNewsDto> fetchNewsByCategory({
    @Query('language') String language = selectedLanguage,
    @Query('category') required String category,
    @Query('apiKey') String apiKey = apiKeyNewsDataApi,
  });

  @GET('https://newsapi.org/v2/everything')
  Future<FetchNewsDto> fetchNewsByQuery({
    @Query('language') String language = selectedLanguage,
    @Query('q') required String keyword,
    @Query('apiKey') String apiKey = apiKeyNewsDataApi,
  });
}
