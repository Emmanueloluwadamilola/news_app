import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/config/config.dart';
import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/features/favourite/data/dto/add_favourite_dto.dart';
import 'package:news_app/features/favourite/data/dto/news_article_dto.dart';
import 'package:news_app/features/favourite/domain/entity/model/favourite_model.dart';

abstract class FavouriteRemoteDatasource {
  Future<ApiResult<List<NewsArticleDto>>> fetchFavouriteNews();
  Future<ApiResult<AddFavouriteDto>> addFavouriteNews(NewsArticleDto article);
  Future<ApiResult<AddFavouriteDto>> deleteFavouriteNews(
      ArticleId articleId);
}

@LazySingleton(as: FavouriteRemoteDatasource)
class FavouriteRemoteDatasourceImpl implements FavouriteRemoteDatasource {
  final api = getIt.get<FirebaseFirestore>();

  @override
  Future<ApiResult<List<NewsArticleDto>>> fetchFavouriteNews() async {
    try {
      QuerySnapshot querySnapshot = await api
          .collection('users')
          .doc(userId)
          .collection('favourite_news')
          .get();

      return ApiResult.success(querySnapshot.docs
          .map((doc) => NewsArticleDto.fromFirestore(doc))
          .toList());
    } catch (e) {
      return ApiResult.failure(e);
    }
  }

  @override
  Future<ApiResult<AddFavouriteDto>> addFavouriteNews(
      NewsArticleDto article) async {
    try {
      await api
          .collection('users')
          .doc(userId)
          .collection('favourite_news')
          .doc(article.title)
          .set(article.toFirestore());

      return ApiResult.success(AddFavouriteDto(done: true));
    } catch (e) {
      throw ApiResult.failure(e);
    }
  }

  @override
  Future<ApiResult<AddFavouriteDto>> deleteFavouriteNews(
      ArticleId articleId) async {
    try {
      await api
          .collection('users')
          .doc(userId)
          .collection('favourite_news')
          .doc(articleId.title)
          .delete();

      return ApiResult.success(AddFavouriteDto(done: true));
    } catch (e) {
      throw ApiResult.failure(e);
    }
  }
}
