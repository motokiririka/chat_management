import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:management_app_chat/component/global_function.dart';
import 'package:management_app_chat/component/margin.dart';
import 'package:management_app_chat/features/news/controller/news_controller.dart';
import 'package:management_app_chat/features/news/data_model/news.dart';
import 'package:intl/intl.dart';

class ManagementPage extends HookConsumerWidget {
  const ManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = useScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        ref.read(newsLimitControllerProvider.notifier).increment();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("お知らせ"),
        shape: const Border(
            bottom: BorderSide(
          color: Colors.blue,
        )),
      ),
      body: ref.watch(watchNewsProvider).when(
          skipLoadingOnReload: true,
          data: (List<News> listNews) {
            return ListView.builder(
                controller: scrollController,
                itemCount: listNews.length,
                itemBuilder: (context, index) {
                  final News news = listNews[index];
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
                                      news.newsTitle,
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Margin.smallHeightMargin,
                                    Text(news.newsMessage),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    title: Text(news.newsTitle),
                    subtitle: Text(
                      news.newsMessage,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Column(
                      children: [
                        Text(DateFormat('yyyy年MM月dd日')
                            .format(news.createdAt.toDate())),
                        ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(newsControllerProvider.notifier)
                                  .deleteNews(news.newsId);
                              showToast("削除しました");
                            },
                            child: const Text("削除")),
                      ],
                    ),
                  );
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
    );
  }
}
