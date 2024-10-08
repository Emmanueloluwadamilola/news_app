import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/config/config.dart';
import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/features/favourite/data/dto/add_favourite_dto.dart';
import 'package:news_app/features/favourite/data/dto/news_article_dto.dart';
import 'package:news_app/features/favourite/domain/entity/model/favourite_model.dart';

abstract class FavouriteRemoteDatasource {
  Future<List<NewsArticleDto>> fetchFavouriteNews();
  Future<AddFavouriteDto> addFavouriteNews(NewsArticleDto article);
  Future<AddFavouriteDto> deleteFavouriteNews(
      ArticleId articleId);
}

@LazySingleton(as: FavouriteRemoteDatasource)
class FavouriteRemoteDatasourceImpl implements FavouriteRemoteDatasource {
  final api = getIt.get<FirebaseFirestore>();

  @override
  Future<List<NewsArticleDto>> fetchFavouriteNews() async {
    final querySnapshot = await api
          .collection('users')
          .doc(userId)
          .collection('favourite_news')
          .get();

      return querySnapshot.docs
          .map((doc) => NewsArticleDto.fromFirestore(doc.data(), doc.id))
          .toList();
   
  }

  @override
  Future<AddFavouriteDto> addFavouriteNews(
      NewsArticleDto article) async {
      await api
          .collection('users')
          .doc(userId)
          .collection('favourite_news')
          .doc(article.title)
          .set(article.toJson());

      return AddFavouriteDto(done: true);

  }

  @override
  Future<AddFavouriteDto> deleteFavouriteNews(
      ArticleId articleId) async {
 
      await api
          .collection('users')
          .doc(userId)
          .collection('favourite_news')
          .doc(articleId.title)
          .delete();

      return AddFavouriteDto(done: true);
   
  }
}
