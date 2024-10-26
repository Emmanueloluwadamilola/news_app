import 'package:logger/logger.dart';
import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/presentation/manager/custom_provider.dart';
import 'package:news_app/features/favourite/data/dto/news_article_dto.dart';
import 'package:news_app/features/favourite/domain/entity/model/favourite_model.dart';
import 'package:news_app/features/favourite/domain/repository/favourite_repository.dart';
import 'package:news_app/features/favourite/domain/usecase/add_favourite_usecase.dart';
import 'package:news_app/features/favourite/domain/usecase/delete_favorite_usecase.dart';
import 'package:news_app/features/favourite/domain/usecase/fetch_favourite_news_usecase.dart';
import 'package:news_app/features/favourite/domain/util/util.dart';
import 'package:news_app/features/favourite/presentation/manager/favourite_state.dart';
import 'package:share_plus/share_plus.dart';

class FavouriteProvider extends CustomProvider {
  final repo = getIt.get<FavouriteRepository>();
  var state = FavouriteState();

  shareNews(String url) async {
    await Share.shareUri(Uri.parse(url));
  }

  addFavourite({
    required String source,
    required String title,
    required String content,
    required String author,
    required String url,
    required String urlToImage,
    required DateTime publishedAt,
  }) async {
    final article = NewsArticleDto.fromNewsArticle(NewsArticle(
        source: source,
        author: author,
        title: title,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content));
    state.favouriteNews.add(article);
    state.isFavourite = true;
    notifyListeners();

    await AddFavouriteUsecase(
      repo,
      NewsArticle(
        source: source,
        author: author,
        title: title,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content,
      ),
    ).invoke().then((value) {
      final response = value.getOrElse((error) {
        add(error);
        state.isFavourite = false;
        notifyListeners();
        return;
      });
      if (response != null) {
        add(0);
        favouriteNewsLength += 1;
        Logger().i('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> add favourite');
      }
    });
  }

  deleteFavourite({required String title}) {
    state.favouriteNews.removeWhere(
      (item) => item.title == title,
    );
    state.isFavourite = false;
    notifyListeners();

    DeleteFavoriteUsecase(repo, ArticleId(title: title)).invoke().then((value) {
      final response = value.getOrElse((error) {
        add(error);
        state.isFavourite = false;
        notifyListeners();
        return;
      });

      if (response != null) {
        add(1);
          favouriteNewsLength -= 1;
        Logger().i('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> delete fvaaourite');
      }
    });
  }

  fetchFavouriteNews() {
    state.isLoading = true;
    notifyListeners();

    FetchFavouriteNewsUsecase(repo).invoke().then((value) {
      final response = value.getOrElse((error) {
        add(error);
        return;
      });

      if (response != null) {
        add(response);
        state.favouriteNews = response;
        for (int i = 0; i < state.favouriteNews.length; i++) {
          state.newsTitles.add(response[i].title!);
        }

        favouriteNewsLength = state.favouriteNews.length;

        Logger().i('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> fetch favourite news');
      }
      state.isLoading = false;
      notifyListeners();
    });
  }

  setFavourite({required String title}) {
    if (state.newsTitles.contains(title)) {
      Logger().d('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $title');
      state.isFavourite = true;
      notifyListeners();
    } else {
      state.isFavourite = false;
      notifyListeners();
    }

    Logger().d('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${state.isFavourite}');
  }
}
