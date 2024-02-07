import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:management_app_chat/config/utils/enum/router_enum.dart';
import 'package:management_app_chat/features/user/controller/user_controller.dart';
import 'package:management_app_chat/features/user/data_model/userdata.dart';
import 'package:management_app_chat/routing/app_router.dart';

class MembershipPage extends HookConsumerWidget {
  const MembershipPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = useScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        ref.read(allManagementUserLimitControllerProvider.notifier).increment();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("会員一覧"),
        shape: const Border(
          bottom: BorderSide(color: Colors.blue),
        ),
      ),
      body: ref.watch(watchUsersControllerProvider).when(
          skipLoadingOnReload: true,
          data: (List<UserData> listUserData) {
            return ListView.builder(
              controller: scrollController,
              itemBuilder: (context, index) {
                final UserData userData = listUserData[index];
                return Card(
                  child: ListTile(
                    onTap: () {
                      ref.read(goRouterProvider).pushNamed(
                          AppRoute.memberInformationChange.name,
                          extra: userData);
                    },
                    title: (userData.userName != '')
                        ? Text(userData.userName)
                        : const Text("ユーザーネームがありません"),
                    leading: (userData.imageUrl != '')
                        ? ClipOval(
                            child: Image.network(
                              userData.imageUrl,
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const ClipOval(
                            child: Icon(
                              Icons.person_2_outlined,
                              size: 30,
                            ),
                          ),
                  ),
                );
              },
              itemCount: listUserData.length,
            );
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
