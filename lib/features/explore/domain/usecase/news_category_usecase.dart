import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/core/domain/usecase/usecase.dart';
import 'package:news_app/features/explore/domain/entities/param/category_param.dart';
import 'package:news_app/features/explore/domain/repository/repository.dart';
import 'package:news_app/features/home/domain/entities/model/fetch_news.dart';

class NewsCategoryUsecase implements UseCase<List<Article>, CategoryPayload> {
  late ExploreRepository repository;
  NewsCategoryUsecase(this.repository, this.param);

  @override
  Future<ApiResult<List<Article>>> invoke() {
    return repository.fetchNewsByCategory(param);
  }

  @override
  CategoryPayload param;
}
