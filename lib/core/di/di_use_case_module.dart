import 'package:flutter_template/core/use_cases/get_user_info_use_case.dart';
import 'package:flutter_template/core/use_cases/sign_in_use_case.dart';
import 'package:flutter_template/core/use_cases/sign_out_use_case.dart';
import 'package:flutter_template/core/use_cases/track_auth_use_case.dart';
import 'package:get_it/get_it.dart';

class UseCaseDiModule {
  UseCaseDiModule._privateConstructor();

  static final UseCaseDiModule _instance =
      UseCaseDiModule._privateConstructor();

  factory UseCaseDiModule() {
    return _instance;
  }

  void setupModule(GetIt locator) {
    locator.registerFactory(() => GetUserInfoUseCase(locator.get()));
    locator.registerFactory(() => SignInUseCase(locator.get()));
    locator.registerFactory(() => SignOutUseCase(locator.get()));
    locator.registerFactory(() => TrackAuthUseCase(locator.get()));
  }
}
