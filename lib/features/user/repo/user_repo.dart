import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:management_app_chat/config/utils/keys/firebase_key.dart';
import 'package:management_app_chat/features/auth/repo/auth_repo.dart';
import 'package:management_app_chat/features/user/data_model/userdata.dart';
import 'package:management_app_chat/firebase/firebase_instance_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repo.g.dart';

@riverpod
class UserRepo extends _$UserRepo {
  @override
  CollectionReference<UserData> build() {
    return ref
        .read(firebaseFireStoreInstanceProvider)
        .collection(FirebaseUserKey.userCollection)
        .withConverter<UserData>(
          fromFirestore: (snapshot, _) => UserData.fromJson(snapshot.data()!),
          toFirestore: (UserData value, _) => value.toJson(),
        );
  }

  //ドキュメント追加
  Future<void> createUser(UserData addAccount) async {
    await state.doc(addAccount.userId).set(addAccount);
  }

  //ドキュメント更新
  Future<void> updateUser(UserData updateAccount) async {
    await state.doc(updateAccount.userId).update(updateAccount.toJson());
  }

  Future<void> updateLogIn(UserData updateAccount) async {
    await state.doc(updateAccount.userId).update(updateAccount.toJson());
  }

  //ドキュメント削除
  Future<void> deleteUser(String deleteAccountUserId) async {
    await state.doc(deleteAccountUserId).delete();
  }

  //1件Userドキュメント取得
  Future<UserData?> getAccount(String accountUserId) async {
    final snapshot = await state.doc(accountUserId).get();
    return snapshot.data();
  }

  //Streamでuserドキュメント取得
  Stream<UserData?> watchAccount(String accountUserId) {
    return state.doc(accountUserId).snapshots().map(
          (DocumentSnapshot<UserData> snapshot) => snapshot.data(),
        );
  }

  //検索！！
  Stream<List<UserData>> searchUserName(String queryString) {
    return state
        .where(FirebaseUserKey.nameOption, arrayContains: queryString)
        .snapshots()
        .map(
      (QuerySnapshot<UserData> snapshot) {
        return snapshot.docs.map(
          (QueryDocumentSnapshot<UserData> doc) {
            return doc.data();
          },
        ).toList();
      },
    );
  }

//5件ずつ取得
  Stream<List<UserData>> searchFiveUserName(String queryString, int limit) {
    return state
        .where(FirebaseUserKey.nameOption, arrayContains: queryString)
        .limit(limit)
        .snapshots()
        .map(
      (QuerySnapshot<UserData> snapshot) {
        return snapshot.docs.map(
          (QueryDocumentSnapshot<UserData> doc) {
            return doc.data();
          },
        ).toList();
      },
    );
  }

  //コレクション取得
  Future<List<UserData>> getAccounts() async {
    final snapshot = await state.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  //streamで自分以外のuserListを取得
  Stream<List<UserData>> watchUsers() {
    return state
        .where(FirebaseUserKey.userId,
            isNotEqualTo: ref.read(authRepoProvider)!.uid)
        .snapshots()
        .map(
      (QuerySnapshot<UserData> snapshot) {
        return snapshot.docs.map(
          (QueryDocumentSnapshot<UserData> doc) {
            return doc.data();
          },
        ).toList();
      },
    );
  }

//5件ずつ取得
  Stream<List<UserData>> watchFiveUsers(int limit) {
    return state
        .where(FirebaseUserKey.userId,
            isNotEqualTo: ref.read(authRepoProvider)!.uid)
        .limit(limit)
        .snapshots()
        .map(
      (QuerySnapshot<UserData> snapshot) {
        return snapshot.docs.map(
          (QueryDocumentSnapshot<UserData> doc) {
            return doc.data();
          },
        ).toList();
      },
    );
  }
}
