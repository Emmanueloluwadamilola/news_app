import 'package:news_app/features/auth/domain/entity/payload/auth_payload.dart';

class AuthState {
  bool isLoading = false;
  String email = '';
  String password = '';
  String? passwordError;
  String name = '';
  String selectedLanaguage = '';
  List<String> language = [
    'Arabic',
    'German',
    'English',
    'Spanish',
    'French',
    'Italian',
  ];
  List<String> languageCode = [
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'it',
  ];

  AuthPayload toAuthenticate() {
    return AuthPayload(email: email, password: password, name: name);
  }

  AuthPayload toSignIn() {
    return AuthPayload(email: email, password: password);
  }
}
