import 'package:myfitbro/config/providers.dart';
import 'package:myfitbro/features/auth/data/datasources/local/authentication_local_data_source.dart';
import 'package:myfitbro/features/auth/data/repositories/authentication_repository_impl.dart';
import 'package:flutter/foundation.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

///
/// Infrastructure dependencies
///
@riverpod
AuthenticationRepositoryImplementation authRepository(AuthRepositoryRef ref) {

  final authClient = ref.watch(supabaseClientProvider).auth;
  final prefs = ref.read(sharedPreferencesProvider).valueOrNull;
  if (prefs == null) {
    throw 'Shared preferences not initialized';
  }
  return AuthenticationRepositoryImplementation(
    AuthenticationTokenLocalDataSource(
      prefs,
    ),
    authClient,
  );
  
}

///
/// Application dependencies
///

/// Provides a [ValueNotifier] to the app router to redirect on auth state change
final authStateListenable = ValueNotifier<bool>(false);
