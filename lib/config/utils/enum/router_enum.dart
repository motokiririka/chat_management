enum AppRoute {
  login,

  managementLoginPage,
  managementPage,
  memberships,
  memberInformationChange,
  newsAdd,
  draftPage,
  notification,
}

extension AppRouteExtension on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.login:
        return "/login";
      case AppRoute.managementPage:
        return "/managementPage";
      case AppRoute.memberships:
        return "/memberships";
      case AppRoute.draftPage:
        return "/draftPage";
      case AppRoute.memberInformationChange:
        return "memberInformationChange";
      case AppRoute.newsAdd:
        return "newsAdd";
      case AppRoute.notification:
        return "/notification";

      default:
        return "/managementPage";
    }
  }
}
