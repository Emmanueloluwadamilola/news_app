import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/core/domain/usecase/usecase.dart';
import 'package:news_app/features/favourite/domain/entity/model/add_favourite_model.dart';
import 'package:news_app/features/favourite/domain/entity/model/favourite_model.dart';
import 'package:news_app/features/favourite/domain/repository/favourite_repository.dart';

class DeleteFavoriteUsecase implements UseCase<AddFavouriteModel, ArticleId> {
  late FavouriteRepository repository;

  DeleteFavoriteUsecase(this.repository, this.param);

  @override
  Future<ApiResult<AddFavouriteModel>> invoke() {
    return repository.deleteFavourite(param);
  }

  @override
  ArticleId param;
}
