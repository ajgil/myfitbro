// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departments_delete_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$departmentsDeleteControllerHash() =>
    r'a62d7e976ceec4338a7fcb2a9b8c67583e452ecc';

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

abstract class _$DepartmentsDeleteController
    extends BuildlessAutoDisposeAsyncNotifier<bool> {
  late final String id;

  FutureOr<bool> build(
    String id,
  );
}

///
///
/// Copied from [DepartmentsDeleteController].
@ProviderFor(DepartmentsDeleteController)
const departmentsDeleteControllerProvider = DepartmentsDeleteControllerFamily();

///
///
/// Copied from [DepartmentsDeleteController].
class DepartmentsDeleteControllerFamily extends Family<AsyncValue<bool>> {
  ///
  ///
  /// Copied from [DepartmentsDeleteController].
  const DepartmentsDeleteControllerFamily();

  ///
  ///
  /// Copied from [DepartmentsDeleteController].
  DepartmentsDeleteControllerProvider call(
    String id,
  ) {
    return DepartmentsDeleteControllerProvider(
      id,
    );
  }

  @override
  DepartmentsDeleteControllerProvider getProviderOverride(
    covariant DepartmentsDeleteControllerProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'departmentsDeleteControllerProvider';
}

///
///
/// Copied from [DepartmentsDeleteController].
class DepartmentsDeleteControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<DepartmentsDeleteController,
        bool> {
  ///
  ///
  /// Copied from [DepartmentsDeleteController].
  DepartmentsDeleteControllerProvider(
    String id,
  ) : this._internal(
          () => DepartmentsDeleteController()..id = id,
          from: departmentsDeleteControllerProvider,
          name: r'departmentsDeleteControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$departmentsDeleteControllerHash,
          dependencies: DepartmentsDeleteControllerFamily._dependencies,
          allTransitiveDependencies:
              DepartmentsDeleteControllerFamily._allTransitiveDependencies,
          id: id,
        );

  DepartmentsDeleteControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<bool> runNotifierBuild(
    covariant DepartmentsDeleteController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(DepartmentsDeleteController Function() create) {
    return ProviderOverride(
      origin: this,
      override: DepartmentsDeleteControllerProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DepartmentsDeleteController, bool>
      createElement() {
    return _DepartmentsDeleteControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DepartmentsDeleteControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DepartmentsDeleteControllerRef
    on AutoDisposeAsyncNotifierProviderRef<bool> {
  /// The parameter `id` of this provider.
  String get id;
}

class _DepartmentsDeleteControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DepartmentsDeleteController,
        bool> with DepartmentsDeleteControllerRef {
  _DepartmentsDeleteControllerProviderElement(super.provider);

  @override
  String get id => (origin as DepartmentsDeleteControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
