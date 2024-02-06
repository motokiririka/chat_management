import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:management_app_chat/config/utils/enum/router_enum.dart';
import 'package:management_app_chat/features/auth/controller/auth_controller.dart';
import 'package:management_app_chat/features/navigation/side_navi.dart';
import 'package:management_app_chat/routing/app_router.dart';

class SideNavigation extends HookConsumerWidget {
  const SideNavigation({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    useEffect(() {
      final String currentPath = ref.read(goRouterProvider).toString();
      if (currentPath == AppRoute.managementPage.path) {
        selectedIndex.value = 0;
      } else if (currentPath == AppRoute.draftPage.path) {
        selectedIndex.value = 1;
      } else if (currentPath == AppRoute.memberships.path) {
        selectedIndex.value = 2;
      }
      return null;
      //   if (currentPath.startsWith(AppRoute.managementPage.path)) {
      //     selectedIndex.value =
      //   }
      //   return null;
    }, [
      ref.watch(goRouterProvider),
    ]);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "管理画面",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
            onPressed: () {
              ref.read(authControllerProvider.notifier).signOut();
            },
            icon: const Icon(Icons.logout)),
      ),
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: Colors.lightBlue,
            labelType: NavigationRailLabelType.all,
            onDestinationSelected: (int value) {
              ref
                  .read(sideNavigationSelectedIndexProvider.notifier)
                  .change(value);
              switch (value) {
                case 0:
                  context.goNamed(AppRoute.managementPage.name);
                  break;
                case 1:
                  context.goNamed(AppRoute.draftPage.name);
                  break;
                case 2:
                  context.goNamed(AppRoute.memberships.name);

                  break;
              }
            },
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.public), label: Text("お知らせ")),
              NavigationRailDestination(
                  icon: Icon(Icons.edit_note), label: Text("下書き")),
              NavigationRailDestination(
                  icon: Icon(Icons.people), label: Text("会員一覧")),
            ],
            selectedIndex: ref.watch(sideNavigationSelectedIndexProvider),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
