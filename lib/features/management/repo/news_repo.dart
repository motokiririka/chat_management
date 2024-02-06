import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:management_app_chat/config/utils/keys/firebase_key.dart';
import 'package:management_app_chat/features/auth/repo/auth_repo.dart';
import 'package:management_app_chat/features/management/data_model/news.dart';
import 'package:management_app_chat/firebase/firebase_instance_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_repo.g.dart';

@riverpod
class NewsRepo extends _$NewsRepo {
  @override
  CollectionReference<News> build() {
    return ref
        .read(firebaseFireStoreInstanceProvider)
        .collection(FirebaseNewsKey.newsCollection)
        .withConverter<News>(
          fromFirestore: (snapshot, _) => News.fromJson(snapshot.data()!),
          toFirestore: (News value, _) => value.toJson(),
        );
  }

  //readUserIdに自分いるか見る！既読
  Stream<List<News>> watchMyRead() {
    return state
        .where(FirebaseNewsKey.readUserId,
            arrayContains: ref.read(authRepoProvider)!.uid)
        .snapshots()
        .map(
      (QuerySnapshot<News> snapshot) {
        return snapshot.docs.map(
          (QueryDocumentSnapshot<News> doc) {
            return doc.data();
          },
        ).toList();
      },
    );
  }

  //StreamでNewsListを取得
  Stream<List<News>> watchNewsList(bool? isSorted) {
    return state
        .orderBy(FirebaseNewsKey.createdAt, descending: isSorted ?? true)
        .snapshots()
        .map(
      (QuerySnapshot<News> snapshot) {
        return snapshot.docs.map(
          (QueryDocumentSnapshot<News> doc) {
            return doc.data();
          },
        ).toList();
      },
    );
  }

  //FutureでNewsListを取得
  Future<List<News>> getNewsList() async {
    final snapshot = await state.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  //NewsIDからドキュメント取得
  Future<News> getNews(String newsId) async {
    final newsDoc = await state.doc(newsId).get();
    return newsDoc.data()!;
  }

  //Streamでドキュメント取得
  Stream<News> watchNews(String newsId) {
    return state.doc(newsId).snapshots().map(
          (DocumentSnapshot<News> snapshot) => snapshot.data()!,
        );
  }

  //ドキュメント更新
  Future<void> updateNews(News updateNewsData) async {
    await state.doc(updateNewsData.newsId).update(updateNewsData.toJson());
  }

  //ドキュメント削除
  Future<void> deleteNews(String newsId) async {
    await state.doc(newsId).delete();
  }

  //ドキュメント追加
  Future<void> addNews(News addNewsData) async {
    await state.doc(addNewsData.newsId).set(addNewsData);
  }

  Stream<List<News>> watchAllNews(int limit) {
    return state
        .orderBy(FirebaseNewsKey.createdAt, descending: true)
        .limit(limit)
        .snapshots()
        .map(
      (QuerySnapshot<News> snapshot) {
        return snapshot.docs.map(
          (QueryDocumentSnapshot<News> doc) {
            return doc.data();
          },
        ).toList();
      },
    );
  }
}
