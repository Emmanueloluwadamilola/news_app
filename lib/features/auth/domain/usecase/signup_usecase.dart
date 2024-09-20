import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/domain/api_response/api_result.dart';
import 'package:news_app/core/domain/usecase/usecase.dart';
import 'package:news_app/features/auth/domain/entity/payload/auth_payload.dart';
import 'package:news_app/features/auth/domain/repository/auth_repository.dart';


class SignupUsecase implements UseCase<UserCredential, AuthPayload> {
  late AuthRepository repository;

  SignupUsecase(this.repository, this.param);

  @override
  Future<ApiResult<UserCredential>> invoke() {
    // TODO: implement invoke
    return repository.signUp(param);
  }
  
  @override
  // TODO: implement param
  AuthPayload param;
}