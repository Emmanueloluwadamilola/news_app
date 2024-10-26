import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/domain/util/util.dart';
import 'package:news_app/core/presentation/manager/custom_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider extends CustomProvider {
  final _pref = getIt.getAsync<SharedPreferences>();
  SplashProvider() {
    Future.delayed(const Duration(milliseconds: 4000), () {
      _pref.then((value) async {
        selectedLanguage = (await _pref).getString(languageKey);
        if (value.getBool(onboardingKey) == null) {
          add(0);
          return;
        } else if (value.getBool(onboardingKey) != null &&
            selectedLanguage == null) {
          add(-1);
        
        } else {
          add(1);
          return;
        }
      });
    });
  }
}
