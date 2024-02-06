// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_view_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$organizationViewControllerHash() =>
    r'91d71f5658dd322934ee4e374f7a401c736a605b';

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

abstract class _$OrganizationViewController
    extends BuildlessAutoDisposeAsyncNotifier<OrganizationEntity> {
  late final String id;

  FutureOr<OrganizationEntity> build(
    String id,
  );
}

///
///
/// Copied from [OrganizationViewController].
@ProviderFor(OrganizationViewController)
const organizationViewControllerProvider = OrganizationViewControllerFamily();

///
///
/// Copied from [OrganizationViewController].
class OrganizationViewControllerFamily
    extends Family<AsyncValue<OrganizationEntity>> {
  ///
  ///
  /// Copied from [OrganizationViewController].
  const OrganizationViewControllerFamily();

  ///
  ///
  /// Copied from [OrganizationViewController].
  OrganizationViewControllerProvider call(
    String id,
  ) {
    return OrganizationViewControllerProvider(
      id,
    );
  }

  @override
  OrganizationViewControllerProvider getProviderOverride(
    covariant OrganizationViewControllerProvider provider,
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
  String? get name => r'organizationViewControllerProvider';
}

///
///
/// Copied from [OrganizationViewController].
class OrganizationViewControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<OrganizationViewController,
        OrganizationEntity> {
  ///
  ///
  /// Copied from [OrganizationViewController].
  OrganizationViewControllerProvider(
    String id,
  ) : this._internal(
          () => OrganizationViewController()..id = id,
          from: organizationViewControllerProvider,
          name: r'organizationViewControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$organizationViewControllerHash,
          dependencies: OrganizationViewControllerFamily._dependencies,
          allTransitiveDependencies:
              OrganizationViewControllerFamily._allTransitiveDependencies,
          id: id,
        );

  OrganizationViewControllerProvider._internal(
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
  FutureOr<OrganizationEntity> runNotifierBuild(
    covariant OrganizationViewController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(OrganizationViewController Function() create) {
    return ProviderOverride(
      origin: this,
      override: OrganizationViewControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<OrganizationViewController,
      OrganizationEntity> createElement() {
    return _OrganizationViewControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrganizationViewControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OrganizationViewControllerRef
    on AutoDisposeAsyncNotifierProviderRef<OrganizationEntity> {
  /// The parameter `id` of this provider.
  String get id;
}

class _OrganizationViewControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<OrganizationViewController,
        OrganizationEntity> with OrganizationViewControllerRef {
  _OrganizationViewControllerProviderElement(super.provider);

  @override
  String get id => (origin as OrganizationViewControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
