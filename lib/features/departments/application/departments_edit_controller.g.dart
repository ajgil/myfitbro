// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departments_edit_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$departmentsEditControllerHash() =>
    r'e3264a191ab416db786b33e42fb9503976965da5';

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

abstract class _$DepartmentsEditController
    extends BuildlessAutoDisposeAsyncNotifier<DepartmentEntity> {
  late final String id;

  FutureOr<DepartmentEntity> build(
    String id,
  );
}

///
///
/// Copied from [DepartmentsEditController].
@ProviderFor(DepartmentsEditController)
const departmentsEditControllerProvider = DepartmentsEditControllerFamily();

///
///
/// Copied from [DepartmentsEditController].
class DepartmentsEditControllerFamily
    extends Family<AsyncValue<DepartmentEntity>> {
  ///
  ///
  /// Copied from [DepartmentsEditController].
  const DepartmentsEditControllerFamily();

  ///
  ///
  /// Copied from [DepartmentsEditController].
  DepartmentsEditControllerProvider call(
    String id,
  ) {
    return DepartmentsEditControllerProvider(
      id,
    );
  }

  @override
  DepartmentsEditControllerProvider getProviderOverride(
    covariant DepartmentsEditControllerProvider provider,
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
  String? get name => r'departmentsEditControllerProvider';
}

///
///
/// Copied from [DepartmentsEditController].
class DepartmentsEditControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<DepartmentsEditController,
        DepartmentEntity> {
  ///
  ///
  /// Copied from [DepartmentsEditController].
  DepartmentsEditControllerProvider(
    String id,
  ) : this._internal(
          () => DepartmentsEditController()..id = id,
          from: departmentsEditControllerProvider,
          name: r'departmentsEditControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$departmentsEditControllerHash,
          dependencies: DepartmentsEditControllerFamily._dependencies,
          allTransitiveDependencies:
              DepartmentsEditControllerFamily._allTransitiveDependencies,
          id: id,
        );

  DepartmentsEditControllerProvider._internal(
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
    covariant DepartmentsEditController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(DepartmentsEditController Function() create) {
    return ProviderOverride(
      origin: this,
      override: DepartmentsEditControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<DepartmentsEditController,
      DepartmentEntity> createElement() {
    return _DepartmentsEditControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DepartmentsEditControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DepartmentsEditControllerRef
    on AutoDisposeAsyncNotifierProviderRef<DepartmentEntity> {
  /// The parameter `id` of this provider.
  String get id;
}

class _DepartmentsEditControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DepartmentsEditController,
        DepartmentEntity> with DepartmentsEditControllerRef {
  _DepartmentsEditControllerProviderElement(super.provider);

  @override
  String get id => (origin as DepartmentsEditControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
