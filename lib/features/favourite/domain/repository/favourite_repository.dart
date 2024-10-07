import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/features/favourite/domain/entity/model/add_favourite_model.dart';
import 'package:news_app/features/favourite/domain/entity/model/favourite_model.dart';

abstract class FavouriteRepository {
  Future<ApiResult<List<NewsArticle>>> fetchFavourite();
  Future<ApiResult<AddFavouriteModel>> addFavourite(NewsArticle param);
  Future<ApiResult<AddFavouriteModel>> deleteFavourite(ArticleId param);
}
