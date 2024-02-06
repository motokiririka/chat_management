import 'dart:io';

import 'package:management_app_chat/features/auth/repo/auth_repo.dart';
import 'package:management_app_chat/features/user/repo/storage_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_controller.g.dart';

@riverpod
class StorageController extends _$StorageController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

//アイコンの画像
  Future<String> uploadIconImageAndGetUrl(File image) async {
    state = const AsyncLoading();
    final url = await ref
        .read(storageRepoProvider.notifier)
        .uploadIconImageAndGetUrl(ref.read(authRepoProvider)!.uid, image);
    state = const AsyncData(null);
    return url;
  }

//アイコンの画像削除
  Future<void> deleteImage() async {
    state = const AsyncLoading();
    await ref
        .read(storageRepoProvider.notifier)
        .deleteImage(ref.read(authRepoProvider)!.uid);
    state = const AsyncData(null);
  }

  //chatの画像アップロード
  Future<String> uploadChatImageAndGetUrl(File image, String uuid) async {
    state = const AsyncLoading();
    final url = await ref
        .read(storageRepoProvider.notifier)
        .uploadChatImageAndGetUrl(uuid, image);
    state = const AsyncData(null);
    return url;
  }
}
