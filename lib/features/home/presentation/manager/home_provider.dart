import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/domain/util/util.dart';
import 'package:news_app/core/presentation/manager/custom_provider.dart';
import 'package:news_app/features/home/presentation/manager/home_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends CustomProvider {
  final _pref = getIt.getAsync<SharedPreferences>();
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
}
