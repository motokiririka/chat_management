import 'package:management_app_chat/features/auth/repo/auth_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    await ref.read(authRepoProvider.notifier).signOut();
    state = const AsyncData(null);
  }

  Future<String> signIn(
      {required String email, required String password}) async {
    state = const AsyncLoading();
    final String result = await ref
        .read(authRepoProvider.notifier)
        .signIn(email: email, password: password);
    state = const AsyncData(null);
    return result;
  }

  Future<String> authorizedUserSignIn(
      {required String email, required String password}) async {
    state = const AsyncLoading();

    final String result = await ref
        .read(authRepoProvider.notifier)
        .authorizedUserSignIn(email: email, password: password);
    state = const AsyncData(null);
    return result;
  }

  Future<String> updateEmail({required String email}) async {
    state = const AsyncLoading();
    final result =
        await ref.read(authRepoProvider.notifier).updateEmail(email: email);
    state = const AsyncData(null);
    return result;
  }

  Future<String> resetPassword() async {
    state = const AsyncLoading();
    final result = await ref.read(authRepoProvider.notifier).resetPassword();
    state = const AsyncData(null);
    return result;
  }

  Future<String> updatePassWord({required String passWord}) async {
    state = const AsyncLoading();
    final result = await ref
        .read(authRepoProvider.notifier)
        .updatePassword(passWord: passWord);
    state = const AsyncData(null);
    return result;
  }

  Future<String> createUser(
      {required String email, required String password}) async {
    state = const AsyncLoading();
    final result = await ref
        .read(authRepoProvider.notifier)
        .createUser(email: email, password: password);
    state = const AsyncData(null);
    return result;
  }
}
