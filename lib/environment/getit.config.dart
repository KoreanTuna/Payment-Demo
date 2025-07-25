// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;
import 'package:payment_demo/core/router/go_router.dart' as _i595;
import 'package:payment_demo/core/router/router_observer.dart' as _i148;
import 'package:payment_demo/core/util/dio.dart' as _i878;
import 'package:payment_demo/core/util/form_data_util.dart' as _i745;
import 'package:payment_demo/core/util/shared_pref_util.dart' as _i846;
import 'package:payment_demo/feature/auth/data/repository/sign_up_repository_impl.dart'
    as _i516;
import 'package:payment_demo/feature/auth/domain/repository/sign_up_repository.dart'
    as _i955;
import 'package:payment_demo/feature/auth/domain/usecase/sign_up_usecase.dart'
    as _i395;
import 'package:payment_demo/feature/card_scan/data/repository/card_scan_repository_impl.dart'
    as _i968;
import 'package:payment_demo/feature/card_scan/domain/repository/card_scan_repository.dart'
    as _i104;
import 'package:payment_demo/feature/card_scan/domain/usecase/card_scan_usecase.dart'
    as _i534;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final dioModule = _$DioModule();
    final goRouterModule = _$GoRouterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i745.FormDataUtil>(() => _i745.FormDataUtil());
    gh.factory<_i148.RouterObserver>(() => _i148.RouterObserver());
    gh.singleton<_i361.Dio>(() => dioModule.createGitHubDio());
    gh.singleton<_i583.GoRouter>(() => goRouterModule.router);
    gh.lazySingleton<_i955.SignUpRepository>(
      () => _i516.SignUpRepositoryImpl(),
    );
    gh.lazySingleton<_i104.CardScanRepository>(
      () => _i968.CardScanRepositoryImpl(),
    );
    gh.singleton<_i846.SharedPrefUtil>(
      () => _i846.SharedPrefUtil(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i534.CardScanUsecase>(
      () => _i534.CardScanUsecase(
        gh<_i104.CardScanRepository>(),
        gh<_i745.FormDataUtil>(),
      ),
    );
    gh.singleton<_i395.SignUpUsecase>(
      () => _i395.SignUpUsecase(gh<_i955.SignUpRepository>()),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i846.SharedPreferencesModule {}

class _$DioModule extends _i878.DioModule {}

class _$GoRouterModule extends _i595.GoRouterModule {}
