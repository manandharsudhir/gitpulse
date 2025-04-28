import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gitpulse/core/constants/storage_constant.dart';
import 'package:gitpulse/core/models/response/response_status.dart';
import 'package:gitpulse/core/services/storage/storage_services.dart';
import 'package:gitpulse/features/auth/repo/auth_repo.dart';

final loginProvider =
    StateNotifierProvider.autoDispose<LoginProvider, ResponseStatus>((ref) {
  return LoginProvider(ref);
});

class LoginProvider extends StateNotifier<ResponseStatus> {
  LoginProvider(this.ref) : super(const ResponseStatus.initial());
  final Ref ref;

  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      state = const ResponseStatus.progress();
      final response = await AuthRepo.instance.login(email, password);
      SharedPreferencesImp.write(StorageConstant.token, response.token);

      state = ResponseStatus.success(data: response);
    } catch (e) {
      state = ResponseStatus.error(e.toString());
    }
  }
}
