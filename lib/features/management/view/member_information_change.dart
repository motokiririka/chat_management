import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:management_app_chat/component/global_function.dart';
import 'package:management_app_chat/component/margin.dart';
import 'package:management_app_chat/features/user/controller/storage_controller.dart';
import 'package:management_app_chat/features/user/controller/user_controller.dart';
import 'package:management_app_chat/features/user/data_model/userdata.dart';

class MemberInformationChangePage extends HookConsumerWidget {
  MemberInformationChangePage({super.key, required this.userData});

  final UserData userData;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController userNameController = useTextEditingController();
    final TextEditingController profileController = useTextEditingController();
    final TextEditingController imageController = useTextEditingController();
    final selectedIconImage = useState<File?>(null);

    userNameController.text = userData.userName;
    profileController.text = userData.profile;
    imageController.text = userData.imageUrl;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "会員情報編集",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      if (selectedIconImage.value != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            selectedIconImage.value!,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        )
                      else if (imageController.text != '' ||
                          imageController.text.isNotEmpty)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            imageController.text,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        )
                      else
                        const ClipOval(
                          child: Icon(
                            Icons.person_2_outlined,
                            size: 200,
                          ),
                        ),
                      if (userData.imageUrl.isNotEmpty ||
                          selectedIconImage.value != null)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: IconButton(
                              onPressed: () async {
                                final nameOption = await _createNameOption(
                                    userNameController.text);
                                selectedIconImage.value = null;
                                await ref
                                    .read(userControllerProvider.notifier)
                                    .updateUser(
                                      userData,
                                      '',
                                      profileController.text,
                                      userNameController.text,
                                      nameOption,
                                    );
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 50,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Margin.smallHeightMargin,
                  ElevatedButton(
                    onPressed: () async {
                      final XFile? image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        final String imagePath = image.path;
                        final File imageUrl = File(imagePath);
                        selectedIconImage.value = imageUrl;
                      }
                    },
                    child: const Text("画像を選択する"),
                  ),
                  Margin.smallHeightMargin,
                  TextFormField(
                    controller: userNameController,
                    maxLength: 15,
                    validator: (value) {
                      if (value == null || value == '') {
                        return '未入力です';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text("ユーザーネーム"),
                    ),
                  ),
                  Margin.smallHeightMargin,
                  TextFormField(
                    controller: profileController,
                    maxLength: 300,
                    validator: (value) {
                      if (value == null || value == '') {
                        return '未入力です';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text("プロフィール"),
                    ),
                  ),
                  Margin.smallHeightMargin,
                  ElevatedButton(
                    onPressed: () async {
                      final nameOption =
                          await _createNameOption(userNameController.text);
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      try {
                        await ref
                            .read(userControllerProvider.notifier)
                            .updateUser(
                                userData,
                                imageController.text,
                                profileController.text,
                                userNameController.text,
                                nameOption);
                      } catch (e) {
                        showToast("変更できませんでした");
                        return;
                      }
                      if (selectedIconImage.value == null) {
                        showToast("変更しました");
                      } else if (selectedIconImage.value != null) {
                        try {
                          final downloadUrl = await ref
                              .read(storageControllerProvider.notifier)
                              .uploadIconImageAndGetUrl(
                                selectedIconImage.value!,
                              );
                          await ref
                              .read(userControllerProvider.notifier)
                              .updateIconImage(
                                  userData,
                                  downloadUrl,
                                  profileController.text,
                                  userNameController.text,
                                  nameOption);
                        } catch (e) {
                          showToast("アップロード失敗");
                          return;
                        }
                      }
                      showToast("変更しました");
                    },
                    child: const Text("変更する"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<String>> _createNameOption(String value) async {
  String name = value;
  List<int> times = <int>[];

  for (int i = name.length; i >= 1; i--) {
    times.add(i);
  }
  List<String> nameList = <String>[];
  for (int time in times) {
    for (int i = name.length; i >= 0; i--) {
      if (i + time <= name.length) {
        final getName = name.substring(i, i + time);
        nameList.add(getName);
        name = value;
      }
    }
  }
  return nameList;
}
