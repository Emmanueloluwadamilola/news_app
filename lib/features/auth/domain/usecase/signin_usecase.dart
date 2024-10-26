import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/core/domain/usecase/usecase.dart';
import 'package:news_app/features/auth/domain/entity/payload/auth_payload.dart';
import 'package:news_app/features/auth/domain/repository/auth_repository.dart';

class SigninUsecase implements UseCase<UserCredential, AuthPayload> {
  late AuthRepository repository;
  SigninUsecase(this.repository, this.param);

  @override
  Future<ApiResult<UserCredential>> invoke() {
    
    return repository.signIn(param);
  }

  @override
  AuthPayload param;
}
