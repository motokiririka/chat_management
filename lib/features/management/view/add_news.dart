import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:management_app_chat/component/global_function.dart';
import 'package:management_app_chat/component/margin.dart';
import 'package:management_app_chat/features/management/controller/draft_news_controller.dart';
import 'package:management_app_chat/features/news/controller/news_controller.dart';
import 'package:management_app_chat/features/management/data_model/draftnews.dart';

class AddNewsPage extends HookConsumerWidget {
  AddNewsPage({super.key, required this.draftNews});
  final formKey = GlobalKey<FormState>();

  final DraftNews draftNews;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController titleController = useTextEditingController();
    final TextEditingController messageController = useTextEditingController();

    titleController.text = draftNews.draftNewsTitle;
    messageController.text = draftNews.draftNewsMessage;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "お知らせ作成",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  maxLength: 20,
                  controller: titleController,
                  decoration: const InputDecoration(labelText: "お知らせのタイトル"),
                  validator: (value) {
                    if (value == null || value == '') {
                      return '未入力です';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLines: 14,
                  maxLength: 500,
                  controller: messageController,
                  decoration: const InputDecoration(labelText: "お知らせの詳細"),
                  validator: (value) {
                    if (value == null || value == '') {
                      return '未入力です';
                    }
                    return null;
                  },
                ),
                Margin.mediumHeightMargin,
                ElevatedButton(
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      if (draftNews.draftNewsTitle.isNotEmpty ||
                          draftNews.draftNewsMessage.isNotEmpty) {
                        ref
                            .read(draftNewsControllerProvider.notifier)
                            .updateDraftNews(
                                draftNews.draftNewsId,
                                titleController.text,
                                messageController.text,
                                draftNews);
                        showToast("変更しました");
                      }
                      ref.read(draftNewsControllerProvider.notifier).addNews(
                          titleController.text, messageController.text);
                      titleController.clear();
                      messageController.clear();
                      showToast("下書きに保存しました");
                    },
                    child: (draftNews.draftNewsTitle.isNotEmpty)
                        ? const Text("下書きを変更する")
                        : const Text("下書きを作成する")),
                Margin.smallHeightMargin,
                ElevatedButton(
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }

                      await ref.read(newsControllerProvider.notifier).addNews(
                          titleController.text, messageController.text);

                      await ref
                          .read(draftNewsControllerProvider.notifier)
                          .deleteNews(draftNews.draftNewsId);
                      if (context.mounted) {
                        context.pop();
                      }
                    },
                    child: const Text("お知らせを公開する")),
              ],
            ),
          ),
        ));
  }
}
