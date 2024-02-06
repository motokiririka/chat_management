import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:management_app_chat/component/margin.dart';
import 'package:management_app_chat/config/utils/enum/router_enum.dart';
import 'package:management_app_chat/features/management/controller/draft_news_controller.dart';
import 'package:management_app_chat/features/management/data_model/draftnews.dart';
import 'package:management_app_chat/routing/app_router.dart';

class DraftPage extends HookConsumerWidget {
  const DraftPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = useScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        ref.read(draftNewsLimitControllerProvider.notifier).increment();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("下書き"),
        shape: const Border(
            bottom: BorderSide(
          color: Colors.blue,
        )),
      ),
      body: ref.watch(watchDraftNewsProvider).when(
          skipLoadingOnReload: true,
          data: (List<DraftNews> listNews) {
            return ListView.builder(
                controller: scrollController,
                itemCount: listNews.length,
                itemBuilder: (context, index) {
                  final DraftNews news = listNews[index];
                  return ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                insetPadding: EdgeInsets.zero,
                                content: SizedBox(
                                  width: 500,
                                  height: 500,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        news.draftNewsTitle,
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Margin.smallHeightMargin,
                                      Text(news.draftNewsMessage),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      title: Text(news.draftNewsTitle),
                      subtitle: Text(
                        news.draftNewsMessage,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          if (listNews.isNotEmpty) {
                            ref
                                .read(goRouterProvider)
                                .pushNamed(AppRoute.newsAdd.name, extra: news);
                          }
                        },
                        child: const Text("編集する"),
                      ));
                });
          },
          error: (error, stackTrace) {
            return const Text("エラーです");
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(goRouterProvider).pushNamed(AppRoute.newsAdd.name,
              extra: DraftNews(
                  draftNewsId: "",
                  draftNewsTitle: "",
                  draftNewsMessage: "",
                  createdAt: Timestamp.now(),
                  updatedAt: Timestamp.now()));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
