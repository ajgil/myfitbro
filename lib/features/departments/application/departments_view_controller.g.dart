// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departments_view_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$departmentsViewControllerHash() =>
    r'274eba0735dade47ef896cfe2246dd4bdf5f2efa';

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

abstract class _$DepartmentsViewController
    extends BuildlessAutoDisposeAsyncNotifier<DepartmentEntity> {
  late final String id;

  FutureOr<DepartmentEntity> build(
    String id,
  );
}

///
///
/// Copied from [DepartmentsViewController].
@ProviderFor(DepartmentsViewController)
const departmentsViewControllerProvider = DepartmentsViewControllerFamily();

///
///
/// Copied from [DepartmentsViewController].
class DepartmentsViewControllerFamily
    extends Family<AsyncValue<DepartmentEntity>> {
  ///
  ///
  /// Copied from [DepartmentsViewController].
  const DepartmentsViewControllerFamily();

  ///
  ///
  /// Copied from [DepartmentsViewController].
  DepartmentsViewControllerProvider call(
    String id,
  ) {
    return DepartmentsViewControllerProvider(
      id,
    );
  }

  @override
  DepartmentsViewControllerProvider getProviderOverride(
    covariant DepartmentsViewControllerProvider provider,
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
  String? get name => r'departmentsViewControllerProvider';
}

///
///
/// Copied from [DepartmentsViewController].
class DepartmentsViewControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<DepartmentsViewController,
        DepartmentEntity> {
  ///
  ///
  /// Copied from [DepartmentsViewController].
  DepartmentsViewControllerProvider(
    String id,
  ) : this._internal(
          () => DepartmentsViewController()..id = id,
          from: departmentsViewControllerProvider,
          name: r'departmentsViewControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$departmentsViewControllerHash,
          dependencies: DepartmentsViewControllerFamily._dependencies,
          allTransitiveDependencies:
              DepartmentsViewControllerFamily._allTransitiveDependencies,
          id: id,
        );

  DepartmentsViewControllerProvider._internal(
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
  FutureOr<DepartmentEntity> runNotifierBuild(
    covariant DepartmentsViewController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(DepartmentsViewController Function() create) {
    return ProviderOverride(
      origin: this,
      override: DepartmentsViewControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<DepartmentsViewController,
      DepartmentEntity> createElement() {
    return _DepartmentsViewControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DepartmentsViewControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DepartmentsViewControllerRef
    on AutoDisposeAsyncNotifierProviderRef<DepartmentEntity> {
  /// The parameter `id` of this provider.
  String get id;
}

class _DepartmentsViewControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DepartmentsViewController,
        DepartmentEntity> with DepartmentsViewControllerRef {
  _DepartmentsViewControllerProviderElement(super.provider);

  @override
  String get id => (origin as DepartmentsViewControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
