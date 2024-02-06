import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'side_navi.g.dart';

@riverpod
class SideNavigationSelectedIndex extends _$SideNavigationSelectedIndex {
  @override
  int build() {
    return 0;
  }

  void change(int index) {
    state = index;
  }
}
