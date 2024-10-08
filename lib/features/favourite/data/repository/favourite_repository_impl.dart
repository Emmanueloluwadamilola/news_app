import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
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
    // try {
    final result = await remoteDatasource.fetchFavouriteNews();
    return ApiResult.success(result);
    // } catch (e) {
    //   return ApiResult.failure(e);
    // }
  }

  @override
  Future<ApiResult<AddFavouriteModel>> addFavourite(NewsArticle param) async {
    try {
    final payload = NewsArticleDto.fromNewsArticle(param);
    // NewsArticleDto(
    //     source: param.source,
    //     author: param.author,
    //     content: param.content,
    //     publishedAt: param.publishedAt,
    //     title: param.title,
    //     url: param.url,
    //     urlToImage: param.urlToImage);
    final result = await remoteDatasource.addFavouriteNews(payload);
    Logger().i(result);
    return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e);
    }
  }

  @override
  Future<ApiResult<AddFavouriteModel>> deleteFavourite(ArticleId param) async {
    try {
      final result = await remoteDatasource.deleteFavouriteNews(param);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e);
    }
  }
}
