import 'package:logger/logger.dart';
import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/domain/util/util.dart';
import 'package:news_app/core/domain/validation/validation.dart';
import 'package:news_app/core/presentation/manager/custom_provider.dart';
import 'package:news_app/features/auth/domain/repository/auth_repository.dart';
import 'package:news_app/features/auth/domain/usecase/signin_usecase.dart';
import 'package:news_app/features/auth/domain/usecase/signup_usecase.dart';
import 'package:news_app/features/auth/presentation/manager/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider extends CustomProvider {
  var state = AuthState();
  final _pref = getIt.getAsync<SharedPreferences>();
  final repo = getIt.get<AuthRepository>();

  setLanaguage(String language) {
    state.selectedLanaguage = language;
    _pref.then((value) {
      value.setString(languageKey, language);
    });
    selectedLanguage = language;
    notifyListeners();
  }

  setPassword(String password) {
    state.password = password;
    state.passwordError = password.validatePassword();
    notifyListeners();
  }

  signIn() async {
    state.isLoading = true;
    notifyListeners();
    // await Future.delayed(const Duration(seconds: 4));
    // Logger().i('>>>>> Done');
    // state.isLoading = false;
    // notifyListeners();
    // return 'Done';

    await SigninUsecase(repo, state.toSignIn()).invoke().then((value) {
      final response = value.getOrElse((error) {
        add(error);
        Logger().i(error);
        state.isLoading = false;
        notifyListeners();
        return;
      });
      if (response != null) {
        add(1);
        Logger().i(response);
        return response;
      }
      state.isLoading = false;
      notifyListeners();
    });
  }

  signUp() async {
    state.isLoading = true;
    notifyListeners();

    await SignupUsecase(repo, state.toAuthenticate()).invoke().then((value) {
      final response = value.getOrElse((error) {
        add(error);
        Logger().e(error);
        return null;
      });
      if (response != null) {
        add(1);
        Logger().i(response);
        return response;
      }
      state.isLoading = false;
      notifyListeners();
    });
  }
}
