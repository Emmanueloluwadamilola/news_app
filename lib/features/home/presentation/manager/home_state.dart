import 'package:news_app/core/presentation/res/drawables.dart';

class HomeState {
  List<String> interestName = [
    'Sport',
    'Crypto',
    'Business',
    'Science',
    'Tech',
    'Finance',
    'Travel',
  ];

  List<String> interestImage = [
    imgFootball,
    imgCrypto,
    imgBusiness,
    imgScience,
    imgTechnology,
    imgFinance,
    imgTravel,
  ];

  List<String> newscategory = [
    'All',
    'Sport',
    'Crypto',
    'Business',
    'Science',
    'Tech',
    'Finance',
    'Travel',
  ];

  List<int> selectedInterest = [];

  int selectedIndex = 0;
}
