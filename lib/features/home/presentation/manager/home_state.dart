import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/features/home/domain/entities/model/fetch_news.dart';

class HomeState {
  bool isLoading = false;
  String? userName =
      FirebaseAuth.instance.currentUser?.displayName!.split(' ')[0];
  List<Article> news = [];
  List<Article> breakingNews = [];
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
