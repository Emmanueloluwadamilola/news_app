import 'package:injectable/injectable.dart';
import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/features/favourite/data/dto/news_article_dto.dart';
import 'package:news_app/features/favourite/data/data_source/favourite_remote_datasource.dart';
import 'package:news_app/features/favourite/domain/entity/model/add_favourite_model.dart';
import 'package:news_app/features/favourite/domain/entity/model/favourite_model.dart';
import 'package:news_app/features/favourite/domain/repository/favourite_repository.dart';

@LazySingleton(as: FavouriteRepository)
class FavouriteRepositoryImpl implements FavouriteRepository {
  final remoteDatasource = getIt.get<FavouriteRemoteDatasource>();

  @override
  Future<ApiResult<List<NewsArticle>>> fetchFavourite() async {
    return await remoteDatasource.fetchFavouriteNews();
  }

  @override
  Future<ApiResult<AddFavouriteModel>> addFavourite(NewsArticle param) async {
    return await remoteDatasource
        .addFavouriteNews(NewsArticleDto.fromEntity(param));
  }

  @override
  Future<ApiResult<AddFavouriteModel>> deleteFavourite(ArticleId param) async {
    return await remoteDatasource.deleteFavouriteNews(param);
  }
}
