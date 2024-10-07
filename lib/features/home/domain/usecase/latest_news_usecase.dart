import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/core/domain/usecase/usecase.dart';
import 'package:news_app/features/home/domain/entities/model/latest_news.dart';
import 'package:news_app/features/home/domain/repository/home_repository.dart';

class LatestNewsUsecase implements UseCase<List<LatestNews>, void> {
  late HomeRepository repository;

  LatestNewsUsecase(this.repository);
  @override
  Future<ApiResult<List<LatestNews>>> invoke() {
    return repository.fetchLatestNews();
  }

  @override
  void get param => throw UnimplementedError();
}
