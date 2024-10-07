import 'package:news_app/features/favourite/domain/entity/model/favourite_model.dart';

class FavouriteState {
  bool isLoading = false;
  bool isFavourite = false;
  List<String> newsTitles = [];
  List<NewsArticle> favouriteNews = [];
}
