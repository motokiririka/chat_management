import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:management_app_chat/firebase/firebase_instance_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_repo.g.dart';

@riverpod
class StorageRepo extends _$StorageRepo {
  @override
  Reference build() {
    return ref.read(firebaseStorageInstanceProvider).ref();
  }

  //アイコン画像をアップロード
  Future<String> uploadIconImageAndGetUrl(String userId, File image) async {
    //画像をアップロード
    final uploadIconImage = await state.child('user/$userId').putFile(image);
    //アップロードした画像のURLを取得
    final downloadIconUrl = await uploadIconImage.ref.getDownloadURL();
    return downloadIconUrl;
  }

  //アイコン画像を削除
  Future<void> deleteImage(String userId) async {
    await state.child('users/$userId').delete();
  }

  //チャットの画像をアップロード
  Future<String> uploadChatImageAndGetUrl(String uuid, File image) async {
    //画像をアップロード
    final uploadChatImage = await state.child('chat/$uuid').putFile(image);
    //アップロードした画像のURLを取得
    final downloadIconUrl = await uploadChatImage.ref.getDownloadURL();
    return downloadIconUrl;
  }
}
