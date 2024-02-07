import 'dart:developer';

import 'package:myfitbro/features/auth/domain/entities/user_entity.dart';
import 'package:myfitbro/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:myfitbro/features/auth/infrastructure/datasources/local/auth_token_local_data_source.dart';
import 'package:myfitbro/features/common/domain/failures/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

/// Repository that handles authorization and persists session
class AuthRepository implements AuthRepositoryInterface {
  /// Default constructor
  AuthRepository(this.authTokenLocalDataSource, this.authClient);

  /// local token storage provider
  final AuthTokenLocalDataSource authTokenLocalDataSource;

  /// Exposes Supabase auth client to allow Auth Controller to subscribe to auth changes
  final supabase.GoTrueClient authClient;

  /// Current authorized User
  UserEntity? get currentUser => authClient.currentUser == null
      ? null
      : UserEntity.fromJson(authClient.currentUser!.toJson());

  /// Returns Stream with auth user changes
  @override
  void authStateChange(
    void Function(UserEntity? userEntity) callback,
  ) {
    authClient.onAuthStateChange.listen((data) {
      switch (data.event) {
        case supabase.AuthChangeEvent.signedIn:
        case supabase.AuthChangeEvent.userUpdated:
        case supabase.AuthChangeEvent.initialSession
            when data.session?.user != null:
        case supabase.AuthChangeEvent.mfaChallengeVerified:
          callback(
            UserEntity.fromJson(data.session!.user.toJson()),
          );

          break;
        case supabase.AuthChangeEvent.signedOut:
        case supabase.AuthChangeEvent.userDeleted:
          callback(null);
          break;
        case supabase.AuthChangeEvent.passwordRecovery:
        case supabase.AuthChangeEvent.tokenRefreshed:
        default:
          break;
      }
    });
  }

  /// Set token to local
  @override
  Future<Either<Failure, UserEntity>> setSession(String token) async {
    try {
      final response = await authClient.setSession(token);
      await authTokenLocalDataSource
          .store(response.session?.providerToken ?? '');

      final user = response.user;

      if (user == null) {
        await authTokenLocalDataSource.remove();
        return left(const Failure.unauthorized());
      }

      return right(UserEntity.fromJson(user.toJson()));
    } catch (_) {
      return left(const Failure.unauthorized());
    }
  }

  /// Recovers session from local storage and refreshes tokens
  @override
  Future<Either<Failure, UserEntity>> restoreSession() async {
    try {
      final res = authTokenLocalDataSource.get();
      if (res.isLeft()) {
        return left(const Failure.empty());
      }

      final response =
          await authClient.recoverSession(res.getOrElse((_) => ''));
      final user = response.user;

      if (user == null) {
        await authTokenLocalDataSource.remove();
        return left(const Failure.unauthorized());
      }

      await authTokenLocalDataSource
          .store(response.session?.providerToken ?? '');

      return right(UserEntity.fromJson(user.toJson()));
    } catch (_) {
      return left(const Failure.unauthorized());
    }
  }

  // singup method
  Future<Either<Failure, bool>> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    log('signup');
    //final res = 
    await authClient.signUp(
      email: email,
      password: password,
      data: {'username': username},
    );
    /*
    if (!res) {
      return left(const Failure.badRequest());
    }
    */
    return right(true);
  }

  // VerifyCode
  Future<Either<Failure, bool>> verifyOtp(
      {required String email, required String token}) async {
    log('otp code');
    await authClient.verifyOTP(
        email: email, token: token, type: supabase.OtpType.signup);
    /*
    final res = await authClient.verifyOTP(
        email: email, token: code, type: supabase.OtpType.signup);
    if (!res) {
      return left(const Failure.badRequest());
    }
    */
    return right(true);
  }

  // Login method
  Future<Either<Failure, bool>> signIn(
      {required String email, required String password}) async {
    log('login method');
    await authClient.signInWithPassword(email: email, password: password);
    /*
    final res =
        await authClient.signInWithPassword(email: email, password: password);
    if (!res) {
      return left(const Failure.badRequest());
    }
    */
    return right(true);
  }

  /// SignIn user with Third party Google
  @override
  Future<Either<Failure, bool>> signInWithGoogle() async {
    log('here2');
    final res = await authClient.signInWithOAuth(
      supabase.OAuthProvider.google,
    );
    if (!res) {
      return left(const Failure.badRequest());
    }
    return right(true);
  }

  /// Signs out user from the application
  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      await authTokenLocalDataSource.remove();

      await authClient.signOut();
      return right(true);
    } catch (_) {
      return left(const Failure.badRequest());
    }
  }
}
