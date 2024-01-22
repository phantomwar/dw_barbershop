import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/local_storage_keys.dart';
import '../../core/providers/app_providers.dart';
import '../../model/user_model.dart';

part 'splash_vm.g.dart';

enum SplashState {
  initial,
  login,
  loggedADM,
  loggedEmployee,
}

@riverpod
class SplashVM extends _$SplashVM {
  @override
  Future<SplashState> build() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey(LocalStorageKeys.accessToken)) {
      ref.invalidate(getMeProvider);
      ref.invalidate(getMyBarbershopProvider);

      try {
        final userModel = await ref.watch(getMeProvider.future);
        return switch (userModel) {
          UserModelADM() => SplashState.loggedADM,
          UserModelEmployee() => SplashState.loggedEmployee,
        };
      } catch (e) {
        return SplashState.login;
      }
    }

    return SplashState.login;
  }
}
