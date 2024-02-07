import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:management_app_chat/config/utils/enum/router_enum.dart';
import 'package:management_app_chat/features/auth/repo/auth_repo.dart';
import 'package:management_app_chat/features/draft_news/data_model/draftnews.dart';
import 'package:management_app_chat/features/draft_news/view/add_news.dart';
import 'package:management_app_chat/features/draft_news/view/draft.news.dart';

import 'package:management_app_chat/features/auth/view/management_login_page.dart';
import 'package:management_app_chat/features/news/view/management_page.dart';
import 'package:management_app_chat/features/user/view/member_information_change.dart';
import 'package:management_app_chat/features/user/view/membership_page.dart';
import 'package:management_app_chat/features/navigation/side_navigation.dart';
import 'package:management_app_chat/features/user/data_model/userdata.dart';
import 'package:management_app_chat/routing/go_router_refresh_stream.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoute.managementPage.path,
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {
      if (ref.read(authRepoProvider) == null) {
        return AppRoute.login.path;
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(
      ref.watch(authRepoProvider.notifier).authStateChange(),
    ),
    routes: [
      GoRoute(
        path: AppRoute.login.path,
        name: AppRoute.login.name,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: ManagementLoginPage());
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state, Widget child) {
          return NoTransitionPage(
            key: state.pageKey,
            child: SideNavigation(child: child),
          );
        },
        routes: <RouteBase>[
          GoRoute(
              path: AppRoute.managementPage.path,
              name: AppRoute.managementPage.name,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ManagementPage());
              },
              routes: [
                GoRoute(
                  path: AppRoute.newsAdd.path,
                  name: AppRoute.newsAdd.name,
                  pageBuilder: (context, state) {
                    final DraftNews draftNewsData = state.extra as DraftNews;
                    return NoTransitionPage(
                        child: AddNewsPage(draftNews: draftNewsData));
                  },
                ),
              ]),
          GoRoute(
            path: AppRoute.memberships.path,
            name: AppRoute.memberships.name,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: MembershipPage());
            },
            routes: [
              GoRoute(
                path: AppRoute.memberInformationChange.path,
                name: AppRoute.memberInformationChange.name,
                pageBuilder: (context, state) {
                  final UserData userData = state.extra as UserData;
                  return NoTransitionPage(
                      child: MemberInformationChangePage(
                    userData: userData,
                  ));
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRoute.draftPage.path,
            name: AppRoute.draftPage.name,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: DraftPage());
            },
          ),
        ],
      ),
    ],
  );
}
