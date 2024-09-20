// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:news_app/core/di/core_module.dart' as _i497;
import 'package:news_app/features/auth/data/repository/auth_repository_impl.dart'
    as _i830;
import 'package:news_app/features/auth/domain/repository/auth_repository.dart'
    as _i658;
import 'package:news_app/features/home/data/repository/home_repository_impl.dart'
    as _i939;
import 'package:news_app/features/home/domain/repository/home_repository.dart'
    as _i550;
import 'package:news_app/services/api_service/api_manager.dart' as _i100;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModule = _$CoreModule();
    gh.factory<_i361.Dio>(() => coreModule.dio());
    gh.factoryAsync<_i460.SharedPreferences>(() => coreModule.preferences());
    gh.singleton<_i100.ApiManager>(() => coreModule.apiManager);
    gh.singleton<_i59.FirebaseAuth>(() => coreModule.firebaseAuth);
    gh.lazySingleton<_i658.AuthRepository>(() => _i830.AuthRepositoryImpl());
    gh.lazySingleton<_i550.HomeRepository>(() => _i939.HomeRepositoryImpl());
    return this;
  }
}

class _$CoreModule extends _i497.CoreModule {}
