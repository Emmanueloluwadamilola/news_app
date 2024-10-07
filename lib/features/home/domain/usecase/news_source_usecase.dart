import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/core/domain/usecase/usecase.dart';
import 'package:news_app/features/home/domain/entities/model/news_source.dart';
import 'package:news_app/features/home/domain/repository/home_repository.dart';

class NewsSourceUsecase implements UseCase<List<NewsSource>, void> {
  late HomeRepository repository;
  NewsSourceUsecase(this.repository);

  @override
  Future<ApiResult<List<NewsSource>>> invoke() {
    return repository.fetchNewsSource();
  }

  @override
  void get param => throw UnimplementedError();
}
