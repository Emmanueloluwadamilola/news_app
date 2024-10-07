import 'package:logger/logger.dart';
import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/domain/util/util.dart';
import 'package:news_app/core/presentation/manager/custom_provider.dart';
import 'package:news_app/features/home/domain/repository/home_repository.dart';
import 'package:news_app/features/home/domain/usecase/fetch_news_usecase.dart';
import 'package:news_app/features/home/domain/usecase/latest_news_usecase.dart';
import 'package:news_app/features/home/domain/usecase/news_source_usecase.dart';
import 'package:news_app/features/home/presentation/manager/home_state.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends CustomProvider {
  final _pref = getIt.getAsync<SharedPreferences>();
  final repo = getIt.get<HomeRepository>();
  var state = HomeState();

  setInterest() {
    _pref.then((value) {
      value.setBool(interestKey, true);
    });
  }

  setIndex(index) {
    state.selectedIndex = index;
    notifyListeners();
  }

  addInterest(int index) {
    state.selectedInterest.add(index);
    notifyListeners();
  }

  removeInterest(int index) {
    state.selectedInterest.remove(index);
    notifyListeners();
  }

  fetchNews() {
    state.isLoading = true;
    notifyListeners();

    FetchNewsUsecase(repo).invoke().then((value) {
      final response = value.getOrElse((error) {
        add(error);
        return null;
      });
      if (response != null) {
        add(1);

        for (int i = 0; i < response.length; i++) {
          if (response[i].content != 'null' ||
              response[i].urlToImage != null ||
              response[i].title != '[Removed]' ||
              response[i].description != '[Removed]') {
            state.news.add(response[i]);
          }
        }

        state.breakingNews = state.news.take(10).toList();
        state.forYou = state.news.sublist(10);

        Logger().i('>>>>>>>>>>> news fetched');
      }

      state.isLoading = false;
      notifyListeners();
    });
  }

  fetchLatestNews() {
    state.isLoading = true;
    notifyListeners();

    LatestNewsUsecase(repo).invoke().then((value) {
      final response = value.getOrElse((error) {
        add(error);
        return null;
      });

      if (response != null) {
        add(2);
        state.latestNews = response;
        Logger().i('>>>>>>>>>>> Latest news fetched');
      }

      state.isLoading = false;
      notifyListeners();
    });
  }

  shareNews(String url) async {
    await Share.shareUri(Uri.parse(url));
  }

  fetchNewsSource() async {
    state.newsSorceLoading = true;
    notifyListeners();

    NewsSourceUsecase(repo).invoke().then(
      (value) {
        final response = value.getOrElse((error) {
          add(error);
          return null;
        });

        if (response != null) {
          
          state.newsMedia = response;
          Logger().i('>>>>>>>>>>> news sources fetched');
        
        }
         state.newsSorceLoading = false;
      notifyListeners();
      },
    );
  }
}
