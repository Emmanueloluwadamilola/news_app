import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/services/api_service/api_manager.dart';
import 'package:news_app/services/api_service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class CoreModule {
  Dio dio() {
    final dio = Dio()..interceptors.add(AwesomeDioInterceptor());
    return dio;
  }

  @singleton
  ApiManager get apiManager => ApiManager(dio());

  @singleton
  ApiService get apiService => ApiService(dio());

  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @singleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @singleton 
  // FavouriteRemoteDatasource get remoteDataSource => FavouriteRemoteDatasource()

  Future<SharedPreferences> preferences() {
    return SharedPreferences.getInstance();
  }

  //This function clears all stored user
  // preferences (excluding the onboarding key) and navigates to login screen
  // _handleTokenExpiration() {
  //   preferences().then((value) {
  //     value.remove(tokenKey);
  //     value.remove(currentEmail);
  //     value.remove(user);
  //     value.remove(userRoleKey);
  //     value.remove(savedIds);

  //     navigator.currentState?.pushAndRemoveUntil(
  //       CupertinoPageRoute(builder: (context) => const LoginScreen()),
  //       (route) => false,
  //     );
  //   });
  // }
}
