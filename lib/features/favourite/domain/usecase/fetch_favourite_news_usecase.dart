import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/core/domain/usecase/usecase.dart';
import 'package:news_app/features/favourite/domain/entity/model/favourite_model.dart';
import 'package:news_app/features/favourite/domain/repository/favourite_repository.dart';

class FetchFavouriteNewsUsecase implements UseCase<List<NewsArticle>, void> {
  late FavouriteRepository repository;
  FetchFavouriteNewsUsecase(this.repository);

  @override
  Future<ApiResult<List<NewsArticle>>> invoke() {
    return repository.fetchFavourite();
  }

  @override
  void get param => throw UnimplementedError();
}
