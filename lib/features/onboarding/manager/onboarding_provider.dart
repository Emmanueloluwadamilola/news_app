import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/domain/util/util.dart';
import 'package:news_app/core/presentation/manager/custom_provider.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingProvider extends CustomProvider {
  final _pref = getIt.getAsync<SharedPreferences>();
  int page = 0;
  final imgs = [
    imgOnboarding1,
    imgOnboarding2,
    imgOnboarding3,
  ];

  final title = [
    'Trending news always updated',
    'Most trusted in the world',
    'Lets start reading',
  ];

  final subTitle = [
    'We offers you the fastest and most reliable internet service, right where you need it',
    'Easily manage your subscriptions, make payments, and access all internet features in one place',
    'Enjoy seamless connectivity for streaming, gaming, and browsing with our state-of-the-art network',
  ];

  final logn = ['Continue', 'Next', 'Create Account'];

  setPage(int page) {
    this.page = page;
    notifyListeners();
  }

  bool isEnd() {
    return page == imgs.length - 1;
  }

  setOnboarding() {
    _pref.then((value) {
      value.setBool(onboardingKey, true);
    });
  }
}
