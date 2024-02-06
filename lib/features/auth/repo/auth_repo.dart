import 'package:firebase_auth/firebase_auth.dart';
import 'package:management_app_chat/firebase/firebase_auth_error_text.dart';
import 'package:management_app_chat/firebase/firebase_instance_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repo.g.dart';

@riverpod
class AuthRepo extends _$AuthRepo {
  @override
  User? build() {
    return ref.watch(firebaseAuthInstanceProvider).currentUser;
  }

  //ログイン処理
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await ref
          .read(firebaseAuthInstanceProvider)
          .signInWithEmailAndPassword(email: email, password: password);
      state = ref.read(firebaseAuthInstanceProvider).currentUser;
      return 'success';
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthErrorExt.fromCode(e.code).message;
    } catch (e) {
      return 'error';
    }
  }

//権限のあるユーザーだけログインできるようにする
  Future<String> authorizedUserSignIn({
    required String email,
    required String password,
  }) async {
    if (email != 'ririka@example.com') {
      return "権限のあるユーザーではありません";
    }
    try {
      await ref
          .read(firebaseAuthInstanceProvider)
          .signInWithEmailAndPassword(email: email, password: password);
      state = ref.read(firebaseAuthInstanceProvider).currentUser;
      return 'success';
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthErrorExt.fromCode(e.code).message;
    } catch (e) {
      return 'error';
    }
  }

  //ログアウト処理
  Future<void> signOut() async {
    await ref.read(firebaseAuthInstanceProvider).signOut();
    state = ref.read(firebaseAuthInstanceProvider).currentUser;
  }

  //新規登録処理
  Future<String> createUser(
      {required String email, required String password, required}) async {
    try {
      await ref
          .read(firebaseAuthInstanceProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
      state = ref.read(firebaseAuthInstanceProvider).currentUser;
      return 'success';
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthErrorExt.fromCode(e.code).message;
    } catch (e) {
      return 'error';
    }
  }

  //パスワードリマインダーメールの送信
  Future<String> resetPassword() async {
    try {
      await ref
          .read(firebaseAuthInstanceProvider)
          .sendPasswordResetEmail(email: state!.email!);
      return 'success';
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthErrorExt.fromCode(e.code).message;
    } catch (e) {
      return e.toString();
    }
  }

  //メールアドレスの変更
  Future<String> updateEmail({
    required String email,
  }) async {
    try {
      await ref
          .read(firebaseAuthInstanceProvider)
          .currentUser!
          // ignore: deprecated_member_use
          .updateEmail(email);
      return 'success';
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthErrorExt.fromCode(e.code).message;
    } catch (e) {
      return 'error';
    }
  }

//パスワード変更
  Future<String> updatePassword({
    required String passWord,
  }) async {
    try {
      await ref
          .read(firebaseAuthInstanceProvider)
          .currentUser!
          .updatePassword(passWord);
      return 'success';
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthErrorExt.fromCode(e.code).message;
    } catch (e) {
      return 'error';
    }
  }

  //authStateChangeを監視する
  Stream<User?> authStateChange() {
    return ref
        .read(firebaseAuthInstanceProvider)
        .authStateChanges()
        .map((User? currentUser) {
      state = currentUser;
      return state;
    });
  }
}
