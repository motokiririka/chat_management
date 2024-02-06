import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:management_app_chat/config/utils/keys/firebase_key.dart';
import 'package:management_app_chat/features/auth/repo/auth_repo.dart';
import 'package:management_app_chat/features/management/data_model/news.dart';
import 'package:management_app_chat/features/management/repo/news_repo.dart';
import 'package:management_app_chat/firebase/firebase_instance_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'news_controller.g.dart';

@riverpod
class NewsController extends _$NewsController {
  @override
  build() {
    return null;

    // ok to leave this empty if the return type is FutureOr<void>
  }

  // Future<News> getNews(String newsId) async {
  //   state = const AsyncLoading();
  //   //return await ref.read(NewsRepoProvider.notifier).getNews(NewsId);
  //   state = await AsyncValue.guard(
  //       () => ref.read(newsRepoProvider.notifier).getNews(newsId));
  //   return state.value;
  // }

  //ドキュメント更新
  Future<void> updateNews(
      String newsId, String newsTitle, String newsMessage, News news) async {
    state = const AsyncLoading();
    final News updateNews = news.copyWith(
        newsId: newsId,
        newsTitle: newsTitle,
        newsMessage: newsMessage,
        updatedAt: Timestamp.now());
    await ref.read(newsRepoProvider.notifier).updateNews(updateNews);

    state = const AsyncData(null);
  }

  //既読にする
  Future<void> readNews(News news) async {
    state = const AsyncLoading();
    final News updateNews =
        news.copyWith(readUserId: [ref.read(authRepoProvider)!.uid]);
    await ref.read(newsRepoProvider.notifier).updateNews(updateNews);

    state = const AsyncData(null);
  }

  //ドキュメント削除
  Future<void> deleteNews(String newsId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(newsRepoProvider.notifier).deleteNews(newsId));
  }

  //ドキュメント追加
  Future<void> addNews(String newsTitle, String newsMessage) async {
    state = const AsyncLoading();
    final newNews = News(
      newsId: const Uuid().v4(),
      newsTitle: newsTitle,
      newsMessage: newsMessage,
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
      readUserId: [],
    );
    await ref.read(newsRepoProvider.notifier).addNews(newNews);
    state = const AsyncData(null);
  }
}

// String getMyReadId(List<News> readNews) {
//   String myNewsId = '';
//   for (final News newsData in readNews) {
//     if (newsData.readUserId == ref.read(currentUserControllerProvider)!.uid) {
//       myNewsId = newsData.newsId;
//       break;
//     }
//   }
//   return myNewsId;
// }

@riverpod
Stream<List<News>> newsStream(NewsStreamRef ref, bool? isSorted) {
  return ref.read(newsRepoProvider.notifier).watchNewsList(isSorted);
}

@riverpod
Stream<List<News>> watchNews(WatchNewsRef ref) {
  final int limit = ref.watch(newsLimitControllerProvider);
  return ref.read(newsRepoProvider.notifier).watchAllNews(limit);
}

@riverpod
Stream<List<News>> watchMyRead(WatchMyReadRef ref) {
  return ref.read(newsRepoProvider.notifier).watchMyRead();
}

//自分がreadUserIdにいるか見る！＝既読
@riverpod
Stream<News?> watchMyReadController(
    WatchMyReadControllerRef ref, String newsId) {
  final authUserId = ref.read(authRepoProvider)!.uid;

  return ref
      .read(firebaseFireStoreInstanceProvider)
      .collection(FirebaseNewsKey.newsCollection)
      .doc(newsId)
      .withConverter<News>(
        fromFirestore: (snapshot, _) => News.fromJson(snapshot.data()!),
        toFirestore: (News value, _) => value.toJson(),
      )
      .snapshots()
      .map((DocumentSnapshot<News> snapshot) {
    final News? news = snapshot.data();

    if (news != null && news.readUserId.contains(authUserId)) {
      return news;
    } else {
      return null;
    }
  });
}

@riverpod
class NewsLimitController extends _$NewsLimitController {
  @override
  int build() {
    return 15;
  }

  void increment() {
    state = state + 15;
  }
}
