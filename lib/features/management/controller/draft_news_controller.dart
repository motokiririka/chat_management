import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:management_app_chat/features/management/data_model/draftnews.dart';
import 'package:management_app_chat/features/management/repo/draft_news_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'draft_news_controller.g.dart';

@riverpod
class DraftNewsController extends _$DraftNewsController {
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
  Future<void> updateDraftNews(String newsId, String newsTitle,
      String newsMessage, DraftNews news) async {
    state = const AsyncLoading();
    final DraftNews updateNews = news.copyWith(
        draftNewsId: newsId,
        draftNewsTitle: newsTitle,
        draftNewsMessage: newsMessage,
        updatedAt: Timestamp.now());
    await ref.read(draftNewsRepoProvider.notifier).updateNews(updateNews);

    state = const AsyncData(null);
  }

  //ドキュメント削除
  Future<void> deleteNews(String newsId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(draftNewsRepoProvider.notifier).deleteNews(newsId));
  }

  //ドキュメント追加
  Future<void> addNews(String newsTitle, String newsMessage) async {
    state = const AsyncLoading();
    final newNews = DraftNews(
      draftNewsId: const Uuid().v4(),
      draftNewsTitle: newsTitle,
      draftNewsMessage: newsMessage,
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
    );
    await ref.read(draftNewsRepoProvider.notifier).addNews(newNews);
    state = const AsyncData(null);
  }
}

@riverpod
Stream<List<DraftNews>> draftNewsStream(
    DraftNewsStreamRef ref, bool? isSorted) {
  return ref.read(draftNewsRepoProvider.notifier).watchNewsList(isSorted);
}

@riverpod
Stream<List<DraftNews>> watchDraftNews(WatchDraftNewsRef ref) {
  final int limit = ref.watch(draftNewsLimitControllerProvider);
  return ref.read(draftNewsRepoProvider.notifier).watchAllNews(limit);
}

@riverpod
class DraftNewsLimitController extends _$DraftNewsLimitController {
  @override
  int build() {
    return 15;
  }

  void increment() {
    state = state + 15;
  }
}
