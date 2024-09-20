import 'package:news_app/features/auth/domain/entity/payload/auth_payload.dart';

class AuthState {
  bool isLoading = false;
  String email = '';
  String password = '';
  String name = '';

  AuthPayload toAuthenticate() {
    return AuthPayload(email: email, password: password, name: name);
  }
}
