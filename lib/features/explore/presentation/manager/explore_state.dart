import 'package:news_app/features/explore/domain/entities/param/query_param.dart';
import 'package:news_app/features/home/domain/entities/model/fetch_news.dart';

class ExploreState {
  List<String> newscategory = [
    'General',
    'Sports',
    'Business',
    'Entertainment',
    'Science',
    'Technology',
    'Health'
  ];

  int selectedIndex = 0;
  bool isLoading = false;
  bool isSearching = false;
  String keyword = '';

  List<Article> newsFeed = [];

  QueryPayload toQuery() {
    return QueryPayload(query: keyword);
  }
}
