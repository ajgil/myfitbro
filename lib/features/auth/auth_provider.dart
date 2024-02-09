import 'package:gotrue/src/gotrue_client.dart';
import 'package:myfitbro/config/providers.dart';
import 'package:myfitbro/features/auth/infrastructure/datasources/local/auth_token_local_data_source.dart';
import 'package:myfitbro/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

///
/// Infrastructure dependencies
///
@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {

  final authClient = ref.watch(supabaseClientProvider).auth;
  final prefs = ref.read(sharedPreferencesProvider).valueOrNull;
  if (prefs == null) {
    throw 'Shared preferences not initialized';
  }
  return AuthRepository(
    AuthTokenLocalDataSource(
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
