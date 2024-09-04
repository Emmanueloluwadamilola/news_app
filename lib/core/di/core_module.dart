import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
@module
abstract class CoreModule {
  Dio dio() {
    final dio = Dio();
    dio.interceptors.add(AwesomeDioInterceptor());

    // Add Interceptor to handle token expiration
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          if (error.response?.statusCode == 401 &&
              error.response?.data['message'] == 'Unauthorized') {
            // _handleTokenExpiration();
          }
          return handler.next(error);
        },
      ),
    );
    return dio;
  }

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
