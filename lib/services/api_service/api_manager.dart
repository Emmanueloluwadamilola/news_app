import 'package:news_app/core/domain/util/util.dart';
import 'package:news_app/features/home/data/dto/fetch_news_dto.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: newsData, )
abstract class ApiManager {
  factory ApiManager(Dio dio, {String baseUrl}) = _ApiManager;

  @GET('language=en&apiKey=$apiKeyNewsDataApi')
  Future<FetchNewsDto> fetchNews();
}
