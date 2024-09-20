import 'dart:ffi';

import 'package:injectable/injectable.dart';
import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/core/domain/usecase/usecase.dart';
import 'package:news_app/features/home/domain/entities/model/fetch_news.dart';
import 'package:news_app/features/home/domain/repository/home_repository.dart';

class FetchNewsUsecase implements UseCase<List<Article>, void> {
  late HomeRepository repository;

  FetchNewsUsecase(this.repository);
  @override
  Future<ApiResult<List<Article>>> invoke() {
    // TODO: implement invoke
    return repository.fetchNews();
  }

  @override
  // TODO: implement param
  get param => throw UnimplementedError();
}
