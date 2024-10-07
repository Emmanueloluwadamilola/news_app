import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/core/domain/usecase/usecase.dart';
import 'package:news_app/features/explore/domain/entities/param/query_param.dart';
import 'package:news_app/features/explore/domain/repository/repository.dart';
import 'package:news_app/features/home/domain/entities/model/fetch_news.dart';

class NewsQueryUsecase implements UseCase<List<Article>, QueryPayload> {
  late ExploreRepository repository;

  NewsQueryUsecase(this.repository, this.param);

  @override
  Future<ApiResult<List<Article>>> invoke() {
    return repository.fetchNewsByQuery(param);
  }

  @override
  QueryPayload param;
}
