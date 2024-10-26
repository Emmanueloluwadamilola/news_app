import 'package:news_app/core/config/config.dart';

import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/features/home/domain/entities/model/fetch_news.dart';
import 'package:news_app/features/home/domain/entities/model/latest_news.dart';
import 'package:news_app/features/home/domain/entities/model/news_source.dart';

class HomeState {
  bool isLoading = false;
  bool newsSorceLoading = false;
  String? userName = userInfo.displayName?.split(' ')[0];
  String? firstName = userInfo.displayName?.split(' ')[1];


  List<LatestNews> latestNews = [];
  List<Article> news = [];
  List<Article> breakingNews = [];
  List<Article> forYou = [];
  List<String> interestName = [
    'Sport',
    'Crypto',
    'Business',
    'Science',
    'Tech',
    'Finance',
    'Travel',
  ];
  List<NewsSource> newsMedia = [];

  List<String> interestImage = [
    imgFootball,
    imgCrypto,
    imgBusiness,
    imgScience,
    imgTechnology,
    imgFinance,
    imgTravel,
  ];

  // List<String> newscategory = [
  //   'All',
  //   'Sport',
  //   'Crypto',
  //   'Business',
  //   'Science',
  //   'Tech',
  //   'Finance',
  //   'Travel',
  // ];

  List<int> selectedInterest = [];

}
