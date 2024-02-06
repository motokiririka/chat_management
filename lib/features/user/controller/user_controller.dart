import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:management_app_chat/features/auth/repo/auth_repo.dart';
import 'package:management_app_chat/features/user/data_model/userdata.dart';
import 'package:management_app_chat/features/user/repo/user_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
    // return AsyncLoading();
  }

  Future<void> updateUserName(String newUserName, UserData myAccount) async {
    state = const AsyncLoading();
    final UserData updateAccount = myAccount.copyWith(userName: newUserName);
    await ref.read(userRepoProvider.notifier).updateUser(updateAccount);
    state = const AsyncData(null);
  }

  Future<UserData?> getAccount() async {
    state = const AsyncLoading();
    final UserData? userData = await ref
        .read(userRepoProvider.notifier)
        .getAccount(ref.read(authRepoProvider)!.uid);
    state = const AsyncData(null);
    return userData;
  }

  Future<void> updateUserImageUrl(
      UserData myUserData, String downloadUrl) async {
    state = const AsyncLoading();
    final UserData updateUserData = myUserData.copyWith(imageUrl: downloadUrl);
    await ref.read(userRepoProvider.notifier).updateUser(updateUserData);
    state = const AsyncData(null);
  }

  Future<void> updateUser(
    UserData myUserData,
    String downloadImage,
    String profile,
    String userName,
    List<String> nameOption,
  ) async {
    state = const AsyncLoading();
    final UserData updateUserData = myUserData.copyWith(
      nameOption: nameOption,
      imageUrl: downloadImage,
      profile: profile,
      userName: userName,
      updatedAt: Timestamp.now(),
    );
    await ref.read(userRepoProvider.notifier).updateUser(updateUserData);

    state = const AsyncData(null);
  }

  Future<void> updateIconImage(
    UserData myUserData,
    String downloadImage,
    String profile,
    String userName,
    List<String> nameOption,
  ) async {
    state = const AsyncLoading();
    final UserData updateUserData = myUserData.copyWith(
      nameOption: nameOption,
      imageUrl: downloadImage,
      profile: profile,
      userName: userName,
      updatedAt: Timestamp.now(),
    );
    await ref.read(userRepoProvider.notifier).updateUser(updateUserData);

    state = const AsyncData(null);
  }

  Future<void> createUser() async {
    state = const AsyncLoading();
    UserData addAccount = UserData(
      userId: ref.read(authRepoProvider)!.uid,
      userName: '',
      createdAt: Timestamp.now(),
      imageUrl: '',
      profile: '',
      updatedAt: Timestamp.now(),
      nameOption: [],
    );
    await ref.read(userRepoProvider.notifier).createUser(addAccount);
    state = const AsyncData(null);
  }
}

@riverpod
Stream<List<UserData>> watchUsersController(WatchUsersControllerRef ref) {
  final int limit = ref.watch(allManagementUserLimitControllerProvider);
  return ref.watch(userRepoProvider.notifier).watchFiveUsers(limit);
}

@riverpod
Stream<List<UserData>> searchUserName(
    SearchUserNameRef ref, String queryString) {
  if (queryString.isEmpty) {
    return ref.watch(userRepoProvider.notifier).watchUsers();
  } else {
    return ref.watch(userRepoProvider.notifier).searchUserName(queryString);
  }
}

@riverpod
Stream<List<UserData>> searchFiveUserController(
    SearchFiveUserControllerRef ref, String queryString) {
  final int limit = ref.watch(userLimitControllerProvider);
  final int allLimit = ref.watch(allUserLimitControllerProvider);

  if (queryString.isEmpty) {
    return ref.watch(userRepoProvider.notifier).watchFiveUsers(allLimit);
  } else {
    return ref
        .watch(userRepoProvider.notifier)
        .searchFiveUserName(queryString, limit);
  }
}

@riverpod
Stream<UserData?> watchAccountController(
    WatchAccountControllerRef ref, String userId) {
  return ref.watch(userRepoProvider.notifier).watchAccount(userId);
}

//自分のユーザードキュメントを監視するプロバイダー
@riverpod
Stream<UserData?> watchMyAccountController(WatchMyAccountControllerRef ref) {
  return ref
      .watch(userRepoProvider.notifier)
      .watchAccount(ref.watch(authRepoProvider)!.uid);
}

@riverpod
class UserLimitController extends _$UserLimitController {
  @override
  int build() {
    return 4;
  }

  void increment() {
    state = state + 4;
  }
}

@riverpod
class AllUserLimitController extends _$AllUserLimitController {
  @override
  int build() {
    return 4;
  }

  void increment() {
    state = state + 4;
  }
}

@riverpod
class AllManagementUserLimitController extends _$AllUserLimitController {
  @override
  int build() {
    return 15;
  }

  void increment() {
    state = state + 15;
  }
}
