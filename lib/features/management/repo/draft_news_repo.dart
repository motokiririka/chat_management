import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:management_app_chat/config/utils/keys/firebase_key.dart';
import 'package:management_app_chat/features/management/data_model/draftnews.dart';
import 'package:management_app_chat/firebase/firebase_instance_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'draft_news_repo.g.dart';

@riverpod
class DraftNewsRepo extends _$DraftNewsRepo {
  @override
  CollectionReference<DraftNews> build() {
    return ref
        .read(firebaseFireStoreInstanceProvider)
        .collection(FirebaseDraftNewsKey.draftNewsCollection)
        .withConverter<DraftNews>(
          fromFirestore: (snapshot, _) => DraftNews.fromJson(snapshot.data()!),
          toFirestore: (DraftNews value, _) => value.toJson(),
        );
  }

  //StreamでNewsListを取得
  Stream<List<DraftNews>> watchNewsList(bool? isSorted) {
    return state
        .orderBy(FirebaseNewsKey.createdAt, descending: isSorted ?? true)
        .snapshots()
        .map(
      (QuerySnapshot<DraftNews> snapshot) {
        return snapshot.docs.map(
          (QueryDocumentSnapshot<DraftNews> doc) {
            return doc.data();
          },
        ).toList();
      },
    );
  }

  //FutureでNewsListを取得
  Future<List<DraftNews>> getNewsList() async {
    final snapshot = await state.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  //NewsIDからドキュメント取得
  Future<DraftNews> getNews(String newsId) async {
    final newsDoc = await state.doc(newsId).get();
    return newsDoc.data()!;
  }

  //Streamでドキュメント取得
  Stream<DraftNews> watchNews(String newsId) {
    return state.doc(newsId).snapshots().map(
          (DocumentSnapshot<DraftNews> snapshot) => snapshot.data()!,
        );
  }

  //ドキュメント更新
  Future<void> updateNews(DraftNews updateNewsData) async {
    await state.doc(updateNewsData.draftNewsId).update(updateNewsData.toJson());
  }

  //ドキュメント削除
  Future<void> deleteNews(String newsId) async {
    await state.doc(newsId).delete();
  }

  //ドキュメント追加
  Future<void> addNews(DraftNews addNewsData) async {
    await state.doc(addNewsData.draftNewsId).set(addNewsData);
  }

  Stream<List<DraftNews>> watchAllNews(int limit) {
    return state
        .orderBy(FirebaseNewsKey.createdAt, descending: true)
        .limit(limit)
        .snapshots()
        .map(
      (QuerySnapshot<DraftNews> snapshot) {
        return snapshot.docs.map(
          (QueryDocumentSnapshot<DraftNews> doc) {
            return doc.data();
          },
        ).toList();
      },
    );
  }
}
