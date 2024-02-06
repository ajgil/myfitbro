// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$organizationRepositoryHash() =>
    r'8f582e42f36b8fa1c4ff6277e252d13e240c1a7e';

///
/// Infrastructure dependencies
///
///
/// Copied from [organizationRepository].
@ProviderFor(organizationRepository)
final organizationRepositoryProvider =
    AutoDisposeProvider<OrganizationRepository>.internal(
  organizationRepository,
  name: r'organizationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$organizationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OrganizationRepositoryRef
    = AutoDisposeProviderRef<OrganizationRepository>;
String _$currentOrganizationHash() =>
    r'371b1bd92feca404227a9bb11f170918fcb88946';

///
///
/// Copied from [CurrentOrganization].
@ProviderFor(CurrentOrganization)
final currentOrganizationProvider = AutoDisposeNotifierProvider<
    CurrentOrganization, OrganizationEntity?>.internal(
  CurrentOrganization.new,
  name: r'currentOrganizationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentOrganizationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentOrganization = AutoDisposeNotifier<OrganizationEntity?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
