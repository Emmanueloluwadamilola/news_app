import 'package:news_app/core/presentation/manager/custom_provider.dart';

class IndexProvider extends CustomProvider {
  int selectedIndex = 0;

  
  setIndex(index) {
    selectedIndex = index;
    notifyListeners();
  }
}
