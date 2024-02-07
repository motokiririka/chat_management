// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_news_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$draftNewsStreamHash() => r'af10dc43fc586be8382cca69cf95e23a4771ea75';

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

/// See also [draftNewsStream].
@ProviderFor(draftNewsStream)
const draftNewsStreamProvider = DraftNewsStreamFamily();

/// See also [draftNewsStream].
class DraftNewsStreamFamily extends Family<AsyncValue<List<DraftNews>>> {
  /// See also [draftNewsStream].
  const DraftNewsStreamFamily();

  /// See also [draftNewsStream].
  DraftNewsStreamProvider call(
    bool? isSorted,
  ) {
    return DraftNewsStreamProvider(
      isSorted,
    );
  }

  @override
  DraftNewsStreamProvider getProviderOverride(
    covariant DraftNewsStreamProvider provider,
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
  String? get name => r'draftNewsStreamProvider';
}

/// See also [draftNewsStream].
class DraftNewsStreamProvider
    extends AutoDisposeStreamProvider<List<DraftNews>> {
  /// See also [draftNewsStream].
  DraftNewsStreamProvider(
    bool? isSorted,
  ) : this._internal(
          (ref) => draftNewsStream(
            ref as DraftNewsStreamRef,
            isSorted,
          ),
          from: draftNewsStreamProvider,
          name: r'draftNewsStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$draftNewsStreamHash,
          dependencies: DraftNewsStreamFamily._dependencies,
          allTransitiveDependencies:
              DraftNewsStreamFamily._allTransitiveDependencies,
          isSorted: isSorted,
        );

  DraftNewsStreamProvider._internal(
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
    Stream<List<DraftNews>> Function(DraftNewsStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DraftNewsStreamProvider._internal(
        (ref) => create(ref as DraftNewsStreamRef),
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
  AutoDisposeStreamProviderElement<List<DraftNews>> createElement() {
    return _DraftNewsStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DraftNewsStreamProvider && other.isSorted == isSorted;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isSorted.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DraftNewsStreamRef on AutoDisposeStreamProviderRef<List<DraftNews>> {
  /// The parameter `isSorted` of this provider.
  bool? get isSorted;
}

class _DraftNewsStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<DraftNews>>
    with DraftNewsStreamRef {
  _DraftNewsStreamProviderElement(super.provider);

  @override
  bool? get isSorted => (origin as DraftNewsStreamProvider).isSorted;
}

String _$watchDraftNewsHash() => r'32012643ed9ca5d730074be7b7b4959c4b93a25d';

/// See also [watchDraftNews].
@ProviderFor(watchDraftNews)
final watchDraftNewsProvider =
    AutoDisposeStreamProvider<List<DraftNews>>.internal(
  watchDraftNews,
  name: r'watchDraftNewsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchDraftNewsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchDraftNewsRef = AutoDisposeStreamProviderRef<List<DraftNews>>;
String _$draftNewsControllerHash() =>
    r'3baaf8f6e9c879680488647ae09064adf048e7a5';

/// See also [DraftNewsController].
@ProviderFor(DraftNewsController)
final draftNewsControllerProvider =
    AutoDisposeNotifierProvider<DraftNewsController, Object?>.internal(
  DraftNewsController.new,
  name: r'draftNewsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$draftNewsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DraftNewsController = AutoDisposeNotifier<Object?>;
String _$draftNewsLimitControllerHash() =>
    r'd1dcfed4851eb29022adf20fe1020d73ea757e1e';

/// See also [DraftNewsLimitController].
@ProviderFor(DraftNewsLimitController)
final draftNewsLimitControllerProvider =
    AutoDisposeNotifierProvider<DraftNewsLimitController, int>.internal(
  DraftNewsLimitController.new,
  name: r'draftNewsLimitControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$draftNewsLimitControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DraftNewsLimitController = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
