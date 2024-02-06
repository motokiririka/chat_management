// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsStreamHash() => r'e75d2f452dc279cb1f64ac88e209f42baff21bc0';

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

/// See also [newsStream].
@ProviderFor(newsStream)
const newsStreamProvider = NewsStreamFamily();

/// See also [newsStream].
class NewsStreamFamily extends Family<AsyncValue<List<News>>> {
  /// See also [newsStream].
  const NewsStreamFamily();

  /// See also [newsStream].
  NewsStreamProvider call(
    bool? isSorted,
  ) {
    return NewsStreamProvider(
      isSorted,
    );
  }

  @override
  NewsStreamProvider getProviderOverride(
    covariant NewsStreamProvider provider,
  ) {
    return call(
      provider.isSorted,
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
  String? get name => r'newsStreamProvider';
}

/// See also [newsStream].
class NewsStreamProvider extends AutoDisposeStreamProvider<List<News>> {
  /// See also [newsStream].
  NewsStreamProvider(
    bool? isSorted,
  ) : this._internal(
          (ref) => newsStream(
            ref as NewsStreamRef,
            isSorted,
          ),
          from: newsStreamProvider,
          name: r'newsStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newsStreamHash,
          dependencies: NewsStreamFamily._dependencies,
          allTransitiveDependencies:
              NewsStreamFamily._allTransitiveDependencies,
          isSorted: isSorted,
        );

  NewsStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.isSorted,
  }) : super.internal();

  final bool? isSorted;

  @override
  Override overrideWith(
    Stream<List<News>> Function(NewsStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NewsStreamProvider._internal(
        (ref) => create(ref as NewsStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        isSorted: isSorted,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<News>> createElement() {
    return _NewsStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsStreamProvider && other.isSorted == isSorted;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isSorted.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NewsStreamRef on AutoDisposeStreamProviderRef<List<News>> {
  /// The parameter `isSorted` of this provider.
  bool? get isSorted;
}

class _NewsStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<News>> with NewsStreamRef {
  _NewsStreamProviderElement(super.provider);

  @override
  bool? get isSorted => (origin as NewsStreamProvider).isSorted;
}

String _$watchNewsHash() => r'702d86e13828dddccef8c8ca76d68a771dc5131f';

/// See also [watchNews].
@ProviderFor(watchNews)
final watchNewsProvider = AutoDisposeStreamProvider<List<News>>.internal(
  watchNews,
  name: r'watchNewsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$watchNewsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchNewsRef = AutoDisposeStreamProviderRef<List<News>>;
String _$watchMyReadHash() => r'e1c324e1349d299d70dc78e73d75188742be7b6c';

/// See also [watchMyRead].
@ProviderFor(watchMyRead)
final watchMyReadProvider = AutoDisposeStreamProvider<List<News>>.internal(
  watchMyRead,
  name: r'watchMyReadProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$watchMyReadHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchMyReadRef = AutoDisposeStreamProviderRef<List<News>>;
String _$watchMyReadControllerHash() =>
    r'c6e4d7cf25fc55417fc211e44fbe3c1c5732ccf6';

/// See also [watchMyReadController].
@ProviderFor(watchMyReadController)
const watchMyReadControllerProvider = WatchMyReadControllerFamily();

/// See also [watchMyReadController].
class WatchMyReadControllerFamily extends Family<AsyncValue<News?>> {
  /// See also [watchMyReadController].
  const WatchMyReadControllerFamily();

  /// See also [watchMyReadController].
  WatchMyReadControllerProvider call(
    String newsId,
  ) {
    return WatchMyReadControllerProvider(
      newsId,
    );
  }

  @override
  WatchMyReadControllerProvider getProviderOverride(
    covariant WatchMyReadControllerProvider provider,
  ) {
    return call(
      provider.newsId,
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
  String? get name => r'watchMyReadControllerProvider';
}

/// See also [watchMyReadController].
class WatchMyReadControllerProvider extends AutoDisposeStreamProvider<News?> {
  /// See also [watchMyReadController].
  WatchMyReadControllerProvider(
    String newsId,
  ) : this._internal(
          (ref) => watchMyReadController(
            ref as WatchMyReadControllerRef,
            newsId,
          ),
          from: watchMyReadControllerProvider,
          name: r'watchMyReadControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchMyReadControllerHash,
          dependencies: WatchMyReadControllerFamily._dependencies,
          allTransitiveDependencies:
              WatchMyReadControllerFamily._allTransitiveDependencies,
          newsId: newsId,
        );

  WatchMyReadControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.newsId,
  }) : super.internal();

  final String newsId;

  @override
  Override overrideWith(
    Stream<News?> Function(WatchMyReadControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchMyReadControllerProvider._internal(
        (ref) => create(ref as WatchMyReadControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        newsId: newsId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<News?> createElement() {
    return _WatchMyReadControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchMyReadControllerProvider && other.newsId == newsId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, newsId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WatchMyReadControllerRef on AutoDisposeStreamProviderRef<News?> {
  /// The parameter `newsId` of this provider.
  String get newsId;
}

class _WatchMyReadControllerProviderElement
    extends AutoDisposeStreamProviderElement<News?>
    with WatchMyReadControllerRef {
  _WatchMyReadControllerProviderElement(super.provider);

  @override
  String get newsId => (origin as WatchMyReadControllerProvider).newsId;
}

String _$newsControllerHash() => r'3456511253f5fddb6ff34ddcc0c2b6ea2d73fb0d';

/// See also [NewsController].
@ProviderFor(NewsController)
final newsControllerProvider =
    AutoDisposeNotifierProvider<NewsController, Object?>.internal(
  NewsController.new,
  name: r'newsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewsController = AutoDisposeNotifier<Object?>;
String _$newsLimitControllerHash() =>
    r'e743e1f7d759f1e7ad9d835927d17ddeda2f483a';

/// See also [NewsLimitController].
@ProviderFor(NewsLimitController)
final newsLimitControllerProvider =
    AutoDisposeNotifierProvider<NewsLimitController, int>.internal(
  NewsLimitController.new,
  name: r'newsLimitControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newsLimitControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewsLimitController = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
