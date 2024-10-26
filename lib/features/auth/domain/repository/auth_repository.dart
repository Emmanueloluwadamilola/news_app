import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/features/auth/domain/entity/payload/auth_payload.dart';

abstract class AuthRepository {
  Future<ApiResult<User>> signUp(AuthPayload param);
  Future<ApiResult<UserCredential>> signIn(AuthPayload param);
}
