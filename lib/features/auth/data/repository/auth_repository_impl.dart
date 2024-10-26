import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/config/config.dart';
import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/features/auth/domain/entity/payload/auth_payload.dart';
import 'package:news_app/features/auth/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final api = getIt.get<FirebaseAuth>();
  @override
  Future<ApiResult<UserCredential>> signIn(AuthPayload param) async {
    try {
      final result = await api.signInWithEmailAndPassword(
          email: param.email, password: param.password);
      user = result.user;
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e);
    }
  }

  @override
  Future<ApiResult<User>> signUp(AuthPayload param) async {
    try {
      await api.createUserWithEmailAndPassword(
          email: param.email, password: param.password);

     await api.currentUser?.updateProfile(displayName: param.name);

     user = api.currentUser;
      return ApiResult.success(user!);
    } catch (e) {
      return ApiResult.failure(e);
    }
  }
}
