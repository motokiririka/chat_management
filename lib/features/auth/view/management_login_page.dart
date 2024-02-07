import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:management_app_chat/component/global_function.dart';
import 'package:management_app_chat/component/margin.dart';
import 'package:management_app_chat/config/utils/enum/router_enum.dart';
import 'package:management_app_chat/features/auth/controller/auth_controller.dart';

class ManagementLoginPage extends HookConsumerWidget {
  const ManagementLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController passController = useTextEditingController();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150), // カスタムAppBarの高さを設定
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          flexibleSpace: const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 50, 5, 5),
              child: Text(
                '管理画面',
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 222, 229, 235),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(right: 60, left: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Email'),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'メールアドレスを入力してください';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Password'),
                  ),
                  controller: passController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'パスワードを入力してください';
                    }
                    return null;
                  },
                ),

                Margin.mediumHeightMargin,
                // ignore: prefer_const_constructors
                // 会員登録ボタン

                Margin.smallHeightMargin,
                ElevatedButton(
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    final loginUser = await ref
                        .read(authControllerProvider.notifier)
                        .authorizedUserSignIn(
                            email: emailController.text,
                            password: passController.text);

                    if (loginUser == 'success') {
                      showToast("ログインしました");

                      if (context.mounted) {
                        context.goNamed(AppRoute.managementPage.name);
                      }
                    } else {
                      showToast(loginUser);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(400, 50)),
                  child: const Text(
                    'ログイン',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
