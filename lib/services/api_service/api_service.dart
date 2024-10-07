import 'package:news_app/core/domain/util/util.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:news_app/features/home/data/dto/latest_news_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: newsIo, )
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('apiKey=$apiKeyNewsIo&language=en')
  Future<LatestNewsDto> fetchLatestNews();
}