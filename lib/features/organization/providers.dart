import 'package:myfitbro/config/providers.dart';
import 'package:myfitbro/features/auth/auth_provider.dart';
import 'package:myfitbro/features/common/domain/failures/failure.dart';
import 'package:myfitbro/features/organization/domain/entities/organization_entity.dart';
import 'package:myfitbro/features/organization/infrastructure/repositories/organization_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

///
/// Infrastructure dependencies
///

@riverpod
OrganizationRepository organizationRepository(OrganizationRepositoryRef ref) {
  final user = ref.watch(authRepositoryProvider.select((v) => v.currentUser));
  if (user == null) throw const Failure.unauthorized();
  return OrganizationRepository(
    client: ref.watch(supabaseClientProvider),
    user: user,
  );
}

///
@riverpod
class CurrentOrganization extends _$CurrentOrganization {
  @override
  OrganizationEntity? build() {
    return null;
  }

  ///
  OrganizationEntity? get org => state;

  ///
  set org(OrganizationEntity? entity) {
    state = entity;
  }
}
