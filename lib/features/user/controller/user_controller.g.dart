// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchUsersControllerHash() =>
    r'142ce91097107847bf8152d9b74e04073a6177ef';

/// See also [watchUsersController].
@ProviderFor(watchUsersController)
final watchUsersControllerProvider =
    AutoDisposeStreamProvider<List<UserData>>.internal(
  watchUsersController,
  name: r'watchUsersControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchUsersControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchUsersControllerRef = AutoDisposeStreamProviderRef<List<UserData>>;
String _$searchUserNameHash() => r'de2ed4cffe05c312e50248e1d6989f0797178cfe';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [searchUserName].
@ProviderFor(searchUserName)
const searchUserNameProvider = SearchUserNameFamily();

/// See also [searchUserName].
class SearchUserNameFamily extends Family<AsyncValue<List<UserData>>> {
  /// See also [searchUserName].
  const SearchUserNameFamily();

  /// See also [searchUserName].
  SearchUserNameProvider call(
    String queryString,
  ) {
    return SearchUserNameProvider(
      queryString,
    );
  }

  @override
  SearchUserNameProvider getProviderOverride(
    covariant SearchUserNameProvider provider,
  ) {
    return call(
      provider.queryString,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchUserNameProvider';
}

/// See also [searchUserName].
class SearchUserNameProvider extends AutoDisposeStreamProvider<List<UserData>> {
  /// See also [searchUserName].
  SearchUserNameProvider(
    String queryString,
  ) : this._internal(
          (ref) => searchUserName(
            ref as SearchUserNameRef,
            queryString,
          ),
          from: searchUserNameProvider,
          name: r'searchUserNameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchUserNameHash,
          dependencies: SearchUserNameFamily._dependencies,
          allTransitiveDependencies:
              SearchUserNameFamily._allTransitiveDependencies,
          queryString: queryString,
        );

  SearchUserNameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.queryString,
  }) : super.internal();

  final String queryString;

  @override
  Override overrideWith(
    Stream<List<UserData>> Function(SearchUserNameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchUserNameProvider._internal(
        (ref) => create(ref as SearchUserNameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        queryString: queryString,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<UserData>> createElement() {
    return _SearchUserNameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchUserNameProvider && other.queryString == queryString;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, queryString.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchUserNameRef on AutoDisposeStreamProviderRef<List<UserData>> {
  /// The parameter `queryString` of this provider.
  String get queryString;
}

class _SearchUserNameProviderElement
    extends AutoDisposeStreamProviderElement<List<UserData>>
    with SearchUserNameRef {
  _SearchUserNameProviderElement(super.provider);

  @override
  String get queryString => (origin as SearchUserNameProvider).queryString;
}

String _$searchFiveUserControllerHash() =>
    r'ada074b2c3b3078e4a7121b11092de9cecca5d97';

/// See also [searchFiveUserController].
@ProviderFor(searchFiveUserController)
const searchFiveUserControllerProvider = SearchFiveUserControllerFamily();

/// See also [searchFiveUserController].
class SearchFiveUserControllerFamily
    extends Family<AsyncValue<List<UserData>>> {
  /// See also [searchFiveUserController].
  const SearchFiveUserControllerFamily();

  /// See also [searchFiveUserController].
  SearchFiveUserControllerProvider call(
    String queryString,
  ) {
    return SearchFiveUserControllerProvider(
      queryString,
    );
  }

  @override
  SearchFiveUserControllerProvider getProviderOverride(
    covariant SearchFiveUserControllerProvider provider,
  ) {
    return call(
      provider.queryString,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchFiveUserControllerProvider';
}

/// See also [searchFiveUserController].
class SearchFiveUserControllerProvider
    extends AutoDisposeStreamProvider<List<UserData>> {
  /// See also [searchFiveUserController].
  SearchFiveUserControllerProvider(
    String queryString,
  ) : this._internal(
          (ref) => searchFiveUserController(
            ref as SearchFiveUserControllerRef,
            queryString,
          ),
          from: searchFiveUserControllerProvider,
          name: r'searchFiveUserControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchFiveUserControllerHash,
          dependencies: SearchFiveUserControllerFamily._dependencies,
          allTransitiveDependencies:
              SearchFiveUserControllerFamily._allTransitiveDependencies,
          queryString: queryString,
        );

  SearchFiveUserControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.queryString,
  }) : super.internal();

  final String queryString;

  @override
  Override overrideWith(
    Stream<List<UserData>> Function(SearchFiveUserControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchFiveUserControllerProvider._internal(
        (ref) => create(ref as SearchFiveUserControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        queryString: queryString,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<UserData>> createElement() {
    return _SearchFiveUserControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchFiveUserControllerProvider &&
        other.queryString == queryString;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, queryString.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchFiveUserControllerRef
    on AutoDisposeStreamProviderRef<List<UserData>> {
  /// The parameter `queryString` of this provider.
  String get queryString;
}

class _SearchFiveUserControllerProviderElement
    extends AutoDisposeStreamProviderElement<List<UserData>>
    with SearchFiveUserControllerRef {
  _SearchFiveUserControllerProviderElement(super.provider);

  @override
  String get queryString =>
      (origin as SearchFiveUserControllerProvider).queryString;
}

String _$watchAccountControllerHash() =>
    r'5caf277783cd1ee13cd8fec95655744c099a7ee3';

/// See also [watchAccountController].
@ProviderFor(watchAccountController)
const watchAccountControllerProvider = WatchAccountControllerFamily();

/// See also [watchAccountController].
class WatchAccountControllerFamily extends Family<AsyncValue<UserData?>> {
  /// See also [watchAccountController].
  const WatchAccountControllerFamily();

  /// See also [watchAccountController].
  WatchAccountControllerProvider call(
    String userId,
  ) {
    return WatchAccountControllerProvider(
      userId,
    );
  }

  @override
  WatchAccountControllerProvider getProviderOverride(
    covariant WatchAccountControllerProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchAccountControllerProvider';
}

/// See also [watchAccountController].
class WatchAccountControllerProvider
    extends AutoDisposeStreamProvider<UserData?> {
  /// See also [watchAccountController].
  WatchAccountControllerProvider(
    String userId,
  ) : this._internal(
          (ref) => watchAccountController(
            ref as WatchAccountControllerRef,
            userId,
          ),
          from: watchAccountControllerProvider,
          name: r'watchAccountControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchAccountControllerHash,
          dependencies: WatchAccountControllerFamily._dependencies,
          allTransitiveDependencies:
              WatchAccountControllerFamily._allTransitiveDependencies,
          userId: userId,
        );

  WatchAccountControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    Stream<UserData?> Function(WatchAccountControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchAccountControllerProvider._internal(
        (ref) => create(ref as WatchAccountControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<UserData?> createElement() {
    return _WatchAccountControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchAccountControllerProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WatchAccountControllerRef on AutoDisposeStreamProviderRef<UserData?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _WatchAccountControllerProviderElement
    extends AutoDisposeStreamProviderElement<UserData?>
    with WatchAccountControllerRef {
  _WatchAccountControllerProviderElement(super.provider);

  @override
  String get userId => (origin as WatchAccountControllerProvider).userId;
}

String _$watchMyAccountControllerHash() =>
    r'5de93e0413a848c8f0f29841f19947c608427f4b';

/// See also [watchMyAccountController].
@ProviderFor(watchMyAccountController)
final watchMyAccountControllerProvider =
    AutoDisposeStreamProvider<UserData?>.internal(
  watchMyAccountController,
  name: r'watchMyAccountControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchMyAccountControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchMyAccountControllerRef = AutoDisposeStreamProviderRef<UserData?>;
String _$userControllerHash() => r'71e070b3e3be8156b50c75497e4eac83e80802b0';

/// See also [UserController].
@ProviderFor(UserController)
final userControllerProvider =
    AutoDisposeNotifierProvider<UserController, AsyncValue>.internal(
  UserController.new,
  name: r'userControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserController = AutoDisposeNotifier<AsyncValue>;
String _$userLimitControllerHash() =>
    r'933470476ba2c1a530913dd2dda88ee1b2f8c771';

/// See also [UserLimitController].
@ProviderFor(UserLimitController)
final userLimitControllerProvider =
    AutoDisposeNotifierProvider<UserLimitController, int>.internal(
  UserLimitController.new,
  name: r'userLimitControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userLimitControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserLimitController = AutoDisposeNotifier<int>;
String _$allUserLimitControllerHash() =>
    r'2c8168d6e8e90658128e5167afa5fd461e6c8fba';

/// See also [AllUserLimitController].
@ProviderFor(AllUserLimitController)
final allUserLimitControllerProvider =
    AutoDisposeNotifierProvider<AllUserLimitController, int>.internal(
  AllUserLimitController.new,
  name: r'allUserLimitControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allUserLimitControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AllUserLimitController = AutoDisposeNotifier<int>;
String _$allManagementUserLimitControllerHash() =>
    r'681c7cccfb48977acb5442547f90fb324ee1eca6';

/// See also [AllManagementUserLimitController].
@ProviderFor(AllManagementUserLimitController)
final allManagementUserLimitControllerProvider =
    AutoDisposeNotifierProvider<AllManagementUserLimitController, int>.internal(
  AllManagementUserLimitController.new,
  name: r'allManagementUserLimitControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allManagementUserLimitControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

// ignore: unused_element
typedef _$AllManagementUserLimitController = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
