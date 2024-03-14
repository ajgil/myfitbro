import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:myfitbro/features/auth/data/datasources/remote/auth_remote_repository.dart';

part 'auth_provider.g.dart';

///
/// Infrastructure dependencies
///
@riverpod
Stream<User?> authUser(AuthUserRef ref) async* {
  final authStream = ref.read(authRemoteRepositoryProvider).authState;

  await for (final authState in authStream) {
    yield authState.session?.user;
  }
}
