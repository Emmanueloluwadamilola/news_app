import 'package:logger/logger.dart';
import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/presentation/manager/custom_provider.dart';
import 'package:news_app/features/auth/domain/repository/auth_repository.dart';
import 'package:news_app/features/auth/domain/usecase/signin_usecase.dart';
import 'package:news_app/features/auth/domain/usecase/signup_usecase.dart';
import 'package:news_app/features/auth/presentation/manager/auth_state.dart';

class AuthenticationProvider extends CustomProvider {
  var state = AuthState();
  final repo = getIt.get<AuthRepository>();

  signIn() async {
    state.isLoading = true;
    notifyListeners();

    SigninUsecase(repo, state.toAuthenticate()).invoke().then((value) {
      final response = value.getOrElse((error) {
        add(error);
        Logger().i(error);
        return null;
      });
      if (response != null) {
        add(1);
        Logger().i(response);
      }
      state.isLoading = false;
      notifyListeners();
    });
  }

  signUp() {
    state.isLoading = true;
    notifyListeners();

    SignupUsecase(repo, state.toAuthenticate()).invoke().then((value) {
      final response = value.getOrElse((error) {
        add(error);
        Logger().e(error);
        return null;
      });
      if (response != null) {
        add(1);
        Logger().i(response);
      }
      state.isLoading = false;
      notifyListeners();
    });
  }
}
