import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/presentation/manager/custom_provider.dart';
import 'package:news_app/features/explore/domain/entities/param/category_param.dart';
import 'package:news_app/features/explore/domain/entities/param/query_param.dart';
import 'package:news_app/features/explore/domain/repository/repository.dart';
import 'package:news_app/features/explore/domain/usecase/news_category_usecase.dart';
import 'package:news_app/features/explore/domain/usecase/news_query_usecase.dart';
import 'package:news_app/features/explore/presentation/manager/explore_state.dart';

class ExploreProvider extends CustomProvider {
  var state = ExploreState();
  final repo = getIt.get<ExploreRepository>();

  setIndex(int index) {
    state.selectedIndex = index;
    notifyListeners();
  }

  setKeyword(String value) {
    state.keyword = value;
    notifyListeners();
  }

  fetchNewsCategory(String category) {
    state.isLoading = true;
    notifyListeners();

    NewsCategoryUsecase(repo, CategoryPayload(category: category))
        .invoke()
        .then((value) {
      final response = value.getOrElse((error) {
        add(error);
        return null;
      });
      if (response != null) {
        add(response);

        state.newsFeed = response;
      }
      state.isLoading = false;
      notifyListeners();
    });
  }

  fetchNewsByQuery() {
    state.isSearching = true;
    notifyListeners();

    NewsQueryUsecase(repo, state.toQuery()).invoke().then((value) {
      final response = value.getOrElse((error) {
        add(error);
        return null;
      });

      if (response != null) {
        add(response);

        state.newsFeed = response;
      }

      state.isSearching = false;
      notifyListeners();
    });
  }
}
